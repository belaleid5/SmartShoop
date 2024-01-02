import 'package:flutter/material.dart';

class ForgetPasswordProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
}
