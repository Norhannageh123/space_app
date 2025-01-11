import 'package:flutter/material.dart';
import 'package:space/core/assets/app_colors.dart';
import 'package:space/core/assets/app_images.dart';
import 'package:space/core/constants/strings.dart';


class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, this.name, this.title});

  final String? title;
  final String? name;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(AppImages.halfPlantImage),
        Positioned.fill(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColors.black,
                AppColors.black.withOpacity(.6),
                Colors.transparent
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      title != null
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder()),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(Icons.arrow_back))
                          : SizedBox.shrink(),
                      SizedBox(
                        width: size.width * .25,
                      ),
                      Text(
                        title ?? Strings.explore,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Text(name ?? Strings.homeTitleQuestion,
                      style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
