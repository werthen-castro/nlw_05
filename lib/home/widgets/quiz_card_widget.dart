import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

import '../../widgets/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              'Gerenciamento de Estado',
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
                    '3 de 10',
                    style: AppTextStyles.body11,
                  ),
                ),
                ProgressIndicatorWidget(
                  value: 0.3,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
