import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/Auth/ForgetPassword.dart';
import 'package:shop_smart/consts/AppColor.dart';
import 'package:shop_smart/consts/Functions/Validation.dart';
import 'package:shop_smart/consts/Widgets/CustomImageNetWork.dart';
import 'package:shop_smart/consts/Widgets/subtitle.dart';
import 'package:shop_smart/consts/Widgets/title.dart';
import 'package:shop_smart/widgets/auth/CustomButtonAuthGoogle.dart';
import 'package:shop_smart/widgets/auth/CustomTextFormField.dart';
import 'package:shop_smart/widgets/profile/CustomAppBar.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final resetProvider = Provider.of<ForgetPasswordProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(
        titlepage: 'ShopSmart',
      ),
      body: Form(
        key: resetProvider.formState,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustmImageNetWork(
                urImage:
                    'https://th.bing.com/th/id/OIP.wMX4i5n3IcPGvRIwOlHZygAAAA?rs=1&pid=ImgDetMain',
                size: size.height * 0.2,
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTitle(title: "Forget Password", fontSize: 16),
              const CustomSubTitle(
                  subTitle:
                      "please enter the email address you`d like your\n passowrd reset information send to ",
                  fontSize: 16),
              const SizedBox(
                height: 40,
              ),
              CustomTextFormFieldAuth(
                  label: "Email",
                  suffix: Icons.email,
                  controller: resetProvider.emailController,
                  validator: (String? value) {
                    return validInput(value!, 10, 100, 'email');
                  },
                  obscureText: true),
              const SizedBox(
                height: 20,
              ),
              CustomButtonAuth(
                  buttonColor: AppColor.darkPrimary,
                  textColor: Colors.white,
                  titleButtn: "    Request Link",
                  colorImage: Colors.white,
                  image:
                      "https://cdn0.iconfinder.com/data/icons/freebies-1/24/send-email-2-256.png",
                  size: size)
            ],
          ),
        ),
      ),
    );
  }
}
