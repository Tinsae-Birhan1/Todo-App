import 'dart:convert';

List<TodoModel> TodoModelFromJson(String str) =>
    List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromJson(x)));
String TodoModelToJson(List<TodoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModel {
  String createdAt;
  String name;
  String description;
  bool status;
  String id;

  TodoModel({
    required this.createdAt,
    required this.name,
    required this.description,
    required this.status,
    required this.id,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        createdAt: json["createdAt"] ?? '12:00',
        name: json["name"] ?? 'Abl',
        description: json["description"] ?? 'Software Developer',
        status: json["status"] ?? 'true',
        id: json["id"] ?? '123',
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "name": name,
        "description": description,
        "status": status,
        "id": id,
      };
}
