import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:space/UI/PlanetDetails/plannet_info.dart';
import 'package:space/core/assets/app_colors.dart';
import 'package:space/core/constants/strings.dart';
import 'package:space/core/widgets/title_widget.dart';
import 'package:space/models/planet.dart';


class PlanetDetails extends StatelessWidget {
  PlanetDetails({super.key});

  Flutter3DController flutter3dController = Flutter3DController();

  @override
  Widget build(BuildContext context) {
    var planet = ModalRoute.of(context)?.settings.arguments as Planet;

    return Scaffold(
      body: Column(
        children: [
          TitleWidget(
            title: planet.name,
            name: planet.title,
          ),
          Expanded(
            child: ListView(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Flutter3DViewer(
                    activeGestureInterceptor: true,
                    progressBarColor: AppColors.red,
                    enableTouch: true,
                    controller: flutter3dController,
                    src: planet.model, //3D model with different animations
                    //src: 'assets/sheen_chair.glb', //3D model with different textures
                    //src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb', // 3D model from URL
                  ),
                ),
                Text(
                  Strings.about,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                PlannetInfo(title: Strings.about, value: planet.about),
                PlannetInfo(
                    title: Strings.distanceFromSun,
                    value: planet.distanceFromSun),
                PlannetInfo(
                    title: Strings.lengthOfDay, value: planet.lengthOfDay),
                PlannetInfo(
                    title: Strings.orbitalPeriod, value: planet.orbitalPeriod),
                PlannetInfo(title: Strings.radius, value: planet.radius),
                PlannetInfo(title: Strings.mass, value: planet.mass),
                PlannetInfo(title: Strings.gravity, value: planet.gravity),
                PlannetInfo(
                    title: Strings.surfaceArea, value: planet.surfaceArea),
              ],
            ),
          )
        ],
      ),
    );
  }
}
