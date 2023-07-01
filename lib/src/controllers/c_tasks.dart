import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_project/src/data/models/m_models.dart';
import 'package:task_project/src/data/use_cases/uc_use_cases.dart';

class TasksController extends ChangeNotifier {
  List<Task>? tasks;

  GetTasksUseCase getTasksUseCase;
  TasksController({
    required this.getTasksUseCase,
  });

  Future<void> getTasks({String name = ''}) async {
    try {
      final response = await getTasksUseCase.call(
        params: GetTasksUseCaseParams(name),
      );
      tasks = response;
      log("$response");
    } catch (e) {
      log("$e");
    }
    notifyListeners();
  }
}
