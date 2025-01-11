import 'package:flutter/material.dart';
import 'package:space/core/constants/routes.dart';
import 'package:space/core/constants/strings.dart';
import 'package:space/core/widgets/title_widget.dart';
import 'package:space/models/planet.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController pageController = PageController(initialPage: 0);
  int index = 0;

  @override
  void initState() {
    pageController.addListener(_listenOnPageChange);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TitleWidget(),
          Expanded(
            child: PageView.builder(
              // onPageChanged: (value) {
              //   index = value % 9;
              //   setState(() {});
              // },
              controller: pageController,
              itemBuilder: (context, index) {
                return Image.asset(
                  Planet.planets[index % 9].image,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    onPressed: () {
                      pageController.animateToPage(
                          pageController.page!.toInt() - 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: Icon(Icons.arrow_back)),
                Text(Planet.planets[index].name,
                    style: Theme.of(context).textTheme.titleLarge),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    onPressed: () {
                      pageController.animateToPage(
                          pageController.page!.toInt() + 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: Icon(Icons.arrow_forward)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.detailsRoute,
                      arguments: Planet.planets[index]);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${Strings.explore} ${Planet.planets[index].name}"),
                    Icon(Icons.arrow_forward_ios_sharp)
                  ],
                )),
          )
        ],
      ),
    );
  }

  void _listenOnPageChange() {
    index = pageController.page!.toInt() % 9;
    setState(() {});
  }
}
