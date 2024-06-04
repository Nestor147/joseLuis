import 'package:firebase_storage/firebase_storage.dart';

class ImageFunnyMoment {
  // final Reference image;
  final String title;
  final String imageUrl;
  final String description;
  final String userId;

  ImageFunnyMoment( {
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.userId,
  });
}