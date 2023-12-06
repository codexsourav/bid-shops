import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ViewWinners extends StatelessWidget {
  const ViewWinners({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            NavigateMe.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Winners",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(children: [
              Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 2,
                    child: RotationTransition(
                      turns: new AlwaysStoppedAnimation(-30 / 360),
                      child: const Icon(
                        FontAwesomeIcons.crown,
                        size: 20,
                        color: Color.fromARGB(255, 243, 221, 18),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 0, top: 10),
                    child: ImageLoader(radius: 15),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 115,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: const Text(
                            "Sourav Bapari",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const Text("Today")
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Opacity(
                      opacity: 0.8,
                      child: Text("Win I phone 14 Pro Max"),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
