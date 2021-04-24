import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;

  LevelButtonWidget({required this.label, Key? key})
      : assert([
          NiveisDificuldade.facil,
          NiveisDificuldade.medio,
          NiveisDificuldade.dificil,
          NiveisDificuldade.perito
        ].contains(label)),
        super(key: key);

  final config = {
    NiveisDificuldade.facil: {
      ColorsNiveisDificuldade.color: AppColors.levelButtonFacil,
      ColorsNiveisDificuldade.borderColor: AppColors.levelButtonBorderFacil,
      ColorsNiveisDificuldade.fontColor: AppColors.levelButtonTextFacil
    },
    NiveisDificuldade.medio: {
      ColorsNiveisDificuldade.color: AppColors.levelButtonMedio,
      ColorsNiveisDificuldade.borderColor: AppColors.levelButtonBorderMedio,
      ColorsNiveisDificuldade.fontColor: AppColors.levelButtonTextMedio
    },
    NiveisDificuldade.dificil: {
      ColorsNiveisDificuldade.color: AppColors.levelButtonDificil,
      ColorsNiveisDificuldade.borderColor: AppColors.levelButtonBorderDificil,
      ColorsNiveisDificuldade.fontColor: AppColors.levelButtonTextDificil
    },
    NiveisDificuldade.perito: {
      ColorsNiveisDificuldade.color: AppColors.levelButtonPerito,
      ColorsNiveisDificuldade.borderColor: AppColors.levelButtonBorderPerito,
      ColorsNiveisDificuldade.fontColor: AppColors.levelButtonTextPerito
    },
  };

  Color get color => config[label]![ColorsNiveisDificuldade.color]!;
  Color get borderColor => config[label]![ColorsNiveisDificuldade.borderColor]!;
  Color get fontColor => config[label]![ColorsNiveisDificuldade.fontColor]!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(
          BorderSide(color: borderColor),
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
        child: Text(label,
            style: GoogleFonts.notoSans(color: fontColor, fontSize: 13)),
      ),
    );
  }
}
