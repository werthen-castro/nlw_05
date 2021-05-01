import 'package:flutter/material.dart';
import 'package:nlw_05/core/core.dart';

class ChartWidget extends StatefulWidget {
  final double percent;
  ChartWidget({required this.percent});
  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  void initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation =
        Tween<double>(begin: 0.0, end: widget.percent).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) => Stack(
            children: [
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    backgroundColor: AppColors.chartSecondary,
                    value: _animation.value,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                ),
              ),
              Center(
                  child: Text(
                '${(_animation.value * 100).toInt()}%',
                style: AppTextStyles.heading,
              ))
            ],
          ),
        ));
  }
}
