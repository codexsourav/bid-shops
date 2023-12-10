import 'package:bid_and_shops/Manager/Themes/colors/AppColors.dart';
import 'package:flutter/material.dart';

void showPlaceBidPopUP(context, data, {onSubmit}) {
  TextEditingController controller = TextEditingController();
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0.0,
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                width: 1, color: Color.fromARGB(174, 44, 44, 44)),
            borderRadius: BorderRadius.circular(0),
          ),
          content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Place Your BID",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Enter A Amount for This Porduct. If You Bid amount iS Unique.You Win This Product On Your Select Price",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Min - ${data['minPrice'].toDouble()} RS",
                  ),
                  onEditingComplete: () {
                    Navigator.of(context).pop();
                    onSubmit(id: data['_id'], amount: controller.text);
                  },
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          onSubmit(id: data['_id'], amount: controller.text);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                AppColors.primaryColor)),
                        child: const Text(
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
