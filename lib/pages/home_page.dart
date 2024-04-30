

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_getx/controllers/home_controller.dart';
import 'package:state_management_getx/views/item_of_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<HomeController>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.loadPosts();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Networking"),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller){
          return Stack(
            children: [
              RefreshIndicator(
                onRefresh: controller.handleRefresh,
                child: ListView.builder(
                  itemCount: controller.posts.length,
                  itemBuilder: (ctx, index) {
                    return itemOfPost(controller.posts[index], controller);
                  },
                ),
              ),
              controller.isLoading
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : SizedBox.shrink(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          controller.callCreatePage();
        },
      ),
    );
  }


}