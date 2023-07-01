import "package:http/http.dart" as http;

import 'package:task_project/src/data/repository/r_repository.dart';

class TaskRepository extends BaseRepository {
  Future<http.Response> getTasks({String name = ""}) async {
    return await getRequest(endpoint: "tasks/list/");
  }
}
