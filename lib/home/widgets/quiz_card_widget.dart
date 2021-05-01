import 'package:flutter/material.dart';
import 'package:nlw_05/core/core.dart';

import '../../widgets/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  final VoidCallback onTap;

  QuizCardWidget({
    required this.title,
    required this.completed,
    required this.percent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                child: Image.asset(AppImages.blocks),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: AppTextStyles.heading15,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      completed,
                      style: AppTextStyles.body11,
                    ),
                  ),
                  ProgressIndicatorWidget(
                    value: percent,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
