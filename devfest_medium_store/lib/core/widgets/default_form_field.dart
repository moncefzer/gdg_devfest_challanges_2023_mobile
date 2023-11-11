import 'package:devfest_store/core/utils/common_libs.dart';

import '../config/app_colors.dart';
import '../config/app_sizes.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.isPass = false,
    this.onChanged,
    this.focusNode,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool isPass;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      borderSide: const BorderSide(color: AppColors.black, width: 1),
    );
    return TextFormField(
      focusNode: focusNode,
      cursorColor: Colors.black,
      controller: controller,
      obscureText: isPass,
      style: context.bodyMedium,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIconConstraints: const BoxConstraints(maxWidth: 60, minWidth: 40),
        prefixIcon: prefixIcon,
        hintStyle: context.bodyMedium.copyWith(color: AppColors.grey),
      ),
    );
  }
}
