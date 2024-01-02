validInput(String val, int min, int max, String type) {
  if (type == "email") {
    if (val.isEmpty) {
      return " You cannot leave the field empty.";
    } else if (val.length <= min) {
      return "Email is Less than $min";
    }
  }

  if (type == "passowrd") {
    if (val.isEmpty) {
      return " You cannot leave the field empty.";
    } else if (val.length < min) {
      return "The Password is Very Weak";
    }
  }

  if (type == "username") {
    if (val.isEmpty) {
      return " You cannot leave the field empty.";
    } else if (val.length < min) {
      return "User name is short";
    }
  }
}

String? repeatPasswordValidator({String? value, String? password}) {
  if (value != password) {
    return "Is password do not match ";
  }
  return null;
}
