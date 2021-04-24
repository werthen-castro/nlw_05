import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'awnser_widget.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  QuizWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AwnserWidget(
            isRight: true,
            isSelected: true,
            title: "teste teste teste",
          ),
          AwnserWidget(
            isRight: false,
            isSelected: true,
            title: "teste teste teste",
          ),
          AwnserWidget(
            title: "teste teste teste",
          ),
          AwnserWidget(
            title: "teste teste teste",
          ),
        ],
      ),
    );
  }
}
