import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:bid_and_shops/Helper/GetDate.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/Themes/colors/AppColors.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';

class BidProductBox extends StatelessWidget {
  final Map data;
  BidProductBox({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    TimeStamp timeStamp = TimeStamp(data['endDate']);
    return GestureDetector(
      onTap: () {
        NavigateMe.push(context, ShowBidsRoutee(data: data));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ImageLoader(
                width: MediaQuery.of(context).size.width / 2 - 60,
                height: 160,
                imageUrl: "${ApiRequest().endPoint}/${data['image']}",
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  height: 20,
                  color: AppColors.primaryColor,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "${data['users'].length} BIDS",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['title'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RatingBarIndicator(
                    rating: data['rating'].toDouble(),
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 10.0,
                    direction: Axis.horizontal,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  data['desc'],
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "₹ ${data['hintPrice'].toDouble()}",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 196, 196, 196),
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "END Date: ${timeStamp.day.toString().padLeft(2, "0")}/${timeStamp.month.toString().padLeft(2, "0")}/${timeStamp.year}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 10),
                ),
                const SizedBox(height: 4),
                Builder(builder: (context) {
                  if (data['isAttemd'] == true) {
                    return Text(
                      "Your Bid : ${data["userData"]['amount']}RS",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    );
                  }
                  return Row(
                    children: [
                      const Text(
                        "END TIME : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10),
                      ),
                      const SizedBox(width: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TimerBox(
                              text:
                                  timeStamp.hour12.toString().padLeft(2, "0")),
                          const SizedBox(width: 5),
                          TimerBox(
                              text:
                                  timeStamp.minute.toString().padLeft(2, "0")),
                          const SizedBox(width: 5),
                          TimerBox(text: timeStamp.amPm.toString()),
                        ],
                      ),
                    ],
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TimerBox extends StatelessWidget {
  final String text;
  const TimerBox({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: Text(
            "$text",
            style: const TextStyle(
              fontSize: 8,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
