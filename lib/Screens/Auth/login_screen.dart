// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/Auth/LoginProvider.dart';
import 'package:shop_smart/Providers/Profile/userProvider.dart';
import 'package:shop_smart/consts/Functions/Validation.dart';
import 'package:shop_smart/consts/Widgets/LoadingManger.dart';
import 'package:shop_smart/consts/Widgets/customButton.dart';
import 'package:shop_smart/consts/Widgets/subtitle.dart';
import 'package:shop_smart/consts/Widgets/title.dart';
import 'package:shop_smart/widgets/auth/CustomButtonAuthGoogle.dart';
import 'package:shop_smart/widgets/auth/CustomButtonGuest.dart';
import 'package:shop_smart/widgets/auth/CustomForgetPassword.dart';
import 'package:shop_smart/widgets/auth/CustomGoToSignUp.dart';
import 'package:shop_smart/widgets/auth/CustomTextFormField.dart';
import 'package:shop_smart/widgets/auth/CustomTitlePage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  void loginEmailWithPassword() async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    setState(() {
      isLoading = true;
    });
    if (loginProvider.formState.currentState!.validate()) {
      await loginProvider.handleSignInEmail(context).then(
            (value) => userProvider.fecthUserInfo(context),
          );
    }
    setState(() {
      isLoading = false;
    });
  }

  void signInWithGoogle() async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    setState(() {
      isLoading = true;
    });
    await loginProvider.handlSignInWithGoogle(context: context);
    await userProvider.fecthUserInfo(context);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LoadingManger(
        isLoading: isLoading,
        child: Form(
          key: loginProvider.formState,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, right: 15, left: 15),
            child: ListView(
              children: [
                const CustomTitlePage(),
                const SizedBox(
                  height: 30,
                ),
                const CustomTitle(
                  title: "Welcome Back ",
                  fontSize: 20,
                ),
                const SizedBox(
                  height: 8,
                ),
                const CustomSubTitle(
                  subTitle:
                      "Let`s get you logged in so you can start exploring",
                  fontSize: 15,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormFieldAuth(
                  obscureText: false,
                  validator: (String? value) {
                    return validInput(value!, 10, 100, 'email');
                  },
                  label: 'Type Your Email',
                  suffix: IconlyLight.message,
                  controller: loginProvider.emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormFieldAuth(
                  obscureText: true,
                  validator: (String? value) {
                    return validInput(value!, 6, 30, 'passowrd');
                  },
                  controller: loginProvider.passwordController,
                  preffix: IconlyLight.hide,
                  label: "Password",
                  suffix: IconlyLight.lock,
                ),
                const CustomForgetPassword(),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  heightButton: 50,
                  widthButton: 200,
                  onPressed: loginEmailWithPassword,
                  paddingButton: 20,
                  titleButton: "Sign In",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: CustomSubTitle(
                    subTitle: "OR CONNECT USING",
                    fontSize: 22,
                    color: Colors.black.withOpacity(0.23),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CustomButtonAuth(
                        onPressed: signInWithGoogle,
                        buttonColor: Colors.white.withOpacity(0.9),
                        titleButtn: "Sign in with google",
                        image:
                            'https://icones.pro/wp-content/uploads/2021/02/google-icone-symbole-png-logo-rouge.png',
                        size: size),
                    const SizedBox(
                      width: 10,
                    ),
                    const CustomButtonGuest(),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const CustomGoToSignUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
