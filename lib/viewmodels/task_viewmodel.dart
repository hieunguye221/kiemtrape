import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/database_helper.dart';
import '../models/task_model.dart';

part 'task_viewmodel.g.dart';

@riverpod
class TaskListViewModel extends _$TaskListViewModel {
  @override
  Future<List<TaskModel>> build() async {
    return await DatabaseHelper.instance.getTasks();
  }

  Future<void> addTask(TaskModel task) async {
    await DatabaseHelper.instance.insertTask(task);
    ref.invalidateSelf();
  }

  Future<void> updateTask(TaskModel task) async {
    await DatabaseHelper.instance.updateTask(task);
    ref.invalidateSelf();
  }

  Future<void> deleteTask(int id) async {
    await DatabaseHelper.instance.deleteTask(id);
    ref.invalidateSelf();
  }
}
