import 'package:flutter/material.dart';
import 'package:system_delivery_admin_ui/presentation/app_colors.dart';

class CircularPercentage extends StatelessWidget {
  const CircularPercentage({
    super.key,
    this.porcentage = 0,
    this.sizeHeight = 0,
    required this.color,
  });

  final double porcentage;
  final double sizeHeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeHeight,
      height: sizeHeight,
      child: Stack(
        children: [
          SizedBox(
            width: sizeHeight,
            height: sizeHeight,
            child: CircularProgressIndicator(
              value: porcentage / 100,
              color: color,
              strokeWidth: 22,
              strokeCap: StrokeCap.round,
              backgroundColor: AppColors.grey,
            ),
          ),
          Center(
            child: Text(
              '${porcentage.toStringAsFixed(1)}%',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 13,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
