import 'package:flutter/material.dart';
import 'package:nlw_05/core/core.dart';

import 'chart_widget.dart';

class ScoreCardWidget extends StatelessWidget {
  final double percent;

  ScoreCardWidget({required this.percent});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 14),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: ChartWidget(
                percent: percent,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child:
                          Text('Vamos começar', style: AppTextStyles.heading),
                    ),
                    Text(
                      'Comple os desafios e avançe em conhecimento',
                      style: AppTextStyles.body,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
