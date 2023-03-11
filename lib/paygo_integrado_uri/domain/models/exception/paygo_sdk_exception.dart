// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

class PayGOSdkException implements Exception {
  final int? code;
  final String? platformInfo;
  final String? message;
  final dynamic object;

  PayGOSdkException({
    this.code,
    this.platformInfo,
    this.message,
    this.object,
  });

  @override
  String toString() =>
      'PayGOSdkException( code: $code, platformInfo: $platformInfo, message: $message, object: $object)';

  @override
  bool operator ==(covariant PayGOSdkException other) {
    if (identical(this, other)) return true;

    return other.code == code &&
        other.platformInfo == platformInfo &&
        other.message == message &&
        other.object == object;
  }

  @override
  int get hashCode => code.hashCode ^ platformInfo.hashCode ^ message.hashCode ^ object.hashCode;
}
