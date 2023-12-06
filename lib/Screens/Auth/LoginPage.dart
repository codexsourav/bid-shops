// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bid_and_shops/Components/AuthHeader/AuthHeader.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Helper/SnackBar/showSnackBar.dart';
import 'package:bid_and_shops/Manager/Themes/Tweeks.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Provider/UserProfileProvider.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:bid_and_shops/Services/Storage/Storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../Components/ContinueWithGoogle.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  TextEditingController emailField = TextEditingController();
  TextEditingController passField = TextEditingController();

  void handelFormSubmit() async {
    if (loginForm.currentState!.validate()) {
      // NavigateMe.push(context, OtpRoute());
      FocusScope.of(context).unfocus();
      await makeLoginTask();
    }
  }

  Future<void> makeLoginTask() async {
    ApiRequest loginRequest =
        ApiRequest(path: "/api/auth/login", method: "POST", body: {
      "userinfo": emailField.text,
      "pass": passField.text,
    });
    try {
      setState(() {
        isLoading = true;
      });
      Response loginResponse = await loginRequest.send();
      Map data = loginResponse.data;

      if (data['success'] == false) {
        ShowSnackBar(
          context,
          contentType: ContentType.failure,
          message: data['error'],
          title: "Oh hoo..",
        );
      } else if (data['success'] == true && data['isMobileVerify'] == false) {
        NavigateMe.push(context, OtpRoute(mobile: data['mobile']));
      } else {
        await UseLocalStorage(storage: localStorage)
            .setStorage(key: "authKey", data: data['token']);
        SetUserProvider.setUser(context, data);
        NavigateMe.replacePush(context, HomeRoute());
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
        ShowSnackBar(
          context,
          contentType: ContentType.failure,
          message: "Sumthing Want Wrong...",
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              const AuthHeader(
                title: "Hey, Welcome back!",
                desc:
                    "Log in now to dive into the excitement of bidding on your favorite items.",
                showback: false,
              ),
              Form(
                key: loginForm,
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
                            "Email Or Mobile".toUpperCase(),
                            style: inputLableStyle,
                          ),
                        ),
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "Please Enter Your Email or Mobile No.";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        cursorColor: Colors.black,
                        controller: passField,
                        obscureText: true,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          label: Text(
                            "Password".toUpperCase(),
                            style: inputLableStyle,
                          ),
                        ),
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "Please Enter Your Password";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            NavigateMe.push(context, ForgetPasswordRoute());
                          },
                          child: const Text(
                            "Forget Password?",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: isLoading ? null : handelFormSubmit,
                            child: isLoading
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1,
                                  )
                                : Text(
                                    "Continue",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                      ),
                      const SizedBox(height: 25),
                      ContinueWithGoogle(onPressed: () {}),
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
