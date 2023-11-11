import '../core/utils/common_libs.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    super.key,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: _controller.value < 0.5
              ? const EventCardFront()
              : const EventCardBack(),
        );
      },
    );
  }
}

class EventCardFront extends StatelessWidget {
  const EventCardFront({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 50.h,
            child: Image.asset(
              Assets.imagesLight,
              height: 50.h,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            height: 80.h,
            child: Image.asset(
              Assets.imagesPattern,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            // height: 50.h,
            child: Image.asset(
              Assets.imagesPatternBottomLeft,
            ),
          ),
          Positioned.fill(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              Text(
                'Guess How Organize \nDevfesft23?',
                style: context.titleMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Image.asset(
                Assets.imagesGdgLogo,
                width: 210.w,
              )
            ],
          )),
        ],
      ),
    );
  }
}

class EventCardBack extends StatelessWidget {
  const EventCardBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            height: 50.h,
            child: Image.asset(
              Assets.imagesPatternTopLeft,
              height: 50.h,
            ),
          ),
          Positioned(
            top: 5.h,
            right: 15.w,
            // height: 50.h,
            child: Image.asset(
              Assets.imagesAlger,
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 30.w,
            // height: 50.h,
            child: Image.asset(
              Assets.imagesMSquare,
            ),
          ),
          Positioned(
            bottom: 5.h,
            right: 0,
            // height: 50.h,
            child: Image.asset(
              Assets.imagesPatternBottomRight,
            ),
          ),
          Positioned.fill(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15.h),
              Text(
                'Your awaited event is finally',
                style: context.titleMedium,
              ),
              SizedBox(height: 15.h),
              Text('HERE',
                  style: TextStyle(
                    fontSize: 35.sp,
                    height: 1,
                    color: AppColors.yellow,
                    fontWeight: FontWeight.w900,
                  )),
            ],
          )),
        ],
      ),
    );
  }
}
