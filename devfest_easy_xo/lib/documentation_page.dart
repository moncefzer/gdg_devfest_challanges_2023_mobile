import 'package:devfest_easy_xo/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocumentationPage extends StatelessWidget {
  const DocumentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Documentation'),
        leadingWidth: 30.w,
      ),
      body: ListView(
        padding: EdgeInsets.all(15.0.w),
        children: const [
          Section(
            title: 'Basic Rules',
            content:
                'Tic-Tac-Toe is a two-player game. The board consists of 3x3 cells. Players take turns marking a cell with their symbol (X or O). The first player to get three of their symbols in a row, column, or diagonal wins the game.',
          ),
          Section(
            title: 'Gameplay Instructions',
            content:
                '1. Player 1 is X, and Player 2 is O.\n2. To make a move, tap an empty cell.\n3. Alternate turns with your opponent.\n4. The game ends when a player wins or the board is full.\n5. Have fun!',
          ),
          Section(
            title: 'Win Conditions',
            content:
                'The game determines a win when:\n1. Any player places their symbol (X or O) in three consecutive cells horizontally, vertically, or diagonally.\n2. The game announces the winning player and highlights the winning combination.',
          ),
          Section(
            title: 'Draw Condition',
            content:
                'The game ends in a draw when:\n1. All cells on the grid are filled with Xs and Os, and no player has won.\n2. The game announces a draw, and no player is declared the winner.',
          ),
          Section(
            title: 'Tips',
            content:
                '1. Pay attention to your opponent\'s moves.\n2. Try to create winning patterns while blocking your opponent.\n3. Corners and the center cell are strategic positions.\n4. Learn from your losses to become a better player.',
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final String content;

  const Section({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 21.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          content,
          style: TextStyle(fontSize: 14.sp),
        ),
        const Divider(
          color: AppColors.backgroundColorLight,
        ),
      ],
    );
  }
}
