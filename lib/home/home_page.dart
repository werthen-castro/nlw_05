import 'package:DevQuiz/home/widgets/level_button_widget.dart';
import 'package:DevQuiz/utils/enums.dart';
import 'package:flutter/material.dart';

import 'widgets/app_widget.dart';
import 'widgets/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(label: NiveisDificuldade.facil),
                LevelButtonWidget(label: NiveisDificuldade.medio),
                LevelButtonWidget(label: NiveisDificuldade.dificil),
                LevelButtonWidget(label: NiveisDificuldade.perito)
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 2,
                children: [
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
