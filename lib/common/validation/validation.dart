class Validation {
  static final Validation _instance = Validation._internal();

  factory Validation() {
    return _instance;
  }

  Validation._internal();

  String? shopNameValidation(String shopName) {
    if (shopName.isEmpty) {
      return "Shop Name Field is Required";
    } else if (shopName.length <= 3) {
      return "more then 3 Characters are required";
    }
    return null;
  }

  String? emailValidation(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    if (email.isEmpty) {
      return "email Field is Required";
    } else if (!regExp.hasMatch(email)) {
      return "Enter Valid Email";
    }
    return null;
  }

  String? phoneValidation(String phoneNo) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (phoneNo.isEmpty) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(phoneNo)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String? passValidation(String password) {
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';
    RegExp regExp = RegExp(pattern);
    if (password.isEmpty) {
      return 'Please enter mobile password';
    }
    else if (!regExp.hasMatch(password)) {
      return 'Minimum eight characters, at least one letter, one number and one special character are required';
    }
    return null;
  }

  String? nameValidation(String name) {
    if(name.isEmpty) {
      return "Contact Name Field is Required";
    }
    return null;
  }

  String? aboutMeValidation(String aboutMe) {
    if(aboutMe.isEmpty) {
      return "Field is Required";
    }
    return null;
  }

  String? addressValidation(String address) {
    if(address.isEmpty) {
      return "Address Field is Required";
    }
    return null;
  }
}
