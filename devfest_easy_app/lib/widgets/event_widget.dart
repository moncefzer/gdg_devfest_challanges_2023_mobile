import '../core/utils/common_libs.dart';
import '../data/event.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 110.h,
      child: Row(
        children: [
          Expanded(
            flex: 8,
            //todo ; add stacked Image
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(Assets.imagesBlackTop),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(Assets.imagesBlackBotton),
                ),
                Positioned(
                  height: 77.h,
                  child: Image.asset(
                    event.image,
                    height: 60.h,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            flex: 12,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    event.name,
                    style: context.titleLarge.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.blue,
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: Text(
                      event.description,
                      style: context.bodyMedium.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
