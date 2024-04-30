import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:state_management_getx/controllers/update_controller.dart';
import 'package:state_management_getx/models/post_model.dart';


class UpdatePage extends StatefulWidget {
 final Post post;
  const UpdatePage({super.key,required this.post});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  final updateController = Get.find<UpdateController>();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateController.titleController.text=widget.post.title!;
    updateController.bodyController.text=widget.post.body!;
  }



  @override
  Widget build(BuildContext context) {
    // keyvord ekran hohlagan joyini bossa yo'qolad
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Update Post"),
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: updateController.titleController,
                  decoration: InputDecoration(
                      hintText: "Title"
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller: updateController.bodyController,
                  decoration: InputDecoration(
                      hintText: "Body"
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      updateController.updatePost(widget.post);
                    },
                    child: Text("Update"),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
