import 'package:car_controller_repository/car_controller_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class CarControllerRepositoryInitializer {
  static Future<CarControllerRepository> initialize({
    required FirebaseOptions firebaseOptions,
    FirebaseDatabase? firebaseDatabase,
  }) async {
    try {
      await Firebase.initializeApp(options: firebaseOptions);

      return CarControllerRepository(
        firebaseDatabase: firebaseDatabase ?? FirebaseDatabase.instance,
      );
    } catch (exception) {
      rethrow;
    }
  }
}
