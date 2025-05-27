class TaskModel {
  final int? id;

  final String? title;

  final String? dateTime;

  final String? level;

  final bool isDone;

  TaskModel({
    this.id,
    this.title,
    this.dateTime,
    this.level,
    required this.isDone,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
        title: map["title"],
        isDone: map['isDone'] == 0 ? false : true,
        id: map['id'],
        level: map['level'],
        dateTime: map['dateTime']);
  }

  Map<String, dynamic> toMap() {
    return {
      if (title != null) "title": title,
      if (dateTime != null) "dateTime": dateTime,
      if (level != null) "level": level,
      "isDone": isDone ? 1 : 0,
    };
  }
}
