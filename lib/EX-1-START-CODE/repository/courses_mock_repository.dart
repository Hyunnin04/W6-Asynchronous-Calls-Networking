import '../models/course.dart';

class CoursesMockRepository {
  //1- List of all available courses
  final List<Course> _allCourses = [ 
    Course(name: 'HTML'),
    Course(name: 'JAVA'),
  ];

  //2- Get the list of all courses
  List<Course> getCourses() {
    return _allCourses;
  }

  //3- Find a course by its name
  Course getCourseFor(String courseId) {
    return _allCourses.firstWhere((course) => course.name == courseId);
  }

  //4- Add a score to a specific course
  void addScore(String courseId, CourseScore score) {
    final course = getCourseFor(courseId);
    course.addScore(score);
  }
}
