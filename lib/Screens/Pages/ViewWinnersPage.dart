import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Components/HomeComponents/Progress.dart';
import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:bid_and_shops/Helper/GetDate.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ViewWinners extends StatefulWidget {
  const ViewWinners({super.key});

  @override
  State<ViewWinners> createState() => _ViewWinnersState();
}

class _ViewWinnersState extends State<ViewWinners> {
  List? winners;

  loadWinners() async {
    try {
      ApiRequest apiRequest = ApiRequest(path: "/api/bids/winners");
      Response data = await apiRequest.send();
      setState(() {
        winners = data.data;
      });
    } catch (e) {
      setState(() {
        winners = [];
      });
    }
  }

  @override
  void initState() {
    loadWinners();
    super.initState();
  }

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
      body: Builder(builder: (context) {
        if (winners == null) {
          return Center(
            child: progress(context),
          );
        } else if (winners!.isEmpty) {
          return const Center(
            child: Text("No Winners Found"),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: List.generate(
              winners!.length,
              (index) => WinnerVew(
                date: winners![index]['winner']['winData']['date'],
                image: winners![index]['winner']['profile'],
                name: winners![index]['winner']['name'],
                title: winners![index]['title'],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class WinnerVew extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String name;

  const WinnerVew({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    TimeStamp getDate = TimeStamp(date);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(children: [
        Stack(
          children: [
            const Positioned(
              left: 10,
              top: 2,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(-30 / 360),
                child: Icon(
                  FontAwesomeIcons.crown,
                  size: 20,
                  color: Color.fromARGB(255, 243, 221, 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 0, top: 10),
              child: ImageLoader(
                  radius: 15, imageUrl: "${ApiRequest().endPoint}/$image"),
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
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    "${getDate.day}-${getDate.month}-${getDate.year}",
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Opacity(
                opacity: 0.8,
                child: Text("Win $title"),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
