import '../../../core/utils/common_libs.dart';

class SettingItem extends StatelessWidget {
  const SettingItem(
      {super.key, required this.title, required this.icon, this.color});

  final String title;
  final String icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.black,
              backgroundImage: AssetImage(
                icon,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                title,
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
