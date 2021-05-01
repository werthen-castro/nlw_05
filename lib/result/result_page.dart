import 'package:flutter/material.dart';
import 'package:nlw_05/challenge/widgets/next_button_widget.dart';
import 'package:nlw_05/core/core.dart';
import 'package:nlw_05/home/home_page.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int lenght;
  final int result;

  ResultPage({required this.title, required this.lenght, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text('Parabéns!', style: AppTextStyles.heading40),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                      text: "Você concluiu",
                      style: AppTextStyles.body,
                      children: [
                        TextSpan(
                            text: '\n$title', style: AppTextStyles.bodyBold),
                        TextSpan(
                            text: '\ncom $result de $lenght acertos',
                            style: AppTextStyles.body)
                      ]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.purple(
                          label: 'Compartilhar',
                          onTap: () {
                            Share.share(
                                'DevQuiz NLW 5 - Flutter: Resultado do Quiz: $title\n ${result / lenght} ');
                          }),
                    )),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.white(
                            label: 'Voltar ao inicio',
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
