import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../controllers/creat_controller.dart';


class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final createController = Get.find<CreateController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Creat Post"),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: createController.titleController,
                decoration: InputDecoration(
                    hintText: "Title"
                ),
              ),
            ),
            Container(
              child: TextField(
                controller: createController.bodyController,
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
                    createController.createPost();
                  },
                  child: Text("Creat"),
                )
            ),
          ],
        ),
      ),
    );
  }
}