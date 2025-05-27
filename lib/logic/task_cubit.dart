import 'package:flutter_application_1/todo_app_screens/local_database_helper.dart';
import 'package:flutter_application_1/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  static TaskCubit get(context){
    return BlocProvider.of(context);
  }
  List<TaskModel> taskList = [];
  List<TaskModel> doneTaskList = [];
  List<TaskModel> inProgressTaskList = [];

  LocalDatabaseHelper localDatabaseHelper = LocalDatabaseHelper();

  void initDatabase() async {
    emit(IntDatabaseLoading());
    try {
      await localDatabaseHelper.initDatabase(
          databasePathName: "task_app",
          onCreate: (database, version) async {
            await database.execute('CREATE TABLE tasks ('
                'id INTEGER PRIMARY KEY,'
                'title TEXT,'
                'level TEXT,'
                'dateTime TEXT,'
                'isDone INTEGER)');
          });
      emit(IntDatabaseSuccess());
    } catch (error) {
      emit(IntDatabaseError());
    }
  }

  Future<void> getDoneTaskList() async {
    doneTaskList.clear();
    emit(GetDoneTaskListLoading());
    try {
      final List<Map<String, dynamic>> list = await localDatabaseHelper.getData(
          tableName: "tasks", where: "isDone = 1");
      list.forEach((element) {
        doneTaskList.add(TaskModel.fromMap(element));
      });
      print(list);
      emit(GetDoneTaskListSuccess());
    } catch (error) {
      emit(GetDoneTaskListError());
    }
  }

  Future<void> getInProgressTaskList() async {
    inProgressTaskList.clear();
    emit(GetInProgressTaskListLoading());
    try {
      final List<Map<String, dynamic>> list = await localDatabaseHelper.getData(
          tableName: "tasks", where: "isDone = 0");
      list.forEach((element) {
        inProgressTaskList.add(TaskModel.fromMap(element));
      });

      emit(GetInProgressTaskListSuccess());
    } catch (error) {
      print(error);
      emit(GetInProgressTaskListError());
    }
  }

  Future<void> makeDoneTask({required int taskId}) async {
    emit(MakeDoneTaskLoading());
    try {
      await localDatabaseHelper.updateDatabase(
          values: {"isDone": 1}, tableName: "tasks", query: "id = $taskId");
      emit(MakeDoneTaskSuccess(taskId: taskId));
    } catch (error) {
      emit(MakeDoneTaskError());
    }
  }

  Future<void> removeTask({required int removeId}) async {
    emit(RemoveTaskLoading());
    try {
      await localDatabaseHelper.deleteDatabase(
          tableName: "tasks", query: "id = $removeId");
      emit(RemoveTaskSuccess(removeId: removeId));
    } catch (error) {
      emit(RemoveTaskError());
    }
  }

  Future<void> editTask({required TaskModel taskModel}) async {
    emit(EditTaskListLoading());
    try {
      await localDatabaseHelper.updateDatabase(
          values: taskModel.toMap(),
          tableName: "tasks",
          query: "id = ${taskModel.id}");
      emit(EditTaskListSuccess());
      getInProgressTaskList();
    } catch (error) {
      emit(EditTaskListError());
    }
  }

  Future<void> addNewTask({required TaskModel taskModel}) async {
    emit(AddNewTaskListLoading());
    try {
      await localDatabaseHelper.insertToDatabase(
          values: taskModel.toMap(), tableName: "tasks");
      emit(AddNewTaskListSuccess());
    } catch (error) {
      emit(AddNewTaskListError());
    }
  }
}
