// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Helper/SnackBar/showSnackBar.dart';
import 'package:bid_and_shops/Screens/Order/AddressPage.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  GlobalKey<FormState> passForm = GlobalKey<FormState>();

  bool isLoading = false;
  final TextEditingController currentEditingController =
      TextEditingController();
  final TextEditingController passEditingController = TextEditingController();
  final TextEditingController CPassEditingController = TextEditingController();

  updatePassword() async {
    if (passForm.currentState!.validate()) {
      ApiRequest apiRequest = ApiRequest(
        path: "/api/settings/password",
        method: "PUT",
        body: {
          "currentPass": currentEditingController.text,
          "newPass": CPassEditingController.text,
        },
      );
      Fluttertoast.showToast(msg: "Updating Password");
      setState(() {
        isLoading = true;
      });
      try {
        Response data = await apiRequest.send();
        setState(() {
          isLoading = false;
        });
        if (data.data['success'] == true) {
          ShowSnackBar(context,
              contentType: ContentType.success,
              message: data.data['message'] ??
                  data.data['error'] ??
                  "Your Password Successfully Updated",
              title: "Password Updated");
          NavigateMe.pop(context);
        } else {
          ShowSnackBar(context,
              contentType: ContentType.failure,
              message: data.data['message'] ??
                  data.data['error'] ??
                  "Your Password Not Updated",
              title: "Password Updated Field");
        }
      } on DioException catch (e) {
        setState(() {
          isLoading = false;
        });
        ShowSnackBar(context,
            contentType: ContentType.failure,
            message: e.response?.data['message'] ??
                e.response?.data['error'] ??
                "Your Password Not Updated",
            title: "Password Updated Field");
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
        title: const Text("Change Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: passForm,
          child: Column(
            children: [
              AddressInputBox(
                controller: currentEditingController,
                title: "Current Password",
                ispass: true,
              ),
              AddressInputBox(
                controller: passEditingController,
                title: "New Password",
                ispass: true,
                validate: (e) {
                  if (e == null || e.isEmpty) {
                    return "Please Enter Your Password";
                  } else if (e.length <= 5) {
                    return "Password Too Short";
                  } else {
                    return null;
                  }
                },
              ),
              AddressInputBox(
                controller: CPassEditingController,
                title: "Confirm New Password",
                ispass: true,
                validate: (e) {
                  if (CPassEditingController.text !=
                      passEditingController.text) {
                    return "Password Not Matched!";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: isLoading ? null : updatePassword,
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1,
                        )
                      : const Text(
                          "Update Your Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
