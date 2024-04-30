
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:state_management_getx/controllers/creat_controller.dart';
import 'package:state_management_getx/controllers/home_controller.dart';
import 'package:state_management_getx/controllers/update_controller.dart';


class RootBinding implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => UpdateController(), fenix: true);
    Get.lazyPut(() => CreateController(), fenix: true);
}
}