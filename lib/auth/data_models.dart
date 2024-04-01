
import '../base/base_controller.dart';

class Authentication extends DataModel {

  Authentication({
    super.code,
    super.message
  });

  factory Authentication.fromJson(Map<String, dynamic> json) => Authentication(
    code: ResponseCode.fromJson(json),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "code": code?.value,
  };
}