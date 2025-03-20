import 'package:flutter/material.dart';
import 'package:flutter_hw1/EX-1-START-CODE/provider/courses_provider.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import 'course_score_form.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key, required this.course});

  final Course course;

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  List<CourseScore> get scores => widget.course.scores;

  void _addScore() async {
    CourseScore? newSCore = await Navigator.of(context).push<CourseScore>(
      MaterialPageRoute(builder: (ctx) => const CourseScoreForm()),
    );

    if (newSCore != null) {
      // setState(() {
      //   scores.add(newSCore);
      // });
      context.read<CoursesProvider>().addScore(
        widget.course.name,
        newSCore,
      ); // Add score to the course
    }
  }

  Color scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    // Get the updated course data from Provider
    final provider = context.watch<CoursesProvider>();
    final course = provider.getCourseFor(widget.course.name);
    final scores = course.scores;
    Widget content = const Center(child: Text('No Scores added yet.'));

    if (scores.isNotEmpty) {
      content = ListView.builder(
        itemCount: scores.length,
        itemBuilder:
            (ctx, index) => ListTile(
              title: Text(scores[index].studentName),
              trailing: Text(
                scores[index].studenScore.toString(),
                style: TextStyle(
                  color: scoreColor(scores[index].studenScore),
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
          widget.course.name,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: _addScore, icon: const Icon(Icons.add)),
        ],
      ),
      body: content,
    );
  }
}
