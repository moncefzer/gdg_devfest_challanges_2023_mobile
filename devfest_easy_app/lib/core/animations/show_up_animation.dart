import '../config/app_sizes.dart';
import '../utils/common_libs.dart';

class ShowUpAnimation extends StatelessWidget {
  const ShowUpAnimation({
    super.key,
    required this.child,
    this.yOffset = 2,
    this.duration = AppSizes.duration150,
  });

  final Widget child;
  final double yOffset;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(begin: Offset(0, yOffset), end: Offset.zero),
      duration: duration,
      builder: (context, value, child) {
        return AnimatedOpacity(
          duration: AppSizes.duration50,
          opacity: value == Offset.zero ? 1 : 0.8,
          child: Transform.translate(
            offset: value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
