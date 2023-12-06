// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bid_and_shops/Components/AuthHeader/AuthHeader.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Helper/SnackBar/showSnackBar.dart';
import 'package:bid_and_shops/Manager/Themes/Tweeks.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:bid_and_shops/Utils/EmailValidate.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForgetPasswordPage extends StatefulWidget {
  ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  bool isLoading = false;

  GlobalKey<FormState> forgetForm = GlobalKey<FormState>();

  TextEditingController emailField = TextEditingController();

  void handelFormSubmit() async {
    if (forgetForm.currentState!.validate()) {
      await sendForgetPassLink();
    }
  }

  Future sendForgetPassLink() async {
    ApiRequest forgetpassRequest = ApiRequest(
      path: "/api/auth/reset-password/${emailField.text}",
      method: "POST",
    );
    try {
      setState(() {
        isLoading = true;
      });
      Response forgetpassRes = await forgetpassRequest.send();

      if (forgetpassRes.data['success'] == true) {
        emailField.clear();
        ShowSnackBar(context,
            contentType: ContentType.success,
            message: forgetpassRes.data['message'],
            title: "Link Send");
      } else {
        ShowSnackBar(context,
            contentType: ContentType.failure,
            message: forgetpassRes.data['error'],
            title: "Link Not Send");
      }
      setState(() {
        isLoading = false;
      });
    } on DioException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.response != null) {
        ShowSnackBar(context,
            contentType: ContentType.failure,
            message: e.response?.data['error'] ?? "Something Want Wrong!",
            title: "Error!");
      } else {
        ShowSnackBar(context,
            contentType: ContentType.failure,
            message: "Something Want Wrong!",
            title: "Error!");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              const AuthHeader(
                title: "Ooo No! Recover Account",
                desc:
                    "Just enter your registered email, and we'll send you a secure link to reset your password.",
              ),
              Form(
                key: forgetForm,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      TextFormField(
                        cursorColor: Colors.black,
                        controller: emailField,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          label: Text(
                            "Email ID OR MOBILE".toUpperCase(),
                            style: inputLableStyle,
                          ),
                          floatingLabelStyle: inputLableStyle,
                        ),
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "Please Enter Your Email ID";
                          } else if (!emailValidate(e)) {
                            return "Invalid Email ID";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : handelFormSubmit,
                          child: isLoading
                              ? CircularProgressIndicator(
                                  strokeWidth: 1,
                                )
                              : Text(
                                  "SEND CODE",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Already Have Any Account",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    NavigateMe.pop(context);
                  },
                  child: const Text(
                    "Login",
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
