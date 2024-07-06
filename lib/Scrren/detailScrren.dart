import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../utils/modalclss.dart';

class Upadat extends StatefulWidget {
  const Upadat({super.key});

  @override
  State<Upadat> createState() => _UpadatState();
}

class _UpadatState extends State<Upadat> {
  @override
  Widget build(BuildContext context) {
    ImagePicker imagePicker = ImagePicker();
    TextEditingController StudentName =
        TextEditingController(text: StudentsData[SelctedIndex].student_name);
    TextEditingController Std = TextEditingController(
        text: StudentsData[SelctedIndex].student_standard.toString());
    TextEditingController Grid = TextEditingController(
        text: StudentsData[SelctedIndex].student_grid.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stdunt Data',
          style: TextStyle(color: Colors.grey, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Form(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      XFile? xFileImage = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      setState(() {
                        if (xFileImage != null) {
                          fileImage2 = File(xFileImage!.path);
                          StudentsData[SelctedIndex].student_image = fileImage2;
                        }
                      });
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: StudentsData[SelctedIndex]
                                  .student_image !=
                              null
                          ? FileImage(StudentsData[SelctedIndex].student_image)
                          : null,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: StudentName,
                    autocorrect: true,
                    decoration: InputDecoration(
                        label: Text(' Student Name'),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Fill The Field';
                      }
                    },
                    controller: Std,
                    autocorrect: true,
                    decoration: InputDecoration(
                        label: Text('Std'),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Fill The Field';
                      }
                    },
                    controller: Grid,
                    autocorrect: true,
                    decoration: InputDecoration(
                        label: Text('Grid'),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {});
                        StudentsData[SelctedIndex].student_grid = Grid.text;
                        StudentsData[SelctedIndex].student_image = fileImage2;
                        StudentsData[SelctedIndex].student_standard = Std.text;
                        StudentsData[SelctedIndex].student_name =
                            StudentName.text;
                      },
                      child: Text(
                        'Submited',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

File? fileImage2;
