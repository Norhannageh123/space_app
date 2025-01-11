import 'package:flutter/material.dart';
import 'package:space/core/assets/app_colors.dart';
import 'package:space/core/assets/app_images.dart';
import 'package:space/core/constants/routes.dart';
import 'package:space/core/constants/strings.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Image.asset(
            AppImages.splashImage,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
                child: Row(
                  children: [
                    Text(
                      Strings.exploreTheUniverse,
                      //textAlign: TextAlign.start,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: height * 0.03,
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width * 0.2, height * 0.07),
                    backgroundColor: AppColors.red,
                  ),
                  onPressed: () {
                     Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(Strings.explore,
                          style:
                              TextStyle(color: AppColors.white, fontSize: 15)),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColors.white,
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
