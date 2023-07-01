import 'package:provider/provider.dart';
import 'package:task_project/src/controllers/c_controllers.dart';
import 'package:task_project/src/data/repository/r_repository.dart';
import 'package:task_project/src/data/use_cases/uc_use_cases.dart';
import 'package:provider/single_child_widget.dart';


class Injector {
  static List<SingleChildWidget> dependencies = [
    ChangeNotifierProvider(
      create: (_) => TasksController(
        getTasksUseCase: GetTasksUseCase(
          repository: TaskRepository(),
        ),
      ),
    )
  ];
}
