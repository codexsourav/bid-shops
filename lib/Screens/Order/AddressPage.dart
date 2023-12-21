// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bid_and_shops/Helper/MakeProvider.dart';
import 'package:bid_and_shops/Helper/Navigate/Navigation.dart';
import 'package:bid_and_shops/Helper/SnackBar/showSnackBar.dart';
import 'package:bid_and_shops/Provider/UserProfileProvider.dart';
import 'package:bid_and_shops/Screens/Order/OrderPreview.dart';
import 'package:bid_and_shops/Services/Api/ApiRequest.dart';
import 'package:bid_and_shops/Utils/ThemeColor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';

class AddressPage extends StatefulWidget {
  final bool forUpdate;
  const AddressPage({super.key, this.forUpdate = false});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  late UserProfileProvider userProfileProvider;
  bool loading = false;

  GlobalKey<FormState> addressForm = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController addressLine2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController =
      TextEditingController(text: "India");

  Future updateAddress() async {
    ApiRequest apiRequest = ApiRequest(
      body: {
        "fullName": nameController.text,
        "phone": phoneController.text,
        "addressLine1": addressLine1Controller.text,
        "addressLine2": addressLine2Controller.text,
        "city": cityController.text,
        "state": stateController.text,
        "postalCode": postalCodeController.text,
        "country": countryController.text,
      },
      path: "/api/address",
      method: "PATCH",
    );
    try {
      setState(() {
        loading = true;
      });
      Response response = await apiRequest.send();
      setState(() {
        loading = false;
      });
      if (response.data['success'] == true) {
        userProfileProvider.setUserData(response.data['res']);

        if (widget.forUpdate == false) {
          Navigation.pop(context);
          Navigation.push(context, page: OrderPreviewPage());
        } else {
          ShowSnackBar(
            context,
            title: 'Your Address Updated',
            message: (response.data!['error'] ??
                response.data!['message'] ??
                "Your Address Update Successfully"),
            contentType: ContentType.success,
          );
          Navigation.pop(context);
        }
      } else {
        ShowSnackBar(
          context,
          title: 'Update Error',
          message: (response.data!['error'] ??
              response.data!['message'] ??
              "Something Want Wrong!"),
          contentType: ContentType.failure,
        );
      }
    } on DioException catch (e) {
      print(e.error);
      setState(() {
        loading = false;
      });
      if (e.response?.data != null) {
        ShowSnackBar(
          context,
          title: 'Update Error',
          message: (e.response!.data!['error'] ??
              e.response!.data!['message'] ??
              "Something Want Wrong!"),
          contentType: ContentType.failure,
        );
      } else {
        ShowSnackBar(
          context,
          title: 'Update Error',
          message: "Something Want Wrong!",
          contentType: ContentType.failure,
        );
      }
    }
  }

  @override
  void initState() {
    userProfileProvider =
        UseProvider<UserProfileProvider>(context, listen: false);
    Map? address = userProfileProvider.userData!['address'];
    if (address != null) {
      nameController.text = address["fullName"] ?? "";
      phoneController.text = address["phone"] ?? "";
      addressLine1Controller.text = address["addressLine1"] ?? "";
      addressLine2Controller.text = address["addressLine2"] ?? "";
      cityController.text = address["city"] ?? "";
      stateController.text = address["state"] ?? "";
      postalCodeController.text = address["postalCode"] ?? "";
      countryController.text = address["country"] ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List makeForm = [
      {
        "title": "Full Name",
        "controller": nameController,
        "keyboard": TextInputType.name,
        "validate": null,
      },
      {
        "title": "Mobile Number",
        "controller": phoneController,
        "keyboard": TextInputType.phone,
        "validate": (String? e) {
          if (e!.isEmpty) {
            return "Please Enter Your Mobile Number";
          } else if (e.length != 10) {
            return "Invalid Mobile Number";
          } else if (int.tryParse(e.toString()) == null) {
            return "Invalid Mobile Number";
          } else {
            return null;
          }
        },
      },
      {
        "title": "Address Line 1",
        "controller": addressLine1Controller,
        "keyboard": TextInputType.text,
        "validate": null,
      },
      {
        "title": "Address Line 2",
        "controller": addressLine2Controller,
        "keyboard": TextInputType.text,
        "validate": null,
      },
      {
        "title": "City",
        "controller": cityController,
        "keyboard": TextInputType.text,
        "validate": null,
      },
      {
        "title": "State",
        "controller": stateController,
        "keyboard": TextInputType.text,
        "validate": null,
      },
      {
        "title": "Postal Code",
        "controller": postalCodeController,
        "keyboard": TextInputType.number,
        "validate": (String? e) {
          if (e!.isEmpty) {
            return "Please Enter Your Postal Code";
          } else if (e.length <= 5) {
            return "Invalid Postal Code";
          } else if (int.tryParse(e.toString()) == null) {
            return "Invalid Postal Code";
          } else {
            return null;
          }
        },
      },
      {
        "title": "Country",
        "controller": countryController,
        "keyboard": TextInputType.text,
        "validate": null,
        "isOnlyRead": true,
      }
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigation.pop(context);
          },
          icon: const Center(
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text("Confirm Your Address"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: addressForm,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ...List.generate(
                  makeForm.length,
                  (index) => AddressInputBox(
                    controller: makeForm[index]['controller'],
                    title: makeForm[index]['title'],
                    validate: makeForm[index]['validate'],
                    keyboardType: makeForm[index]['keyboard'],
                    readOnly: makeForm[index]['isOnlyRead'] ?? false,
                  ),
                ),
                NeoPopButton(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  onTapUp: loading
                      ? null
                      : () async {
                          if (addressForm.currentState!.validate()) {
                            await updateAddress();
                          }
                        },
                  parentColor: Colors.transparent,
                  buttonPosition: Position.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          loading
                              ? "Loading..."
                              : widget.forUpdate
                                  ? "Update Address"
                                  : "Continue Process",
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddressInputBox extends StatelessWidget {
  const AddressInputBox({
    super.key,
    required this.controller,
    required this.title,
    this.validate,
    this.keyboardType,
    this.readOnly = false,
    this.ispass = false,
  });

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool ispass;
  final String title;
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    TextStyle inputText =
        TextStyle(color: themeColor(context), fontWeight: FontWeight.w600);
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        readOnly: readOnly,
        cursorColor: themeColor(context),
        keyboardType: keyboardType,
        controller: controller,
        style: inputText,
        obscureText: ispass,
        decoration: InputDecoration(
          label: Text(
            title.toUpperCase(),
          ),
        ),
        validator: validate ??
            (e) {
              if (e!.isEmpty) {
                return "Please Enter Your ${title}";
              } else {
                return null;
              }
            },
      ),
    );
  }
}
