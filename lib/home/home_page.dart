import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widgets/level_button_widget.dart';
import 'package:DevQuiz/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../core/app_colors.dart';
import 'widgets/app_widget.dart';
import 'widgets/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucess)
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Column(
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            LevelButtonWidget(label: NiveisDificuldade.facil),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            LevelButtonWidget(label: NiveisDificuldade.medio),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            LevelButtonWidget(label: NiveisDificuldade.dificil),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            LevelButtonWidget(label: NiveisDificuldade.perito),
                      )
                    ],
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map((e) => QuizCardWidget(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChallengePage(
                                          questions: e.questions)));
                            },
                            title: e.title,
                            completed:
                                "${e.questionAnswered}/${e.questions.length}",
                            percent: e.questionAnswered / e.questions.length,
                          ))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      );
    else
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.green),
          ),
        ),
      );
  }
}
