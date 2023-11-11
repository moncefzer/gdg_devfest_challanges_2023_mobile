import '../config/app_colors.dart';
import '../utils/common_libs.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    required this.press,
    this.isDisabled = false,
  });

  final String text;
  final VoidCallback press;
  final bool isDisabled;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: isDisabled ? null : press,
        style: TextButton.styleFrom(
            backgroundColor: AppColors.blue, foregroundColor: Colors.white),
        child: Text(
          text,
          style: context.bodyMedium,
        ),
      ),
    );
  }
}
