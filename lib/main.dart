import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_getx/config/root_binding.dart';
import 'package:state_management_getx/pages/home_page.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      initialBinding: RootBinding(),
    );

  }
}


