import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPermissionPageTest extends StatefulWidget {
  const CameraPermissionPageTest({super.key});

  @override
  State<CameraPermissionPageTest> createState() =>
      _CameraPermissionPageTestState();
}

class _CameraPermissionPageTestState extends State<CameraPermissionPageTest> {

  File? _image; // 선택 이미지 파일 저장할 변수
  final ImagePicker _picker = ImagePicker(); // 이미지 선택을 위한 인스턴스
  List<File> _fileList = []; // 선택한 파일 담아줄 list
  bool is_loading = false; // 로딩중일때 표시.

  // 갤러리에서 이미지를 선택하는 메소드
  Future<void> _pickImageFromGallery() async {
    XFile? pickerFile = await _picker.pickImage(source: ImageSource.gallery);

    // 선택된 파일 있을 경우
    if (pickerFile != null) {
      setState(() {
        _image = File(pickerFile.path);
        _fileList.add(File(pickerFile.path)); // 리스트에 추가
      });
    }
  }

  // 카메라로 사진을 촬영하는 메소드
  Future<void> _pickImageFromCamera() async {
    // 카메라로 사진을 찍도록 요청
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    // 촬영한 파일이 있을 경우
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Expanded(
              child:
              Row(
                  children: [
          ElevatedButton(
              onPressed: _pickImageFromGallery, child: Text("갤러리에서 사진 선택")),

          ElevatedButton(
            onPressed: _pickImageFromCamera, child: Text("카메라로 사진 촬영")),
              Column(
                children:
                _fileList.map((image) {
                  return GestureDetector(
                    child:
                      Image.file(image, width: 30,height: 30,),
                    onTap: () {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text("미리보기"),
                          content: Image.file(image),
                          actions: [
                            TextButton(onPressed: (){
                              showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  title: Text("이미지 삭제"),
                                  content: Text("정말로 이 이미지를 삭제하시겠습니까 ? "),
                                  actions: [
                                    TextButton(onPressed: () {

                                      setState(() { // 삭제할 때 state 에 반영 !
                                        _fileList.remove(image);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      });
                                    }, child: Text("삭제")),

                                    TextButton(onPressed: () {
                                      Navigator.pop(context);
                                    }, child: Text("취소"))
                                  ],
                                );
                              });
                            } , child: Text("이미지 삭제"))
                          ],
                        );
                      });
                    },
                  );
                }).toList(),
              )
    ],
    )
    )
    ])
    );

  }
}
