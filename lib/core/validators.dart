class AppValidators {
  AppValidators._();

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }else if (emailRegex.hasMatch(val) == false) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    // final regex = RegExp(
    //   r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
    // );
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }    if (val.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(val)) {
      return 'Password must contain an uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(val)) {
      return 'Password must contain a lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(val)) {
      return 'Password must contain a number';
    }

    if (!RegExp(r'[#?!@$%^&*-]').hasMatch(val)) {
      return 'Password must contain a special character';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'This Field Is Required';
    } else if (val != password) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }

  static String? validateUsername(String? val) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null || val.isEmpty) {
      return 'This Field is required';
    } else if (!usernameRegex.hasMatch(val)) {
      return 'Enter valid Name';
    } else {
      return null;
    }
  }
  static String? validateFullName(String? val) {
    if (val == null || val.isEmpty) {
      return 'FullName is required';
    } else {
      return null;
    }
  }


  // static String? validatePhoneNumber(String? val) {
  //   if (val == null) {
  //     return 'this field is required';
  //   } else if (int.tryParse(val.trim()) == null) {
  //     return 'enter numbers only';
  //   } else if (val.trim().length != 11) {
  //     return 'enter value must equal 11 digit';
  //   } else {
  //     return null;
  //   }
  // }

  static String? validatePhoneNumber(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'Phone number is required';
    }

    if (int.tryParse(val.trim()) == null) {
      return 'Enter numbers only';
    }

    if (val.trim().length != 11) {
      return 'Phone number must be 11 digits';
    }

    final regex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
    if (!regex.hasMatch(val.trim())) {
      return 'Enter a valid Egyptian phone number';
    }

    return null;
  }




}