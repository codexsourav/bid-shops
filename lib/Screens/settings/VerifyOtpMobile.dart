// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bid_and_shops/Helper/MakeProvider.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Helper/Navigate/Navigation.dart';
import 'package:bid_and_shops/Helper/SnackBar/showSnackBar.dart';
import 'package:bid_and_shops/Provider/UserProfileProvider.dart';
import 'package:bid_and_shops/Screens/Auth/OtpPage.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:bid_and_shops/Services/Storage/Storage.dart';
import 'package:bid_and_shops/Utils/ThemeColor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VerifyOtpPage extends StatefulWidget {
  final String mobile;
  const VerifyOtpPage({super.key, required this.mobile});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  bool isLoading = false;
  bool isResendLoading = false;

  UseLocalStorage useLocalStorage = UseLocalStorage(storage: localStorage);
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();

  FocusNode otp1node = FocusNode();
  FocusNode otp2node = FocusNode();
  FocusNode otp3node = FocusNode();
  FocusNode otp4node = FocusNode();

  String getOTP() {
    return "${otp1.text}${otp2.text}${otp3.text}${otp4.text}";
  }

  updateMobile() async {
    if (getOTP().length != 4) {
      Fluttertoast.showToast(msg: "Enter Valid OTP");
    } else {
      try {
        ApiRequest apiRequest = ApiRequest(
          path: "/api/settings/mobile",
          method: "PUT",
          body: {"mobile": widget.mobile, "otp": getOTP()},
        );
        setState(() {
          isLoading = true;
        });
        Response response = await apiRequest.send();
        if (response.data['success'] == true) {
          ShowSnackBar(
            context,
            contentType: ContentType.success,
            message: response.data['error'] ??
                response.data['message'] ??
                "Mobile Number Update Successfully",
            title: "Mobile Updated",
          );

          response.data['token'] != null
              ? useLocalStorage.setStorage(
                  key: "authKey",
                  data: response.data['token'],
                )
              : null;
          UseProvider<UserProfileProvider>(context, listen: false)
              .setUserData(response.data['profile']);
          Navigation.pop(context);
          Navigation.pop(context);
        } else {
          ShowSnackBar(
            context,
            contentType: ContentType.failure,
            message: response.data['error'] ??
                response.data['message'] ??
                "Something Want Wrong",
            title: "Error",
          );
        }
        setState(() {
          isLoading = false;
        });
      } on DioException catch (e) {
        setState(() {
          isLoading = false;
        });
        ShowSnackBar(
          context,
          contentType: ContentType.failure,
          message: e.response?.data['error'] ??
              e.response?.data['message'] ??
              "Something Want Wrong",
          title: "Error",
        );
      }
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
        title: const Text("Verify Your Mobile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OTPBOX(
                  controller: otp1,
                  autofocus: true,
                  focusNode: otp1node,
                  nextNode: otp2node,
                  color: themeColor(context),
                ),
                OTPBOX(
                  controller: otp2,
                  focusNode: otp2node,
                  prevNode: otp1node,
                  nextNode: otp3node,
                  color: themeColor(context),
                ),
                OTPBOX(
                  controller: otp3,
                  focusNode: otp3node,
                  prevNode: otp2node,
                  nextNode: otp4node,
                  color: themeColor(context),
                ),
                OTPBOX(
                  controller: otp4,
                  focusNode: otp4node,
                  prevNode: otp3node,
                  color: themeColor(context),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: isLoading ? null : updateMobile,
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1,
                        )
                      : const Text(
                          "Verify OTP",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
