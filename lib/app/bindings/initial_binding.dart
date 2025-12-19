import 'package:get/get.dart';
import '../../data/providers/api_provider.dart';
import '../../services/storage_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StorageService>(() => StorageService());
    Get.lazyPut<ApiProvider>(() => ApiProvider());
  }
}