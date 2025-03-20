import 'package:flutter/material.dart';
import 'package:flutter_hw1/EX-1-START-CODE/models/course.dart';
import 'package:flutter_hw1/EX-1-START-CODE/repository/courses_mock_repository.dart';

class CoursesProvider with ChangeNotifier {
  // Repository to fetch course data
  final CoursesMockRepository CoursesRepo = CoursesMockRepository();

  List<Course> _courses = []; // Initialize with an empty list
  List<Course> get courses => _courses; // Getter to access courses

  // Constructor to fetch courses
  CoursesProvider() {
    _courses = CoursesRepo.getCourses();
  }

  // Find a course by its name
  Course getCourseFor(String courseId) {
    return _courses.firstWhere((course) => course.name == courseId);
  }

  // Add score to a course and notify listeners
  void addScore(String courseId, CourseScore score) {
    final course = getCourseFor(courseId);
    course.addScore(score);
    notifyListeners();
  }
}
