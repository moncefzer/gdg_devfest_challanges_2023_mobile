import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cubit/game_cubit.dart';
import 'documentation_page.dart';
import 'entities/entities.dart';
import 'res/app_colors.dart';
import 'widgets/borad_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.darkBackgroundColor,
            child: IconButton(
              splashRadius: 25,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentationPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.info,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      backgroundColor: AppColors.backgroundColor,
      body: BlocConsumer<GameCubit, GameState>(
        listener: (context, state) {
          if (state.isGameOver == true && state.status == GameStatus.win) {
            _showWinDialog(context, state);
          }
          if (state.isGameOver == true && state.status == GameStatus.draw) {
            _showDrawDialog(context);
          }
        },
        builder: (context, state) {
          final cubit = GameCubit.get(context);
          var board = cubit.game.board;
          return Column(
            children: [
              const Spacer(flex: 2),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Turn :',
                    ),
                    TextSpan(
                      text: ' player (${state.player})',
                      style: TextStyle(
                        color: state.player.value == Cell.X
                            ? AppColors.red
                            : AppColors.green,
                      ),
                    ),
                  ],
                ),
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const Spacer(flex: 2),
              BoardWidget(board: board),
              SizedBox(height: 30.h),
              InkWell(
                onTap: GameCubit.get(context).repeatGame,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Restart Game',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }

  Future<dynamic> _showDrawDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Text(
            'Draw',
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            'This was a draw game',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> _showWinDialog(BuildContext context, GameState state) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Text(
            'Win',
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            'Player ${state.player} Win',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
