import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/modalclss.dart';
import 'Addpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 2),
      () {
        setState(() {});
      },
    );
    ImagePicker imagePicker = ImagePicker();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home Page',
            style: TextStyle(
              color: Colors.black45,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                StudentsData.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                  child: Card(
                    child: ListTile(
                        leading: GestureDetector(
                          onTap: () async {
                            XFile? xFileImage = await imagePicker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {
                              if (xFileImage != null) {
                                fileImage = File(xFileImage!.path);
                              }
                            });
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: StudentsData[index]
                                        .student_image !=
                                    null
                                ? FileImage(StudentsData[index].student_image)
                                : null,
                          ),
                        ),
                        title: Text(
                            '${StudentsData[index].student_name} ( GR ID : ${StudentsData[index].student_grid} )'),
                        subtitle: Text(
                            'STD : ${StudentsData[index].student_standard}'),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    SelctedIndex = index;
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => AddDataPage(),
                                    ));
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    StudentsData.removeAt(index);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.delete)),
                            ],
                          ),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {});
            StudentsData.add(
              Data(
                  student_grid: '',
                  student_name: '',
                  student_standard: '',
                  student_image: null),
            );
          },
          child: Icon(Icons.add),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     setState(() {
        //
        //     });
        //     StudentsData.add(Data(student_grid: '',student_name: '',student_standard: '',student_image: null),);
        //   },
        //   child: Icon(Icons.abc_outlined),
        // ),
      ),
    );
  }
}

File? fileImage;
