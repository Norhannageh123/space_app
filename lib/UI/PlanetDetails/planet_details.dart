import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:space/core/widgets/title_widget.dart';
import 'package:space/models/planet.dart';

class PlanetDetails extends StatelessWidget {
  PlanetDetails({super.key});
  
  final Flutter3DController flutter3DController = Flutter3DController();
  
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args == null || args is! Planet) {
      return Scaffold(
        body: Center(
          child: Text('No planet details available.'),
        ),
      );
    }

    var planetDetails = args;

    return Scaffold(
      body: Column(
        children: [
          TitleWidget(
            title: planetDetails.name,
            name: planetDetails.title,
          ),
          Expanded(
            child: Flutter3DViewer(
              activeGestureInterceptor: true,
              progressBarColor: Colors.orange,
              enableTouch: true,
              controller: flutter3DController,
              src: planetDetails.model,
            ),
          ),
        ],
      ),
    );
  }
}
