import 'dart:convert';
import 'package:flutter_base/generated/json/base/json_field.dart';
import 'package:flutter_base/generated/json/auto_login_json_entity.g.dart';

@JsonSerializable()
class AutoLoginJsonEntity {

	late String userCode;
	late int gender;
	late String avatar;
	late int level;
	late String signature;
	late String nickname;
	late int follows;
	late int fans;
	late int birthday;
	late int userType;
	late String token;
	late String imBigGroupId;
	late String mobile;
	late int isBeautyUserCode;
	late int isUpstart;
	late int isRegister;
	late int pearl;
	late int coin;
	late int isLeader;
	late bool dailySign;
	late int userId;
	late bool forbidWords;
	late bool dailyGift;
	late String imSign;
	late int imUser;
  
  AutoLoginJsonEntity();

  factory AutoLoginJsonEntity.fromJson(Map<String, dynamic> json) => $AutoLoginJsonEntityFromJson(json);

  Map<String, dynamic> toJson() => $AutoLoginJsonEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}