import 'package:flutter/cupertino.dart';
import 'package:nlw_05/home/home_repository.dart';
import 'package:nlw_05/models/quiz_model.dart';
import 'package:nlw_05/models/user_model.dart';

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
