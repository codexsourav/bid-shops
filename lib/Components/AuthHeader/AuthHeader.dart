import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String desc;
  final bool showback;

  const AuthHeader({
    super.key,
    required this.title,
    required this.desc,
    this.showback = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 55, bottom: 40, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 12, 12, 12),
        border: Border(
          bottom: BorderSide(
            width: 3,
            color: Color.fromARGB(255, 121, 121, 121),
          ),
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (NavigateMe.canGoBAck(context) && showback)
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(59, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 18,
                      color: Color.fromARGB(220, 255, 255, 255),
                    ),
                  ),
                )
              : SizedBox(),
          const SizedBox(height: 20),
          Text(
            "$title",
            style: const TextStyle(
              fontSize: 11,
              color: Color.fromARGB(172, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "$desc",
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              fontFamily: "Meer",
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
