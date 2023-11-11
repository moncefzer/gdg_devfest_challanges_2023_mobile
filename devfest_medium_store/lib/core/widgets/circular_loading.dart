import '../config/app_colors.dart';
import '../utils/common_libs.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({
    super.key,
    this.color = AppColors.blue,
    this.strokeWidth = 4.0,
  });

  final Color color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
