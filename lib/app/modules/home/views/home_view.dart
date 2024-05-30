import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбор команд'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: Obx(() => ListView.builder(
                itemCount: controller.teams.length,
                itemBuilder: (context, index) {
                  var team = controller.teams[index];
                  return Center(
                      child: InkWell(
                          onTap: () {
                            controller.textController.text = team.teamName;
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Название команды"),
                                    content: Column(
                                      children: [
                                        TextField(
                                          controller: controller.textController,
                                          onEditingComplete: () {
                                            controller.changeTeam(index);
                                          },
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder()),
                                        )
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text("Отмена"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          controller.changeTeam(index);
                                          Get.back();
                                        },
                                        child: const Text("Изменить"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          controller.deleteTeam();
                                          Get.back();
                                        },
                                        child: const Text("Удалить"),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Text(team.teamName)));
                },
              )),
        ),
        ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Введите название команды"),
                      content: Column(
                        children: [
                          TextField(
                            controller: controller.textController,
                            onEditingComplete: () {
                              controller.addTeam();
                            },
                            decoration: const InputDecoration(
                                hintText: "название",
                                border: OutlineInputBorder()),
                          )
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("Отмена"),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.addTeam();
                            Get.back();
                          },
                          child: const Text("Добавить"),
                        ),
                      ],
                    );
                  });
            },
            child: const Text("Добавить команду")),
      ]),
    );
  }
}
