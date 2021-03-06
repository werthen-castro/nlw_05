import 'package:flutter/material.dart';
import 'package:nlw_05/core/core.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double value;

  ProgressIndicatorWidget({required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: LinearProgressIndicator(
          value: value,
          backgroundColor: AppColors.chartSecondary,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
          minHeight: 10),
    );
  }
}
