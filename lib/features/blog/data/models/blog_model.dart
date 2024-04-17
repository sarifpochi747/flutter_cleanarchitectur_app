import 'dart:convert';
import 'package:clean_architecture_tdd/core/utils/typedef.dart';
import 'package:clean_architecture_tdd/features/blog/domain/entities/blog.dart';

class BlogModel extends Blog{
  BlogModel({required super.id, required super.posterId, required super.title, required super.content, required super.imageUrl, required super.topics, required super.updateAt});
  
  DataMap toMap() {
    return {
      'id': id,
      'posterId': posterId,
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'topics': topics,
      'updateAt': updateAt.millisecondsSinceEpoch,
    };
  }

  factory BlogModel.fromMap(DataMap map) {
    return BlogModel(
      id: map['id'] ?? '',
      posterId: map['posterId'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      topics: List<String>.from(map['topics']),
      updateAt: DateTime.fromMillisecondsSinceEpoch(map['updateAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BlogModel.fromJson(String source) => BlogModel.fromMap(json.decode(source));


}