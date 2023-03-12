import 'dart:convert';

PostDetailModel postDetailModelFromJson(String str) =>
    PostDetailModel.fromJson(json.decode(str));

String postDetailModelToJson(PostDetailModel data) =>
    json.encode(data.toJson());

class PostDetailModel {
  PostDetailModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory PostDetailModel.fromJson(Map<String, dynamic> json) =>
      PostDetailModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
