import 'package:flutter/material.dart';
import 'package:nlw_05/challenge/widgets/question_indicator_widget.dart';
import 'package:nlw_05/models/question_model.dart';
import 'package:nlw_05/result/result_page.dart';

import 'challenge_controller.dart';
import 'widgets/next_button_widget.dart';
import 'widgets/quiz/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  ChallengePage({required this.questions, required this.title});

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt();
    });

    super.initState();
  }

  nextPage() {
    pageController.nextPage(
        duration: Duration(microseconds: 100), curve: Curves.linear);
  }

  void onSelected(bool value) {
    if (value) {
      controller.qtsAnwserRight++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(106),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: widget.questions
                .map((e) => QuizWidget(
                      question: e,
                      onSelected: onSelected,
                    ))
                .toList(),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (value + 1 != widget.questions.length)
                        Expanded(
                            child: NextButtonWidget.white(
                          label: 'Pular',
                          onTap: nextPage,
                        )),
                      if (value + 1 == widget.questions.length)
                        SizedBox(
                          width: 7,
                        ),
                      if (value + 1 == widget.questions.length)
                        Expanded(
                            child: NextButtonWidget.green(
                          label: 'Confirmar',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultPage(
                                          lenght: widget.questions.length,
                                          title: widget.title,
                                          result: controller.qtsAnwserRight,
                                        )));
                          },
                        )),
                    ],
                  )),
        ),
      ),
    );
  }
}
