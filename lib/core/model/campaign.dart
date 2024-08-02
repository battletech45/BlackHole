import 'package:cloud_firestore/cloud_firestore.dart';

class CampaignModel {
  String id;
  String imageUrl;
  String title;
  String content;
  String date;

  CampaignModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.date,
  });

  // Convert a News object into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'content': content,
      'date': date,
    };
  }

  // Create a News object from a JSON map.
  factory CampaignModel.fromDocument(DocumentSnapshot doc) {
    return CampaignModel(
      id: doc['id'],
      imageUrl: doc['imageUrl'],
      title: doc['title'],
      content: doc['content'],
      date: doc['date'],
    );
  }
}
