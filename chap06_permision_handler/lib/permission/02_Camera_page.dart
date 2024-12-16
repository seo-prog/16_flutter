import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPermissionPage extends StatefulWidget {
  const CameraPermissionPage({super.key});

  @override
  State<CameraPermissionPage> createState() => _CameraPermissionPageState();
}

class _CameraPermissionPageState extends State<CameraPermissionPage> {
  // ? -> 입력 전 null
  File? _image; // 선택된 이미지 파일을 저장할 변수.
  final ImagePicker _picker = ImagePicker(); // 이미지 선택을 위한 인스턴스

  // 갤러리에서 이미지를 선택하는 메소드
  Future<void> _pickImageFromGallery() async {
    /*
    * Xfile 은 flutter 에서 주로 파일 선택기나 이미지 파일을 다룰 떄 사용하는 파일 처리 클래스이다.
    * File 과 유사하지만, 다양한 파일 작업을 수행할 수 있다.
    * */
    XFile? pickerFile = await _picker.pickImage(source: ImageSource.gallery);

    // 선택된 파일이 있을 경우
    if (pickerFile != null) {
      setState(() {
        _image = File(pickerFile.path);
      });
    }
  }

  // 카메라로 사진을 촬영하는 메소드
  Future<void> _pickImageFromCamera() async{
    // 카메라로 사진을 찍도록 요청
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    // 촬영한 파일이 있을 경우
    if(pickedFile != null){
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _image == null ? Text("사진을 선택하세욧 !") : Image.file(_image!),
          // ! -> ! 는 null 아니라고 선언해주는 느낌 ?
          SizedBox(
            height: 20,
          ),
          // 갤러리에서 선택하는 버튼
          ElevatedButton(
              onPressed: _pickImageFromGallery, child: Text("갤러리에서 사진 선택")),

          ElevatedButton(
              onPressed: _pickImageFromCamera, child: Text("카메라로 사진 촬영"))
        ],
      ),
    );
  }
}
