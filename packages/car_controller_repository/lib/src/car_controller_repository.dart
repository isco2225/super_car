import 'dart:async';

import 'package:car_controller_repository/car_controller_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_database/firebase_database.dart';
import 'package:fpdart/fpdart.dart';
import 'package:super_car/errors/typedefs.dart';

import 'constants/constants.dart';

class CarControllerRepository {
  CarControllerRepository({
    required FirebaseDatabase firebaseDatabase,
  }) : _firebaseDatabase = firebaseDatabase {
    tempStream.listen((newTemp) {
      temp = newTemp;
    });
    humStream.listen((newHum) {
      hum = newHum;
    });
  }
  // Data Manipulation
  final _streamController = StreamController<int>.broadcast();
  final _streamController2 = StreamController<int>.broadcast();

  Stream<int> get tempStream => _streamController.stream;
  Stream<int> get humStream => _streamController2.stream;

  int temp = 0;
  int hum = 0;

  final FirebaseDatabase _firebaseDatabase;

  FutureUnit goForward() async {
    try {
      final ref = _firebaseDatabase
          .ref()
          .child(ControlCarRepositoryStrings.movementCollectionPath);
      // İleri gitme komutu 1 olarak ayarlanıyor
      await ref.set(CarControllerRepositoryIntagers.goForwardValue);
      print('movement 1.');
      return const Right(unit); // Başarılı bir şekilde gönderildiğini belirt
    } catch (e) {
      print('Hata oluştu: $e');
      // Hata oluştuğunda bir Left dönüşü yapılıyor
      return const Left(CarControllerRepositoryException.unknown());
    }
  }

  FutureUnit goBackward() async {
    try {
      final ref = _firebaseDatabase
          .ref()
          .child(ControlCarRepositoryStrings.movementCollectionPath);
      // İleri gitme komutu 1 olarak ayarlanıyor
      await ref.set(CarControllerRepositoryIntagers.goBackwardValue);
      print('movement 2.');
      return const Right(unit); // Başarılı bir şekilde gönderildiğini belirt
    } catch (e) {
      print('Hata oluştu: $e');
      // Hata oluştuğunda bir Left dönüşü yapılıyor
      return const Left(CarControllerRepositoryException.unknown());
    }
  }

  FutureUnit directionRight() async {
    try {
      final ref = _firebaseDatabase
          .ref()
          .child(ControlCarRepositoryStrings.directionCollectionPath);
      // İleri gitme komutu 1 olarak ayarlanıyor
      await ref.set(CarControllerRepositoryIntagers.directionRightValue);
      print('direction 1.');
      return const Right(unit); // Başarılı bir şekilde gönderildiğini belirt
    } catch (e) {
      print('Hata oluştu: $e');
      // Hata oluştuğunda bir Left dönüşü yapılıyor
      return const Left(CarControllerRepositoryException.unknown());
    }
  }

  FutureUnit directionLeft() async {
    try {
      final ref = _firebaseDatabase
          .ref()
          .child(ControlCarRepositoryStrings.directionCollectionPath);
      // İleri gitme komutu 1 olarak ayarlanıyor
      await ref.set(CarControllerRepositoryIntagers.directionLeftValue);
      print('direction 2.');
      return const Right(unit); // Başarılı bir şekilde gönderildiğini belirt
    } catch (e) {
      print('Hata oluştu: $e');
      // Hata oluştuğunda bir Left dönüşü yapılıyor
      return const Left(CarControllerRepositoryException.unknown());
    }
  }

  FutureUnit clearDirection() async {
    try {
      final ref = _firebaseDatabase
          .ref()
          .child(ControlCarRepositoryStrings.directionCollectionPath);
      // İleri gitme komutu 1 olarak ayarlanıyor
      await ref.set(CarControllerRepositoryIntagers.clearDirectionValue);
      print('direction cleared.');
      return const Right(unit); // Başarılı bir şekilde gönderildiğini belirt
    } catch (e) {
      print('Hata oluştu: $e');
      // Hata oluştuğunda bir Left dönüşü yapılıyor
      return const Left(CarControllerRepositoryException.unknown());
    }
  }

  FutureUnit clearMovement() async {
    try {
      final ref = _firebaseDatabase
          .ref()
          .child(ControlCarRepositoryStrings.movementCollectionPath);
      // İleri gitme komutu 1 olarak ayarlanıyor
      await ref.set(CarControllerRepositoryIntagers.clearMovementValue);
      print('direction cleared.');
      return const Right(unit); // Başarılı bir şekilde gönderildiğini belirt
    } catch (e) {
      print('Hata oluştu: $e');
      // Hata oluştuğunda bir Left dönüşü yapılıyor
      return const Left(CarControllerRepositoryException.unknown());
    }
  }

  FutureUnit gear({required int gear}) async {
    try {
      final ref = _firebaseDatabase
          .ref()
          .child(ControlCarRepositoryStrings.gearCollectionPath);
      // İleri gitme komutu 1 olarak ayarlanıyor
      await ref.set(gear);
      return const Right(unit); // Başarılı bir şekilde gönderildiğini belirt
    } catch (e) {
      print('Hata oluştu: $e');
      // Hata oluştuğunda bir Left dönüşü yapılıyor
      return const Left(CarControllerRepositoryException.unknown());
    }
  }

  FutureEither<bool> checkConnectionStatus() async {
    try {
      final ref = _firebaseDatabase
          .ref()
          .child(ControlCarRepositoryStrings.connectionStatusCollectionPath);
      // İleri gitme komutu 1 olarak ayarlanıyor
      final isConnected = await ref.get();
      if (isConnected.value == true) {
        return const Right(true);
      } else if (isConnected.value == false) {
        return const Right(false);
      } else {
        return const Left(CarControllerRepositoryException.unknown());
      }
    } catch (e) {
      print('Hata oluştu: $e');
      return const Left(CarControllerRepositoryException.unknown());
    }
  }

  FutureUnit watchTemperature() async {
    try {
      final ref = _firebaseDatabase
          .ref()
          .child(ControlCarRepositoryStrings.temperatureCollectionPath);
      ref.onValue.listen((event) {
        final temp = event.snapshot.value;
        if (temp is int) {
          _streamController.sink.add(temp);
        }
      });
      return const Right(unit);
    } catch (e) {
      print('Hata oluştu: $e');

      return const Left(CarControllerRepositoryException.unknown());
    }
  }

  FutureUnit watchHumidity() async {
    try {
      final ref = _firebaseDatabase
          .ref()
          .child(ControlCarRepositoryStrings.humadityCollectionPath);
      ref.onValue.listen((event) {
        final hum = event.snapshot.value;
        if (hum is int) {
          _streamController2.sink.add(hum);
        }
      });
      return const Right(unit);
    } catch (e) {
      print('Hata oluştu: $e');

      return const Left(CarControllerRepositoryException.unknown());
    }
  }
}
