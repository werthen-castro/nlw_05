import 'package:flutter/material.dart';
import 'package:nlw_05/core/app_text_styles.dart';
import 'package:nlw_05/models/awnser_mode.dart';
import 'package:nlw_05/models/question_model.dart';

import '../awnser_widget.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  QuizWidget({required this.question, required this.onSelected});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelelected = -1;

  AwnserModel awnsers(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            AwnserWidget(
              awnser: awnsers(i),
              disabled: indexSelelected != -1,
              isSelected: indexSelelected == i,
              onTap: (value) {
                indexSelelected = i;

                Future.delayed(Duration(seconds: 1))
                    .then((_) => widget.onSelected(value));

                setState(() {});
              },
            )
        ],
      ),
    );
  }
}
