import 'package:firebase_core/firebase_core.dart';
import 'package:remote_database_cloud_firestore/remote_database_cloud_firestore.dart';
import 'package:super_car/dependencies/models/apis.dart';

class ApiDependencies {
  ApiDependencies({
    required FirebaseOptions firebaseOptions,
  }) : _firebaseOptions = firebaseOptions;
  final FirebaseOptions _firebaseOptions;
  Future<Apis> init() async {
    //Remute Database
    final remoteDatabase = await CloudFirestoreInitializer.initialize(
      firebaseOptions: _firebaseOptions,
    );
    return Apis(remoteDatabase: remoteDatabase);
  }
}
