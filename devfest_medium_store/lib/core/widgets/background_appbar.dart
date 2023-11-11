import '../utils/common_libs.dart';

class BackgroundAppBar extends StatelessWidget {
  const BackgroundAppBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      height: 90.h,
      width: 1.sw,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned.fill(
            child: Transform.scale(
              scale: 2,
              child: Image.asset(
                Assets.imagesPattern,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: child,
          )
        ],
      ),
    );
  }
}
