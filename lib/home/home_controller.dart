import 'package:DevQuiz/home/home_repository.dart';
import 'package:DevQuiz/models/quiz_model.dart';
import 'package:DevQuiz/models/user_model.dart';
import 'package:flutter/cupertino.dart';

import 'home_state.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.sucess;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();

    state = HomeState.sucess;
  }
}
