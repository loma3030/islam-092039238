import 'package:get/get.dart';

String? validInput(String val, int min, int max, String type) {
  // تحقق من الطول
  if (val.length < min || val.length > max) {
    return "$type يجب أن يكون بين $min و $max حرفًا";
  }

  if (type == "username") {
    // تعبير منتظم لقبول الأحرف العربية والإنجليزية والأرقام ومسافة واحدة بين الأسماء
    final validNameRegex =
        RegExp(r"^[\p{L}\p{N}]+(?: [\p{L}\p{N}]+)*$", unicode: true);

    // تحقق من مطابقة التعبير المنتظم
    if (!validNameRegex.hasMatch(val)) {
      return "اسم المستخدم غير صالح. يجب أن يحتوي على أحرف فقط ويمكن أن يحتوي على مسافة واحدة بين الأسماء";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }

  if (val.isEmpty) {
    return "can't be Empty";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
  return null;
}
