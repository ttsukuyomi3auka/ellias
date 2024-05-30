import 'package:ellias/app/routes/app_pages.dart';
import 'package:ellias/app/services/game_service.dart';
import 'package:ellias/app/services/team_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  initServices();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.HOME,
    getPages: AppPages.routes,
  ));
}

void initServices() {
  Get.put(TeamService());
  Get.put(GameService());
}
