// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bid_and_shops/Helper/MakeProvider.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Provider/UserProfileProvider.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:bid_and_shops/Services/Storage/Storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Helper/SnackBar/showSnackBar.dart';

class UpdateEmail extends StatefulWidget {
  const UpdateEmail({super.key});

  @override
  State<UpdateEmail> createState() => _UpdateEmailState();
}

class _UpdateEmailState extends State<UpdateEmail> {
  late UserProfileProvider userProfileProvider;
  bool isLoading = false;
  final TextEditingController textEditingController = TextEditingController();
  UseLocalStorage useLocalStorage = UseLocalStorage(storage: localStorage);

  @override
  void initState() {
    userProfileProvider =
        UseProvider<UserProfileProvider>(context, listen: false);
    textEditingController.text = userProfileProvider.userData!['email'] ?? "";
    super.initState();
  }

  updateMail() async {
    if (userProfileProvider.userData!['email'] != textEditingController.text) {
      Fluttertoast.showToast(msg: "Updating Email");
      try {
        ApiRequest apiRequest = ApiRequest(
          path: "/api/settings/email",
          method: "PUT",
          body: {"email": textEditingController.text},
        );
        Response response = await apiRequest.send();

        if (response.data['success'] == true) {
          userProfileProvider.setUserData(response.data['profile']);
          if (response.data['token'] != null) {
            useLocalStorage.setStorage(
                key: "authKey", data: response.data['token']);
          }
          ShowSnackBar(context,
              contentType: ContentType.success,
              message: response.data['message'] ?? "Email Update Successfully",
              title: "Email Updated");
        } else {
          ShowSnackBar(context,
              contentType: ContentType.failure,
              message: response.data['error'] ??
                  response.data['message'] ??
                  "Something Want Wrong!",
              title: "Email Update Field");
        }
      } on DioException catch (e) {
        ShowSnackBar(context,
            contentType: ContentType.failure,
            message: e.response?.data['error'] ??
                e.response?.data['message'] ??
                "Something Want Wrong!",
            title: "Email Update Field");
        setState(() {
          isLoading = false;
        });
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
        title: const Text("Update Email"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                label: Text("EMAIL ID"),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ElevatedButton(
                  onPressed: isLoading ? null : updateMail,
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1,
                        )
                      : const Text(
                          "Update Your Email",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
            )
          ],
        ),
      ),
    );
  }
}
