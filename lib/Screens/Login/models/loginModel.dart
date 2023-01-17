// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login? loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login? data) => json.encode(data!.toJson());

class Login {
  Login({
    this.msg,
    this.emailId,
    this.otp,
    this.result,
  });

  String? msg;
  String? emailId;
  int? otp;
  Result? result;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    msg: json["msg"],
    emailId: json["emailId"],
    otp: json["otp"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "emailId": emailId,
    "otp": otp,
    "result": result!.toJson(),
  };
}

class Result {
  Result({
    this.lastErrorObject,
    this.value,
    this.ok,
    this.clusterTime,
    this.operationTime,
  });

  LastErrorObject? lastErrorObject;
  Value? value;
  int? ok;
  ClusterTime? clusterTime;
  String? operationTime;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    lastErrorObject: LastErrorObject.fromJson(json["lastErrorObject"]),
    value: Value.fromJson(json["value"]),
    ok: json["ok"],
    clusterTime: ClusterTime.fromJson(json["\u0024clusterTime"]),
    operationTime: json["operationTime"],
  );

  Map<String, dynamic> toJson() => {
    "lastErrorObject": lastErrorObject!.toJson(),
    "value": value!.toJson(),
    "ok": ok,
    "\u0024clusterTime": clusterTime!.toJson(),
    "operationTime": operationTime,
  };
}

class ClusterTime {
  ClusterTime({
    this.clusterTime,
    this.signature,
  });

  String? clusterTime;
  Signature? signature;

  factory ClusterTime.fromJson(Map<String, dynamic> json) => ClusterTime(
    clusterTime: json["clusterTime"],
    signature: Signature.fromJson(json["signature"]),
  );

  Map<String, dynamic> toJson() => {
    "clusterTime": clusterTime,
    "signature": signature!.toJson(),
  };
}

class Signature {
  Signature({
    this.hash,
    this.keyId,
  });

  String? hash;
  String? keyId;

  factory Signature.fromJson(Map<String, dynamic> json) => Signature(
    hash: json["hash"],
    keyId: json["keyId"],
  );

  Map<String, dynamic> toJson() => {
    "hash": hash,
    "keyId": keyId,
  };
}

class LastErrorObject {
  LastErrorObject({
    this.n,
    this.updatedExisting,
  });

  int? n;
  bool? updatedExisting;

  factory LastErrorObject.fromJson(Map<String, dynamic> json) => LastErrorObject(
    n: json["n"],
    updatedExisting: json["updatedExisting"],
  );

  Map<String, dynamic> toJson() => {
    "n": n,
    "updatedExisting": updatedExisting,
  };
}

class Value {
  Value({
    this.id,
    this.userId,
    this.emailId,
    this.password,
    this.confirmPassword,
    this.loginType,
    this.otp,
  });

  String? id;
  String? userId;
  String? emailId;
  String? password;
  String? confirmPassword;
  String? loginType;
  String? otp;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    id: json["_id"],
    userId: json["userId"],
    emailId: json["emailId"],
    password: json["password"],
    confirmPassword: json["confirmPassword"],
    loginType: json["loginType"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "emailId": emailId,
    "password": password,
    "confirmPassword": confirmPassword,
    "loginType": loginType,
    "otp": otp,
  };
}
