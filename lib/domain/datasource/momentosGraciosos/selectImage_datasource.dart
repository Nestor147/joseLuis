import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class SelectImageDataSource{
  Future<XFile?> getImage();
  Future<bool> uploadImage(File image);
}