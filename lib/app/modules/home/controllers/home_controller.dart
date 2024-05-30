import 'package:ellias/app/models/game.dart';
import 'package:ellias/app/models/teams.dart';
import 'package:ellias/app/services/team_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Team> teams = TeamService.to.teams;
  TextEditingController textController = TextEditingController();
  int pointsGame = 10;

  @override
  void onInit() {
    super.onInit();
  }

  void addTeam() {
    TeamService.to.addTeam(textController.text);
    textController.clear();
  }

  void changeTeam(int index) {
    TeamService.to.changeTeam(index, textController.text);
    textController.clear();
  }

  void deleteTeam() {
    TeamService.to.deleteTeam(textController.text);
    textController.clear();
  }

  void startGame() {
    Game(pointsGame, teams);
    
  }
}
