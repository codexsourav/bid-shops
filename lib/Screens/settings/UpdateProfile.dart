import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bid_and_shops/Components/simmer/imageLoader.dart';
import 'package:bid_and_shops/Helper/MakeProvider.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Helper/SnackBar/showSnackBar.dart';
import 'package:bid_and_shops/Provider/UserProfileProvider.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  late UserProfileProvider userProfileProvider;
  bool isLoading = false;
  final TextEditingController textEditingController = TextEditingController();
  String image = "";
  File? imageFile;

  Future<void> pickAImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    print(['jpg', "jpeg", "png"]
        .contains(result!.files.first.extension.toString().toLowerCase()));
    if (result == null ||
        !['jpg', "jpeg", "png"]
            .contains(result.files.first.extension.toString().toLowerCase())) {
      Fluttertoast.showToast(msg: "Selct a Valid Image File");
    } else {
      String? filePath = result.files.first.path;

      setState(() {
        imageFile = File("$filePath");
      });

      if (filePath != null) {
        ApiRequest apiRequest = ApiRequest(
          path: "/upload",
          method: "POST",
          body: FormData.fromMap(
            {
              "file": await MultipartFile.fromFile(
                filePath,
                filename: result.files.first.name,
              ),
            },
          ),
        );
        try {
          setState(() {
            isLoading = true;
          });
          Response response = await apiRequest.send();
          setState(() {
            isLoading = false;
            image = response.data['filename'];
          });
        } catch (e) {
          Fluttertoast.showToast(msg: "Image Not Uploaded");
          setState(() {
            isLoading = false;
          });
        }
      }
    }
  }

  saveProfile() async {
    FocusScope.of(context).requestFocus(FocusNode());
    Fluttertoast.showToast(msg: "Updating Profile");
    try {
      ApiRequest apiRequest =
          ApiRequest(path: "/api/settings/profile", method: "PUT", body: {
        "profile": image,
        "name": textEditingController.text,
      });
      setState(() {
        isLoading = true;
      });
      Response response = await apiRequest.send();
      if (response.data['success'] == true) {
        ShowSnackBar(context,
            contentType: ContentType.success,
            message: response.data['message'] ?? "Proofile Update Successfuly",
            title: "Profile Updated");
        userProfileProvider.setUserData(response.data['profile']);
        NavigateMe.pop(context);
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        msg: e.response?.data['error'] ??
            e.response?.data['message'] ??
            "Something Want Wrong!",
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    userProfileProvider =
        UseProvider<UserProfileProvider>(context, listen: false);
    textEditingController.text = userProfileProvider.userData!['name'] ?? "";
    image = userProfileProvider.userData!['profile'];
    super.initState();
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
        title: const Text("Update Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            GestureDetector(
              onTap: pickAImage,
              child: Builder(builder: (context) {
                if (imageFile != null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.file(
                      imageFile!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  );
                }
                return ImageLoader(
                  radius: 100,
                  width: 80,
                  height: 80,
                  imageUrl: "${ApiRequest().endPoint}/$image",
                );
              }),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                label: Text("FULL NAME"),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ElevatedButton(
                onPressed: isLoading ? null : saveProfile,
                child: const Text(
                  "Update Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
