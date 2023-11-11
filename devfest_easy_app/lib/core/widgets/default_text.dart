import '../utils/common_libs.dart';

class DefaultText extends StatelessWidget {
  const DefaultText({
    Key? key,
    required this.text,
    this.style,
  }) : super(key: key);
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: style ?? context.bodyMedium,
      ),
    );
  }
}
