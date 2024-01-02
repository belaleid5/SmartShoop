import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  final FirebaseAuth auth = FirebaseAuth.instance;
  Future handleSignInEmail(BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go("/");
        showToast(
          'Login Success!',
          backgroundColor: Colors.green,
          context: context,
          animation: StyledToastAnimation.fade,
          reverseAnimation: StyledToastAnimation.slideFromBottom,
          position: StyledToastPosition.center,
          animDuration: const Duration(seconds: 2),
          duration: const Duration(seconds: 4),
          curve: Curves.easeInBack,
          reverseCurve: Curves.easeIn,
        );
      });
    } on FirebaseAuthException catch (error) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        showToast(
          "Not Found this user, ${error.message}",
          backgroundColor: Colors.red,
          textPadding: const EdgeInsets.all(20),
          context: context,
          animation: StyledToastAnimation.scale,
          reverseAnimation: StyledToastAnimation.slideFromBottom,
          position: StyledToastPosition.center,
          animDuration: const Duration(seconds: 2),
          duration: const Duration(seconds: 4),
          curve: Curves.elasticOut,
          reverseCurve: Curves.linear,
        );
      });
    }
  }

  Future<User?> handlSignInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        if (userCredential.additionalUserInfo!.isNewUser) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(
                auth.currentUser!.uid,
              )
              .set({
            "userId": userCredential.user!.uid,
            "userName": userCredential.user!.displayName,
            "userImage": userCredential.user!.photoURL,
            "userEmail": userCredential.user!.email,
            "createdAt": Timestamp.now(),
            "userCart": [],
            "userWish": [],
          });
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.go("/");
          showToast(
            'Login Success!',
            backgroundColor: Colors.green,
            context: context,
            animation: StyledToastAnimation.fade,
            reverseAnimation: StyledToastAnimation.slideFromBottom,
            position: StyledToastPosition.center,
            animDuration: const Duration(seconds: 2),
            duration: const Duration(seconds: 4),
            curve: Curves.easeInBack,
            reverseCurve: Curves.easeIn,
          );
        });

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            showToast(
              "account-exists-with-different-credential",
              backgroundColor: Colors.red,
              textPadding: const EdgeInsets.all(20),
              context: context,
              animation: StyledToastAnimation.scale,
              reverseAnimation: StyledToastAnimation.slideFromBottom,
              position: StyledToastPosition.center,
              animDuration: const Duration(seconds: 2),
              duration: const Duration(seconds: 4),
              curve: Curves.elasticOut,
              reverseCurve: Curves.linear,
            );
          });
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            showToast(
              "invalid-credential, ${e.message}",
              backgroundColor: Colors.red,
              textPadding: const EdgeInsets.all(20),
              context: context,
              animation: StyledToastAnimation.scale,
              reverseAnimation: StyledToastAnimation.slideFromBottom,
              position: StyledToastPosition.center,
              animDuration: const Duration(seconds: 2),
              duration: const Duration(seconds: 4),
              curve: Curves.elasticOut,
              reverseCurve: Curves.linear,
            );
          });
          // handle the error here
        }
      } catch (e) {
        if (kDebugMode) {
          print("Exption auth google ======== $e ====");
        }
      }
    }

    return user;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
