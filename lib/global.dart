import 'package:bloc_app/common/services/storage_service.dart';
import 'package:firebase_core/firebase_core.dart';

import 'common/services/storage_service.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    await Firebase.initializeApp();
    storageService = await StorageService().init();
  }
}
