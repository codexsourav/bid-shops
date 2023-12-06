import 'package:bid_and_shops/Manager/Themes/colors/AppColors.dart';
import 'package:flutter/material.dart';

void showPlaceBidPopUP(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0.0,
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color.fromARGB(174, 44, 44, 44)),
            borderRadius: BorderRadius.circular(0),
          ),
          content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Text(
                  "Place Your BID",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Enter A Amount for This Porduct. If You Bid amount iS Unique.You Win This Product On Your Select Price",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(hintText: "Amount"),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                AppColors.primaryColor)),
                        child: Text(
                          "Place Your Bid",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                )
              ]),
        );
      });
}
