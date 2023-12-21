// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bid_and_shops/Helper/MakeProvider.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Helper/Navigate/Navigation.dart';
import 'package:bid_and_shops/Helper/SnackBar/showSnackBar.dart';
import 'package:bid_and_shops/Provider/UserProfileProvider.dart';
import 'package:bid_and_shops/Screens/Order/AddressPage.dart';
import 'package:bid_and_shops/Screens/settings/VerifyOtpMobile.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateMobile extends StatefulWidget {
  const UpdateMobile({super.key});

  @override
  State<UpdateMobile> createState() => _UpdateMobileState();
}

class _UpdateMobileState extends State<UpdateMobile> {
  late UserProfileProvider userProfileProvider;
  TextEditingController textEditingController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    userProfileProvider =
        UseProvider<UserProfileProvider>(context, listen: false);
    textEditingController.text = userProfileProvider.userData!['mobile'] ?? "";
    super.initState();
  }

  sendMobile() async {
    try {
      if (textEditingController.text.isEmpty) {
        Fluttertoast.showToast(msg: "Enter Your Mobile Number");
      } else if (textEditingController.text.length != 10) {
        Fluttertoast.showToast(msg: "Enter Valid Mobile Number");
      } else if (userProfileProvider.userData!['mobile'] ==
          textEditingController.text) {
        NavigateMe.pop(context);
      } else {
        ApiRequest apiRequest = ApiRequest(
          path: "/api/settings/mobile/${textEditingController.text}",
          method: "POST",
        );
        setState(() {
          isLoading = true;
        });
        Fluttertoast.showToast(msg: "Sending Otp");
        Response response = await apiRequest.send();
        if (response.data['success'] == true) {
          Fluttertoast.showToast(msg: "Otp Send Successfully");
          NavigateMe.pop(context);
          Navigation.push(context,
              page: VerifyOtpPage(mobile: textEditingController.text));
        } else {
          ShowSnackBar(context,
              contentType: ContentType.failure,
              message: response.data['error'] ??
                  response.data['message'] ??
                  "Something Want Wrong",
              title: "Error");
        }
        setState(() {
          isLoading = false;
        });
      }
    } on DioException catch (e) {
      setState(() {
        isLoading = false;
      });
      ShowSnackBar(context,
          contentType: ContentType.failure,
          message: e.response?.data['error'] ??
              e.response?.data['message'] ??
              "Something Want Wrong",
          title: "Error");
    }
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
        title: const Text("Change Mobile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          AddressInputBox(
            controller: textEditingController,
            keyboardType: TextInputType.phone,
            title: "MOBILE NUMBER",
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: ElevatedButton(
                onPressed: isLoading ? null : sendMobile,
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 1,
                      )
                    : const Text(
                        "Update Your Mobile",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
          )
        ]),
      ),
    );
  }
}
