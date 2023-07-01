import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_project/src/controllers/c_controllers.dart';
import 'package:task_project/src/data/models/m_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      TasksController controller = context.read<TasksController>();
      controller.getTasks();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TasksController controller = context.watch<TasksController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Home"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getTasks();
        },
        child: controller.tasks == null
            ? const Center(child: CircularProgressIndicator.adaptive())
            : ListView.builder(
                itemCount: controller.tasks!.length,
                itemBuilder: (BuildContext context, int index) {
                  Task task = controller.tasks![index];
                  return ListTile(
                    title: Text(task.name),
                    subtitle: Text(task.description),
                  );
                },
              ),
      ),
    );
  }
}
