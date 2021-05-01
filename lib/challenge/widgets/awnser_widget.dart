import 'package:flutter/material.dart';
import 'package:nlw_05/core/core.dart';
import 'package:nlw_05/models/awnser_mode.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel awnser;
  final bool isSelected;
  final ValueChanged<bool> onTap;
  final bool disabled;

  AwnserWidget(
      {required this.awnser,
      this.isSelected = false,
      required this.onTap,
      this.disabled = false});

  Color get _selectedColorRight =>
      awnser.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      awnser.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      awnser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => awnser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: () {
            onTap(awnser.isRight);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: isSelected ? _selectedColorCardRight : AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    awnser.title,
                    style: isSelected
                        ? _selectedTextStyleRight
                        : AppTextStyles.body,
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  child: Icon(
                    isSelected ? _selectedIconRight : Icons.check,
                    size: 16,
                    color: AppColors.white,
                  ),
                  decoration: BoxDecoration(
                      color: isSelected ? _selectedColorRight : AppColors.white,
                      borderRadius: BorderRadius.circular(90),
                      border: Border.fromBorderSide(
                          BorderSide(color: AppColors.border))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
