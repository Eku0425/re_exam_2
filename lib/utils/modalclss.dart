import 'dart:io';

class Data {
  late String student_name, student_grid, student_standard;
  File? student_image;
  Data(
      {required this.student_grid,
      this.student_image,
      required this.student_name,
      required this.student_standard});
}

List StudentsData = [];

int SelctedIndex = 0;
