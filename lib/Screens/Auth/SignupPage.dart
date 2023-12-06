import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bid_and_shops/Components/AuthHeader/AuthHeader.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Helper/SnackBar/showSnackBar.dart';
import 'package:bid_and_shops/Manager/Themes/Tweeks.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:bid_and_shops/Utils/EmailValidate.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isLoading = false;
  GlobalKey<FormState> signupForm = GlobalKey<FormState>();

  TextEditingController emailField = TextEditingController();

  TextEditingController nameField = TextEditingController();

  TextEditingController mobileField = TextEditingController();

  TextEditingController passField = TextEditingController();

  TextEditingController cpassField = TextEditingController();

  void handelFormSubmit() async {
    if (signupForm.currentState!.validate()) {
      await makeSignupTask();
    }
  }

  Future<void> makeSignupTask() async {
    ApiRequest loginRequest =
        ApiRequest(path: "/api/auth/signup", method: "POST", body: {
      "name": nameField.text,
      "email": emailField.text,
      "mobile": mobileField.text,
      "pass": passField.text
    });
    try {
      setState(() {
        isLoading = true;
      });
      Response loginResponse = await loginRequest.send();
      Map data = loginResponse.data;
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
        NavigateMe.push(
          context,
          OtpRoute(
            mobile: data['mobile'],
          ),
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const AuthHeader(
                  title: "Hey, Welcome back!",
                  desc:
                      "Log in now to dive into the excitement of bidding on your favorite items.",
                ),
                Form(
                  key: signupForm,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        TextFormField(
                          cursorColor: Colors.black,
                          controller: nameField,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            label: Text(
                              "Full Name".toUpperCase(),
                              style: inputLableStyle,
                            ),
                          ),
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Please Enter Your Name.";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          cursorColor: Colors.black,
                          controller: emailField,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            label: Text(
                              "Email ID".toUpperCase(),
                              style: inputLableStyle,
                            ),
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
                        TextFormField(
                          cursorColor: Colors.black,
                          controller: mobileField,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            label: Text(
                              "Phone Number".toUpperCase(),
                              style: inputLableStyle,
                            ),
                          ),
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Please Enter Your Mobile.";
                            } else if (e.length != 10) {
                              return "Invalid Mobile Number";
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
                            } else if (e.length <= 4) {
                              return "Password Too Short! Min 5";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          cursorColor: Colors.black,
                          controller: cpassField,
                          obscureText: true,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            label: Text(
                              "Confirm Password".toUpperCase(),
                              style: inputLableStyle,
                            ),
                          ),
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Please Enter Confirm Password";
                            } else if (passField.text != cpassField.text) {
                              return "Password Not Matched!";
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
                                    color: Colors.white,
                                    strokeWidth: 1,
                                  )
                                : Text(
                                    "Signup Now",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 25),
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
      ),
    );
  }
}
