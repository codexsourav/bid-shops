import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShowShimmer extends StatelessWidget {
  double? width;
  double? height;
  ShowShimmer({super.key, this.height = 80, this.width = 80});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        // period: const Duration(microseconds: 1),
        baseColor: Color.fromARGB(255, 22, 22, 22),
        highlightColor: Color.fromARGB(255, 0, 0, 0),
        child: Container(
          color: const Color.fromARGB(255, 15, 15, 15),
          width: 180,
          height: 120,
        ));
  }
}
