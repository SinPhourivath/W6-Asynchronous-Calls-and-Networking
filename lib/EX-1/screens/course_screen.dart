import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6/EX-1/provider/courses_provider.dart';
import '../models/course.dart';
import 'course_score_form.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.course});

  final Course course;

  Color scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    CoursesProvider cp = Provider.of<CoursesProvider>(context, listen: true);
    Course selectedCourse = cp.getCourseFor(courseId: course.id);

    // Get the popped courseScore from CourseScoreForm
    // and ask the provider to add the score to the list
    void addScore(BuildContext context) async {
      final CourseScore? courseScore = await Navigator.of(
        context,
      ).push<CourseScore>(
        MaterialPageRoute(builder: (ctx) => const CourseScoreForm()),
      );

      if (courseScore != null) {
        cp.addScore(courseId: selectedCourse.id, courseScore: courseScore);
      }
    }

    Widget content = const Center(child: Text('No Scores added yet.'));

    if (selectedCourse.scores.isNotEmpty) {
      content = ListView.builder(
        itemCount: selectedCourse.scores.length,
        itemBuilder:
            (ctx, index) => ListTile(
              title: Text(selectedCourse.scores[index].studentName),
              trailing: Text(
                selectedCourse.scores[index].studenScore.toString(),
                style: TextStyle(
                  color: scoreColor(selectedCourse.scores[index].studenScore),
                  fontSize: 15,
                ),
              ),
            ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          selectedCourse.name,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => addScore(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
