import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_smart/Providers/Auth/LoginProvider.dart';
import 'package:shop_smart/consts/Functions/ShowAlertDialog.dart';

class CustomButtonLogOut extends StatefulWidget {
  const CustomButtonLogOut({
    super.key,
    required this.colorButton,
    required this.paddingButton,
    required this.titleButton,
    this.icon,
  });

  final Color colorButton;
  final double paddingButton;
  final Icon? icon;
  final String titleButton;

  @override
  State<CustomButtonLogOut> createState() => _CustomButtonLogOutState();
}

class _CustomButtonLogOutState extends State<CustomButtonLogOut> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    User? user = FirebaseAuth.instance.currentUser;
    final Size size = MediaQuery.of(context).size;

    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(widget.paddingButton),
            backgroundColor: widget.colorButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
        icon: widget.icon!,
        onPressed: () {
          setState(() {
            myShowDialog(context, size, ftc: () {
              if (user != null) {
                FirebaseAuth.instance.signOut();
                loginProvider.emailController.clear();
                loginProvider.passwordController.clear();
                GoRouter.of(context).pushReplacement("/login");
              } else if (user == null) {
                context.go("/login");
              }
            }, titleButton: "Exit", titleDialog: "Are You Sure");
          });
        },
        label: Text(widget.titleButton));
  }
}
