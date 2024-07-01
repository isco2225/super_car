import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:remote_database/remote_database.dart';
import 'package:super_car/errors/errors.dart';
import 'package:super_car/errors/typedefs.dart';

import '../consumer_repository.dart';
import 'constants/constants.dart';

class ConsumerRepository {
  ConsumerRepository({
    required RemoteDatabase remoteDatabase,
  })  : _remoteDatabase = remoteDatabase,
        super() {
    currentConsumerStream.listen((event) {
      currentConsumer = event;
    });
  }

  // Apis
  final RemoteDatabase _remoteDatabase;

  // VARIABLES
  // Current Consumer
  final _currentConsumerStreamController =
      StreamController<Consumer?>.broadcast();
  Stream<Consumer?> get currentConsumerStream =>
      _currentConsumerStreamController.stream;
  Consumer? currentConsumer;
  // Cached Consumers
  final _cachedConsumers =
      <String, ({DateTime endDate, Consumer cachedConsumer})>{};

  // FUNCTIONS
  FutureUnit createCurrentConsumer({
    required String authId,
    required String firstName,
    required String lastName,
    required String carName,
    String? email,
  }) async {
    // TODO
    // CONTROL ALL INPUT VALUES
    try {
      final creatableConsumer = Consumer(
        authId: authId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        carName: carName,
        isDeletingAccount: false,
        state: ConsumerState.hasData,
      );
      _remoteDatabase.batchSetDoc(
        collectionID: ConsumerRepositoryStrings.consumerCollectionPath,
        documentID: authId,
        jsonData: creatableConsumer.toJson(),
      );

      await _remoteDatabase.batchCommit();
      _currentConsumerStreamController.sink.add(creatableConsumer);

      return const Right(unit);
    } catch (exception) {
      // if (exception is FirebaseException) {
      //   throw _firebaseExceptionToUserException(exception);
      // }
      return const Left(ConsumerRepositoryException.unknown());
    }
  }

  FutureUnit initCurrentConsumer({
    required String authId,
  }) async {
    // CONTROL ALL INPUT VALUES

    try {
      final consumerDoc = await _remoteDatabase.readDoc(
        collectionID: ConsumerRepositoryStrings.consumerCollectionPath,
        documentID: authId,
      );

      if (consumerDoc == null) {
        _currentConsumerStreamController.sink.add(Consumer.needRegister());
        return const Right(unit);
      }

      final currentConsumer = Consumer.fromJson(consumerDoc);
      _currentConsumerStreamController.sink.add(currentConsumer);
      return const Right(unit);
    } catch (exception) {
      return const Left(ConsumerRepositoryException.unknown());
    }
  }

  // FutureUnit updateFullName({
  //   required FirstName firstNameObject,
  //   required LastName lastNameObject,
  // }) async {
  //   try {
  //     if (currentConsumer == Consumer.empty()) {
  //       return left(
  //         const ConsumerRepositoryException.nonEmptyConsumerRequired(),
  //       );
  //     }
  //     final newFirstName = firstNameObject.isValid
  //         ? firstNameObject.value.newFirstName
  //         : currentConsumer.firstName;
  //     final newLastName = lastNameObject.isValid
  //         ? lastNameObject.value.newLastName
  //         : currentConsumer.lastName;
  //     final updatedConsumer = currentConsumer.copyWith(
  //       firstName: newFirstName,
  //       lastName: newLastName,
  //     );
  //     _remoteDatabase.batchUpdateDoc(
  //       collectionID: ConsumerRepositoryStrings.consumerCollectionPath,
  //       documentID: currentConsumer.authId,
  //       jsonData: updatedConsumer.toJson(),
  //     );
  //     sinkCurrentConsumer(consumer: updatedConsumer);
  //     return const Right(unit);
  //   } catch (exception) {
  //     return const Left(ConsumerRepositoryException.unknown());
  //   }
  // }

  Consumer? updateFullName({
    required FirstName firstNameObject,
    required LastName lastNameObject,
  }) {
    if (currentConsumer ==null) {
      return null;
    }
    if (firstNameObject.isNotValid && lastNameObject.isNotValid) {
      return null;
    }
    final newFirstName = firstNameObject.isValid
        ? firstNameObject.value.newFirstName
        : currentConsumer!.firstName;

    final newLastName = lastNameObject.isValid
        ? lastNameObject.value.newLastName
        : currentConsumer!.lastName;
    final updatedConsumer = currentConsumer!.copyWith(
      firstName: newFirstName,
      lastName: newLastName,
    );
    _remoteDatabase.batchUpdateDoc(
      collectionID: ConsumerRepositoryStrings.consumerCollectionPath,
      documentID: currentConsumer!.authId,
      jsonData: updatedConsumer.toJson(),
    );
    return updatedConsumer;
  }

  Consumer updateEmail({
    required String newEmail,
  }) {
    final updatedConsumer = currentConsumer!.copyWith(email: newEmail);
    _remoteDatabase.batchUpdateDoc(
      collectionID: ConsumerRepositoryStrings.consumerCollectionPath,
      documentID: currentConsumer!.authId,
      jsonData: updatedConsumer.toJson(),
    );
    return updatedConsumer;
  }

  FutureEither<Consumer> readConsumer({
    required String authId,
  }) async {
    // Clear Cache
    _cachedConsumers.removeWhere(
      (key, value) => value.endDate.isBefore(DateTime.now()),
    );

    // Get from Cache
    final thisConsumerCache = _cachedConsumers[authId];

    // If Cache is not empty and not expired
    // Return from Cache
    if (thisConsumerCache != null) {
      return Right(_cachedConsumers[authId]!.cachedConsumer);
    }

    // If Cache is empty or expired
    // Get from Remote Database
    try {
      final consumerDoc = await _remoteDatabase.readDoc(
        collectionID: ConsumerRepositoryStrings.consumerCollectionPath,
        documentID: authId,
      );

      if (consumerDoc == null) {
        return const Left(ConsumerRepositoryException.unknown());
      }
      final consumer = Consumer.fromJson(consumerDoc);
      // Add to cache
      _cachedConsumers.addAll({
        authId: (
          cachedConsumer: consumer,
          endDate: DateTime.now().add(const Duration(minutes: 1)),
        ),
      });
      return Right(consumer);
    } catch (exception) {
      return const Left(ConsumerRepositoryException.unknown());
    }
  }

  void sinkCurrentConsumer(
    Consumer? consumer,
  ) {
    _currentConsumerStreamController.sink.add(consumer);
  }

  void clearCurrentConsumer() {
    _currentConsumerStreamController.sink.add(null);
  }
}
