import '../config/app_sizes.dart';
import '../utils/common_libs.dart';

class ShowAnimation extends StatelessWidget {
  const ShowAnimation({
    super.key,
    required this.child,
    this.duration = AppSizes.duration150,
    this.begin = 0.6,
  }) : assert(begin >= 0.0 && begin <= 1.0);

  final Widget child;
  final Duration duration;
  final double begin;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: begin, end: 1.0),
      duration: duration,
      builder: (context, value, child) {
        return AnimatedOpacity(
          duration: duration,
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }
}
