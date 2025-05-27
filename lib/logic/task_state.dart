part of 'task_cubit.dart';

sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class IntDatabaseLoading extends TaskState {}
final class IntDatabaseSuccess extends TaskState {}
final class IntDatabaseError extends TaskState {}

final class GetTaskLoading extends TaskState {}
final class GetTaskSuccess extends TaskState {}
final class GetTaskError extends TaskState {}

final class GetInProgressTaskListLoading extends TaskState {}
final class GetInProgressTaskListSuccess extends TaskState {}
final class GetInProgressTaskListError extends TaskState {}

final class GetDoneTaskListLoading extends TaskState {}
final class GetDoneTaskListSuccess extends TaskState {}
final class GetDoneTaskListError extends TaskState {}


final class MakeDoneTaskLoading extends TaskState {}
final class MakeDoneTaskSuccess extends TaskState {
   final int taskId ;
  MakeDoneTaskSuccess({required this.taskId});
}
final class MakeDoneTaskError extends TaskState {}


final class RemoveTaskLoading extends TaskState {}
final class RemoveTaskSuccess extends TaskState {
  final int removeId ;
  RemoveTaskSuccess({required this.removeId});
}
final class RemoveTaskError extends TaskState {}


final class EditTaskListLoading extends TaskState {}
final class EditTaskListSuccess extends TaskState {}
final class EditTaskListError extends TaskState {}

final class AddNewTaskListLoading extends TaskState {}
final class AddNewTaskListSuccess extends TaskState {}
final class AddNewTaskListError extends TaskState {}

