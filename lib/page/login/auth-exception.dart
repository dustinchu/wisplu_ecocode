import 'package:flutter/material.dart';
import '../../generated/l10n.dart';

class AuthExceptionHandler {
  static handleException(BuildContext context, e) {
    print("error code ===${e.code}");
    switch (e.code) {
      case "ERROR_INVALID_EMAIL":
        return S.of(context).errorInvalidEmail;
        break;
      case "ERROR_WRONG_PASSWORD":
        return S.of(context).errorWrongPassword;
        break;
      case "ERROR_USER_NOT_FOUND":
        return S.of(context).errorUserNotFound;
        break;
      case "ERROR_USER_DISABLED":
        return S.of(context).errorUserDisabled;
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        return S.of(context).errorTooManyRequests;
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        return S.of(context).errorOperationNotAllowed;
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        return S.of(context).errorEmailAlreadyInUse;
        break;
      default:
        return S.of(context).error;
    }
  }
}
