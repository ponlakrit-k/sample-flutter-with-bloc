import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  String title;
  String subTitle;

  TodoModel({
    required this.title,
    required this.subTitle,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        title: json["title"],
        subTitle: json["subTitle"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle,
      };
}
