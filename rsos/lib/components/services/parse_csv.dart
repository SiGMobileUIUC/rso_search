import 'dart:io';
import 'package:csv/csv.dart';

class Course {
  String id;
  String title;
  String description;

  Course({required this.id, required this.title, required this.description});

  factory Course.fromCsv(List<dynamic> row) {
    return Course(
      id: row[0],
      title: row[1],
      description: row[2],
    );
  }
}

class CourseParser {
  List<Course> parseCourses(String csvContent) {
    List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter().convert(csvContent);
    rowsAsListOfValues.removeAt(0); // Assuming the first row is a header
    return rowsAsListOfValues.map((row) => Course.fromCsv(row)).toList();
  }
}

void main() async {
  // Assume 'EventSummary_data.csv' and 'Clubs_data.csv' are in your project's root
  final courseFile = File('EventSummary_data.csv');
  final clubFile = File('Clubs_data.csv'); //this is like the club data that we need to get
  
  List<String> clubTitles = [];

  if (await clubFile.exists()) {
    final clubCsvContent = await clubFile.readAsString();
    final parser = CourseParser();
    clubTitles = parser.parseCourses(clubCsvContent).map((c) => c.title).toList();
  }

  if (await courseFile.exists()) {
    final courseCsvContent = await courseFile.readAsString();
    final parser = CourseParser();
    final courses = parser.parseCourses(courseCsvContent);

    // Filter and display only the courses that are clubs
    for (var course in courses.where((c) => clubTitles.contains(c.title))) {
      print('Club ID: ${course.id}, Name: ${course.title}, Description: ${course.description}');
    }
  } else {
    print('Course file not found');
  }
}

