import 'error.dart';

ErrorType getErrorType(Map<String, dynamic> errorRes) {
  if (errorRes.containsKey('username')) return ErrorType.username_taken;
  if (errorRes.containsKey('email')) return ErrorType.email_taken;
  if (errorRes.containsKey('password')) return ErrorType.password_dont_match;
  if (errorRes.containsKey('phone')) return ErrorType.phone_exists;

  return ErrorType.generic;
}

String errorTypeToString(ErrorType errorType) {
  switch (errorType) {
    case ErrorType.email_taken:
      return 'Email has been used';
    case ErrorType.username_taken:
      return 'Username has been taken';
    case ErrorType.password_dont_match:
      return 'Passowrds do not Match';
    case ErrorType.network:
      return 'Please make sure your device is connected to the internet';
    case ErrorType.phone_exists:
      return 'Phone number already exists!';
    case ErrorType.invalid_OTP:
      return 'Invalid OTP!';
    case ErrorType.invalid_credentials:
      return 'Incorrect Phone / Password!';
    case ErrorType.user_not_exists:
      return 'User does not exists!';
    case ErrorType.invalid_qr_code:
      return 'Invalid QR Code';
    case ErrorType.qr_code_already_linked:
      return 'User already has a QR Code Linked to account';
    case ErrorType.incorrect_password:
      return 'Incorrect password';
    case ErrorType.user_already_exists:
      return 'User already exists';
    case ErrorType.login:
      return 'Please, Login again';
    //login
    default:
      return 'Unknown Error Occurred';
  }
}
