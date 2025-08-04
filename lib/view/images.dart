import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/imageVM.dart';
class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final imageVM = Get.put(ImageViewModel());
  @override
  void initState() {
    super.initState();
    imageVM.getImage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Screen"),
        centerTitle: true,
      ),
      body: Obx(()=>Column(
          children: [
            Visibility(visible:false , child: Text("${imageVM.updater.value} ")),
            imageVM.image!=null?
            Image(image: FileImage(imageVM.image!),):Text("no image"),
            ElevatedButton(onPressed: (){
              imageVM.selectImage();
            }, child: const Text("Select Image"))
          ]
        ),
      )
    );
  }
}
