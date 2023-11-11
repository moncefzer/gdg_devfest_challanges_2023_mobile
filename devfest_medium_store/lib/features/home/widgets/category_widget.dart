import '../../../core/utils/common_libs.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.28.sw,
      height: 120,
      child: LayoutBuilder(
        builder: (context, constaints) {
          final size = constaints.biggest;

          return Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                bottom: 0,
                height: size.height * 0.9,
                child: Container(
                  color: AppColors.secondary,
                  width: size.width,
                ),
              ),
              Positioned(
                bottom: 15,
                child: Column(
                  children: [
                    Image.asset(
                      image,
                      height: size.height * 0.90,
                    ),
                    Text(title),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
