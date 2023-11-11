import 'package:devfest_app/data/event.dart';

import '../core/utils/common_libs.dart';
import '../data/field.dart';
import '../widgets/event_card.dart';
import '../widgets/event_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            const EventCard(),
            SizedBox(height: 20.h),
            Text(
              'Our Fields',
              style: context.titleLarge.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10.h),
            _buildOurFields(),
            SizedBox(height: 20.h),
            Text(
              "Previous Devfest’s",
              style: context.titleLarge.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20.h),
            _buildPreviousDevfests(),
          ],
        ),
      ),
    );
  }

  ListView _buildPreviousDevfests() {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemCount: Event.events.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final event = Event.events[index];

        return EventWidget(event: event);
      },
    );
  }

  SizedBox _buildOurFields() {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        separatorBuilder: (context, index) => SizedBox(width: 15.w),
        scrollDirection: Axis.horizontal,
        itemCount: fields.length,
        itemBuilder: (context, index) {
          final field = fields[index];

          return Container(
            width: 135.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(7, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35.h,
                  width: 35.h,
                  decoration: BoxDecoration(
                    color: index.isEven ? AppColors.blue : AppColors.yellow,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(3),
                    ),
                  ),
                  child: Image.asset(
                    field.image,
                    scale: 0.65,
                  ),
                ),
                SizedBox(height: 7.h),
                Text(
                  field.name,
                  style:
                      context.bodyLarge.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
