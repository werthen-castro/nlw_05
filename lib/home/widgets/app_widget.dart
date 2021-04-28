import 'package:DevQuiz/home/widgets/score_card_widget.dart';
import 'package:DevQuiz/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:DevQuiz/core/core.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  AppBarWidget({required this.user})
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    height: 161,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    width: double.maxFinite,
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: "Olá, ",
                              style: AppTextStyles.title,
                              children: [
                                TextSpan(
                                    text: user.name, style: AppTextStyles.title)
                              ]),
                        ),
                        Container(
                          width: 58,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(user.photoUrl))),
                        )
                      ],
                    ),
                  ),
                  Align(alignment: Alignment(0, 1.0), child: ScoreCardWidget())
                ],
              ),
            ));
}
