// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bid_and_shops/Components/AuthHeader/AuthHeader.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Helper/SnackBar/showSnackBar.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Provider/UserProfileProvider.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:bid_and_shops/Services/Storage/Storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OtpPage extends StatefulWidget {
  final mobile;
  OtpPage({super.key, required this.mobile});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
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

  void handelFormSubmit() async {
    if (getOTP().length != 4) {
      ShowSnackBar(context,
          contentType: ContentType.warning,
          message: "Enter A Valid Otp",
          title: "Invalid OTP");
    } else {
      veifyOtp();
    }
    // NavigateMe.replacePush(context, HomeRoute());
  }

  Future veifyOtp() async {
    ApiRequest verifyotpRequest =
        ApiRequest(path: "/api/auth/verifyotp", method: "POST", body: {
      "userinfo": widget.mobile,
      "otp": getOTP(),
    });
    try {
      setState(() {
        isLoading = true;
      });
      Response response = await verifyotpRequest.send();
      Map data = response.data;
      print(data);
      if (data['success'] == false) {
        // ignore: use_build_context_synchronously
        ShowSnackBar(
          context,
          contentType: ContentType.failure,
          message: data['error'],
          title: "Oh hoo..",
        );
      } else if (data['success'] == true) {
        await useLocalStorage.setStorage(key: "authKey", data: data['token']);
        SetUserProvider.setUser(context, data);
        NavigateMe.replacePush(context, HomeRoute());
      } else {
        ShowSnackBar(
          context,
          contentType: ContentType.failure,
          message: "Something Want Wrong...",
          title: "Oh hoo..",
        );
      }
      setState(() {
        isLoading = false;
      });
    } on DioException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.response != null) {
        ShowSnackBar(
          context,
          contentType: ContentType.failure,
          message: e.response?.data['error'],
          title: "Oh hoo..",
        );
      } else {
        // ignore: use_build_context_synchronously
        ShowSnackBar(
          context,
          contentType: ContentType.failure,
          message: "Something Want Wrong...",
          title: "Oh hoo..",
        );
      }
    }
  }

  Future resendOtp() async {
    ApiRequest resendOtpRequest =
        ApiRequest(path: "/api/auth/resendotp", method: "POST", body: {
      "userinfo": widget.mobile,
    });
    try {
      setState(() {
        isResendLoading = true;
      });
      Response response = await resendOtpRequest.send();
      if (response.data['success'] == true) {
        ShowSnackBar(
          context,
          contentType: ContentType.success,
          message: response.data['message'],
          title: "Successfully Send",
        );
      } else {
        ShowSnackBar(
          context,
          contentType: ContentType.failure,
          message: response.data['error'] ?? "Something Want Wrong!",
          title: "Oh hoo..",
        );
      }
      setState(() {
        isResendLoading = false;
      });
    } on DioException catch (e) {
      setState(() {
        isResendLoading = false;
      });
      if (e.response != null) {
        ShowSnackBar(
          context,
          contentType: ContentType.failure,
          message: e.response?.data['error'],
          title: "Oh hoo..",
        );
      } else {
        // ignore: use_build_context_synchronously
        ShowSnackBar(
          context,
          contentType: ContentType.failure,
          message: "Something Want Wrong...",
          title: "Oh hoo..",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            children: [
              AuthHeader(
                title: "Verify Your OTP",
                desc:
                    "Please enter the code below to verify your identity and complete the sign-in process.",
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                    ),
                    OTPBOX(
                      controller: otp2,
                      focusNode: otp2node,
                      prevNode: otp1node,
                      nextNode: otp3node,
                    ),
                    OTPBOX(
                      controller: otp3,
                      focusNode: otp3node,
                      prevNode: otp2node,
                      nextNode: otp4node,
                    ),
                    OTPBOX(
                      controller: otp4,
                      focusNode: otp4node,
                      prevNode: otp3node,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: handelFormSubmit,
                      child: isLoading
                          ? CircularProgressIndicator(
                              strokeWidth: 1,
                            )
                          : Text(
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
          TextButton(
            onPressed: isResendLoading ? null : resendOtp,
            child: const Text(
              "Resend OTP",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Don`t Have Any Account",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    NavigateMe.push(context, SignupRoute());
                  },
                  child: const Text(
                    "Signup",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OTPBOX extends StatelessWidget {
  final TextEditingController? controller;
  final bool autofocus;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final FocusNode? prevNode;

  OTPBOX({
    super.key,
    this.controller,
    this.autofocus = false,
    this.focusNode,
    this.nextNode,
    this.prevNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4 - 35,
      child: TextField(
        cursorColor: Colors.black,
        controller: controller,
        autofocus: autofocus,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).requestFocus(nextNode);
          } else {
            FocusScope.of(context).requestFocus(prevNode);
          }
        },
        decoration: const InputDecoration(
          counterText: "",
        ),
      ),
    );
  }
}
