import 'package:flutter/services.dart';

/// 隐私政策
const kSetPrivacyAPIKey = 'flutter_baidu_yingyan_trace/sdk/setAgreePrivacy';

/// 鹰眼sdk
class TraceSDK {
  /// 设置用户是否同意SDK隐私协议，默认false，since 2.1.0
  ///
  /// 设置为false时，将影响鹰眼SDK所有功能的使用
  ///
  /// 隐私政策官网链接：https://lbsyun.baidu.com/index.php?title=openprivacy
  /// isAgree 用户是否同意SDK隐私协议
  static void setAgreePrivacy(bool isAgree) async {
    try {
      await MethodChannel('flutter_baidu_yingyan_trace')
          .invokeMethod(kSetPrivacyAPIKey, {'isAgree': isAgree});
    } catch (e) {
      print(e.toString());
    }
  }
}
