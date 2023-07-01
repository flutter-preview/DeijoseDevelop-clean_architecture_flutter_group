import 'dart:convert';

import "package:http/http.dart" as http;

import 'package:task_project/src/data/models/m_models.dart';
import 'package:task_project/src/data/repository/r_repository.dart';
import 'package:task_project/src/data/use_cases/uc_use_cases.dart';

class GetTasksUseCaseParams extends Params {
  final String name;
  GetTasksUseCaseParams(this.name);
}

class GetTasksUseCase extends UseCase<List<Task>, GetTasksUseCaseParams> {
  TaskRepository repository;
  GetTasksUseCase({required this.repository});

  @override
  Future<List<Task>> call({GetTasksUseCaseParams? params}) async {
    http.Response response = await repository.getTasks(name: params?.name ?? '');
    Map<String, dynamic> jsonResponse = json.decode(response.body);

    List<Task> tasks = [];
    for (var task in jsonResponse['results']){
      tasks.add(Task.fromJson(task));
    }

    if (response.statusCode == 200){
      return tasks;
    } else{
      throw UseCaseException(jsonResponse["message"]);
    }
  }
}
