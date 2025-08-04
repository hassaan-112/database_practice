import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

import '../database/database.dart';

class ImageRepository {
  final _db = DBHelper.getInstance;

  Future<File> getImage() async {
    var image = await _db.getImage();

    if (image.isEmpty) {
      throw Exception("No image found in database");
    }

    final tempDir = await getTemporaryDirectory();
    File imgFile = await File('${tempDir.path}/image.PNG').create();
    await imgFile.writeAsBytes(image[0][DBHelper.colImage], flush: true);
    return imgFile;
  }

  Future<bool> addImage({required Uint8List image}) async {
    await _db.deleteAllImages();
    return await _db.addImage(image: image);
  }
}
