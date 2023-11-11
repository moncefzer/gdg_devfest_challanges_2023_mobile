import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/game_cubit.dart';
import '../entities/entities.dart';
import '../res/app_colors.dart';

class CellWidget extends StatelessWidget {
  const CellWidget({
    super.key,
    required this.row,
    required this.col,
    required this.cellValue,
  });
  final int row;
  final int col;
  final Cell cellValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (cellValue != Cell.empty) return;
        GameCubit.get(context).makeMove(Move(row, col));
      },
      child: Container(
        margin: EdgeInsets.all(2.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.darkBackgroundColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          cellValue != Cell.empty ? cellValue.name : ' ',
          style: TextStyle(
            fontSize: 90.sp,
            fontWeight: FontWeight.bold,
            color: cellValue == Cell.X ? AppColors.red : AppColors.green,
          ),
        ),
      ),
    );
  }
}
