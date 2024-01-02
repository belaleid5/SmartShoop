import 'dart:io' show File;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class RegisterProvider with ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passowrdController = TextEditingController();
  final TextEditingController repeatPassowrd = TextEditingController();

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? userImageUrl;
  Future handleSignUp(
    BuildContext context,
    XFile? pickedimage,
  ) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child("userImages")
          .child("${emailController.text.trim()}.jpg");
      await ref.putFile(File(pickedimage!.path));
      userImageUrl = await ref.getDownloadURL();

      await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passowrdController.text,
      );
      User? user = auth.currentUser;
      final uid = user!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        "userId": uid,
        "userName": usernameController.text.toLowerCase(),
        "userImage": userImageUrl,
        "userEmail": emailController.text.toLowerCase(),
        "createdAt": Timestamp.now(),
        "userCart": [],
        "userWish": [],
      });

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        context.go("/");
        showToast(
          'Success create an account!',
          context: context,
          animation: StyledToastAnimation.scale,
          reverseAnimation: StyledToastAnimation.fade,
          position: StyledToastPosition.center,
          animDuration: const Duration(seconds: 1),
          duration: const Duration(seconds: 4),
          curve: Curves.elasticOut,
          reverseCurve: Curves.linear,
        );
      });
    } on FirebaseAuthException catch (error) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        showToast(
          ' Invild create an account , ${error.message} ',
          context: context,
          animation: StyledToastAnimation.scale,
          reverseAnimation: StyledToastAnimation.fade,
          position: StyledToastPosition.center,
          animDuration: const Duration(seconds: 1),
          duration: const Duration(seconds: 4),
          curve: Curves.elasticOut,
          reverseCurve: Curves.linear,
        );
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passowrdController.dispose();
    repeatPassowrd.dispose();
    usernameController.dispose();

    super.dispose();
  }
}
