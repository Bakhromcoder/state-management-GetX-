
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:state_management_getx/models/post_model.dart';
import 'package:state_management_getx/models/post_res_model.dart';
import 'package:state_management_getx/services/http_service.dart';
import 'package:state_management_getx/services/log_service.dart';



class UpdateController extends GetxController{
  bool isLoading = true;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  updatePost(Post post) async{
    String title = titleController.text.toString().trim();
    String body = bodyController.text.toString().trim();

    isLoading = true;
    update();

    Post newPost=post;
    newPost.title=title;
    newPost.body=body;

    var response = await Network.PUT(
        Network.API_POST_UPDATE + newPost.id.toString(),
        Network.paramsUpdate(newPost));
    LogService.d(response!);
    PostRes postRes=Network.parsePostRes(response);
    backToFinish();
  }

  backToFinish(){
    Get.back(result: true);
  }

}