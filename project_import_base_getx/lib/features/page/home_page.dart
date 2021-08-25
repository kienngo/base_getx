import 'package:base_getx/core/base_controller.dart';
import 'package:base_getx/core/base_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:project_import_base_getx/features/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: BaseScreenView(
        addSafeArea: true,
        child: Container(
          child: Text(controller.data.value),
        ),
      ),
    );
  }
}
