import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

/*
* CircularProgressIndicator() // 로딩
* */

class _ProjectState extends State<Project> {
  List<File> _images = [];
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  Future<void> _pickImageFromGallery() async {
    setState(() {
      _isLoading = true;
    });

    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _isLoading = false;
        _images.add(File(pickedFile.path));
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    setState(() {
      _isLoading = true;
    });

    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _isLoading
              ? CircularProgressIndicator()
              : _images.isEmpty
                  ? Text("사진을 선택하세요")
                  : Column(
                      children: _images.map((image) {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("미리보기"),
                                    content: Image.file(image),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text("이미지 삭제"),
                                                    content: Text(
                                                        "정말로 이 이미지를 삭제하시겠습니까?"),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              _images.remove(
                                                                  image);
                                                            });

                                                            Navigator.pop(
                                                                context);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("삭제")),
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text("취소")),
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Center(child: Text("이미지 삭제")))
                                    ],
                                  );
                                });
                          },
                          child: Image.file(
                            image,
                            width: 100,
                            height: 100,
                          ),
                        );
                      }).toList(),
                    ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: _pickImageFromGallery, child: Text("갤러리에서 사진 선택")),
          ElevatedButton(
              onPressed: _pickImageFromCamera, child: Text("카메라로 사진 찍기")),
        ],
      ),
    );
  }
}
