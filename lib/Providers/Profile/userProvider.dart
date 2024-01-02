import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shop_smart/Models/userModel.dart';

class UserProvider with ChangeNotifier {
  UserModel? userModel;
  UserModel? get getUserModel => userModel;
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  Future<UserModel?> getUserInfo() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null) {
      return null;
    } else {
      var uid = user.uid;
      try {
        final userdoc =
            await FirebaseFirestore.instance.collection("users").doc(uid).get();
        final userDicDoc = userdoc.data();
        userModel = UserModel(
          userId: userdoc.get("userId"),
          userName: userdoc.get("userName"),
          userImage: userdoc.get("userImage"),
          userEmail: userdoc.get("userEmail"),
          createdAt: userdoc.get("createdAt"),
          userCart: userDicDoc!.containsKey("userCart")
              ? userdoc.get('userCart')
              : [],
          userWish:
              userDicDoc.containsKey("userWish") ? userdoc.get('userWish') : [],
        );
        return userModel;
      } on FirebaseAuthException catch (error) {
        throw error.message.toString();
      } catch (error) {
        rethrow;
      }
    }
  }

  Future<void> fecthUserInfo(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user == null) {
      return;
    }
    try {
      userModel = await getUserInfo();
    } catch (erro) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showToast(
          "An error has been occured =====",
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
}
