import 'package:flutter_hw1/EX-1-START-CODE/models/course.dart';

abstract class CoursesRepository {
  List<Course> getCourses(); // Method to get the list of all courses
  void addScore(
    Course course,
    CourseScore score,
  ); // Method to add a score to a specific course
}
