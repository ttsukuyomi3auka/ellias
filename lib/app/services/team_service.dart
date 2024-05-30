import 'package:ellias/app/models/teams.dart';
import 'package:get/get.dart';

class TeamService extends GetxService {
  final _teams = RxList<Team>.empty();

  RxList<Team> get teams => _teams;
  static TeamService get to => Get.find();

  void addTeam(String teamName) {
    teams.add(Team(teamName));
  }

  void changeTeam(int index, String newValue) {
    var temp = Team(newValue);
    teams.removeAt(index);
    teams.insert(index, temp);
  }

  void deleteTeam(String teamName) {
    teams.removeWhere((el) => el.teamName == teamName);
  }
}
