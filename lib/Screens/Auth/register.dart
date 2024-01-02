// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/Auth/RegisterProvider.dart';
import 'package:shop_smart/Providers/Profile/userProvider.dart';
import 'package:shop_smart/consts/Functions/PickedImageDialog.dart';
import 'package:shop_smart/consts/Functions/ShowAlertDialog.dart';
import 'package:shop_smart/consts/Functions/Validation.dart';
import 'package:shop_smart/consts/Widgets/LoadingManger.dart';
import 'package:shop_smart/consts/Widgets/customButton.dart';
import 'package:shop_smart/consts/Widgets/subtitle.dart';
import 'package:shop_smart/consts/Widgets/title.dart';
import 'package:shop_smart/widgets/auth/CustomEditImagePersion.dart';
import 'package:shop_smart/widgets/auth/CustomTextFormField.dart';
import 'package:shop_smart/widgets/auth/CustomTitlePage.dart';

class RegisetrScreen extends StatefulWidget {
  const RegisetrScreen({
    super.key,
  });

  @override
  State<RegisetrScreen> createState() => _RegisetrScreenState();
}

class _RegisetrScreenState extends State<RegisetrScreen> {
  XFile? pickedImage;
  bool isLoading = false;
  Future<void> localPickedImage() async {
    final ImagePicker imagePicker = ImagePicker();
    return MyFunctionsApp.pickedImageDailog(
      context: context,
      cameraFCT: () async {
        pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
        setState(() {});
      },
      galleryFCT: () async {
        pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
        setState(() {});
      },
      removeFCT: () async {
        pickedImage = null;
      },
    );
  }

  void validRegistr() async {
    Size size = MediaQuery.of(context).size;
    final RegisterProvider registerProvider =
        Provider.of<RegisterProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    setState(() {
      isLoading = true;
    });

    if (registerProvider.formstate.currentState!.validate() ||
        pickedImage == null) {
      await registerProvider.handleSignUp(context, pickedImage);
      await userProvider.fecthUserInfo(context);
      context.go('/');
    } else if (pickedImage == null) {
      myShowDialog(context, size, ftc: () async {
        context.pop(context);
        await localPickedImage();
      },
          titleButton: "Picture",
          titleDialog: "The profile picture must not be left empty.");
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final RegisterProvider registerProvider =
        Provider.of<RegisterProvider>(context, listen: false);

    return Scaffold(
      body: LoadingManger(
        isLoading: isLoading,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
            child: Form(
              key: registerProvider.formstate,
              child: ListView(children: [
                const CustomTitlePage(),
                const SizedBox(
                  height: 30,
                ),
                const CustomTitle(
                  title: "Welcome  ",
                  fontSize: 20,
                ),
                const SizedBox(
                  height: 8,
                ),
                const CustomSubTitle(
                  subTitle:
                      "Sign up now to recive special offers and updates\n from our app",
                  fontSize: 15,
                ),
                const SizedBox(
                  height: 20,
                ),
                PickedImageWidget(
                  pickedImage: pickedImage,
                  funCamera: () async {
                    return await localPickedImage();
                  },
                  fubGallery: () async {
                    return await localPickedImage();
                  },
                ),
                CustomTextFormFieldAuth(
                  obscureText: false,
                  validator: (String? value) {
                    return validInput(value!, 3, 10, 'username');
                  },
                  label: 'Type Username',
                  suffix: IconlyLight.addUser,
                  controller: registerProvider.usernameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormFieldAuth(
                  obscureText: false,
                  validator: (String? value) {
                    return validInput(value!, 3, 8, 'email');
                  },
                  label: 'Type Your Email',
                  suffix: IconlyLight.message,
                  controller: registerProvider.emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormFieldAuth(
                  obscureText: true,
                  validator: (String? value) {
                    return validInput(value!, 6, 30, 'passowrd');
                  },
                  controller: registerProvider.passowrdController,
                  preffix: IconlyLight.hide,
                  label: "Password",
                  suffix: IconlyLight.lock,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormFieldAuth(
                  obscureText: true,
                  validator: (value) {
                    return repeatPasswordValidator(
                        value: value,
                        password: registerProvider.passowrdController.text);
                  },
                  controller: registerProvider.repeatPassowrd,
                  preffix: IconlyLight.hide,
                  label: "Repeat Password",
                  suffix: IconlyLight.lock,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  heightButton: 50,
                  widthButton: 200,
                  onPressed: validRegistr,
                  paddingButton: 20,
                  titleButton: "Sign Up",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
