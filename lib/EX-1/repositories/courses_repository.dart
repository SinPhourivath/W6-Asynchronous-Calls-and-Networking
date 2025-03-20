import 'package:week6/EX-1/models/course.dart';

abstract class CoursesRepository {
  getCourses() {}

  getCourseFor({required String courseId}) {}

  addScore({required String courseId, required CourseScore courseScore}) {}
}
