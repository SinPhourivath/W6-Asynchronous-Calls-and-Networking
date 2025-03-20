import 'package:flutter/cupertino.dart';
import 'package:week6/EX-1/models/course.dart';

import '../repositories/courses_repository.dart';

class CoursesProvider extends ChangeNotifier {
  // I can initalize with real repo if needed
  final CoursesRepository repository;

  CoursesProvider(this.repository);

  List<Course> getCourses() {
    return repository.getCourses();
  }

  Course getCourseFor({required String courseId}) {
    return repository.getCourseFor(courseId: courseId);
  }

  void addScore({required String courseId, required CourseScore courseScore}) {
    repository.addScore(courseId: courseId, courseScore: courseScore);
    notifyListeners();
  }
}
