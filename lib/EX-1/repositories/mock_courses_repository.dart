import 'package:week6/EX-1/models/course.dart';
import 'package:week6/EX-1/repositories/courses_repository.dart';

class MockCoursesRepository implements CoursesRepository {
  final List<Course> courses = [
    Course(id: "CS1", name: "Mobile Development"),
    Course(id: "CS2", name: "Web Development"),
  ];

  @override
  List<Course> getCourses() {
    return courses;
  }

  @override
  void addScore({required String courseId, required CourseScore courseScore}) {
    try {
      final course = courses.firstWhere((c) => c.id == courseId);
      course.addScore(courseScore);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Course getCourseFor({required String courseId}) {
    try {
      final course = courses.firstWhere((c) => c.id == courseId);
      return course;
    } catch (e) {
      throw Exception(e);
    }
  }
}
