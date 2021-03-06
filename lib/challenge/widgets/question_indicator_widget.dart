import 'package:flutter/material.dart';
import 'package:nlw_05/core/core.dart';
import 'package:nlw_05/widgets/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int length;

  QuestionIndicatorWidget({required this.currentPage, required this.length});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Questão ${currentPage + 1}',
                  style: AppTextStyles.body,
                ),
                Text(
                  'de $length',
                  style: AppTextStyles.body,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            ProgressIndicatorWidget(
              value: (currentPage + 1) / length,
            )
          ],
        ),
      ),
    );
  }
}
