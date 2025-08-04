import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../repository/imageRepo.dart';

class ImageViewModel extends GetxController{
  final _imageRepo = ImageRepository();

  File ?image = null;
  Uint8List ?imageBytes;
  RxBool updater = false.obs;
  Future<void> selectImage()async{
    print("select image");
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImage!=null){
      image= File(pickedImage.path);
      updater.value=!updater.value;
      await convert_to_base64();
      await addToDBImage();
    }
  }
  Future<void> convert_to_base64()async{
    print("convert to base64");
    imageBytes = image!.readAsBytesSync();
    updater.value=!updater.value;
  }
  Future<void> addToDBImage()async{
    await _imageRepo.addImage(image: imageBytes!);
    updater.value=!updater.value;
  }
  Future<void> getImage()async{
    image = (await _imageRepo.getImage());
    updater.value=!updater.value;
  }


}