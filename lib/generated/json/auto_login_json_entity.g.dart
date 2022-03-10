import 'package:flutter_base/generated/json/base/json_convert_content.dart';
import 'package:flutter_base/app/module/splash/bean/auto_login_json_entity.dart';

AutoLoginJsonEntity $AutoLoginJsonEntityFromJson(Map<String, dynamic> json) {
	final AutoLoginJsonEntity autoLoginJsonEntity = AutoLoginJsonEntity();
	final String? userCode = jsonConvert.convert<String>(json['userCode']);
	if (userCode != null) {
		autoLoginJsonEntity.userCode = userCode;
	}
	final int? gender = jsonConvert.convert<int>(json['gender']);
	if (gender != null) {
		autoLoginJsonEntity.gender = gender;
	}
	final String? avatar = jsonConvert.convert<String>(json['avatar']);
	if (avatar != null) {
		autoLoginJsonEntity.avatar = avatar;
	}
	final int? level = jsonConvert.convert<int>(json['level']);
	if (level != null) {
		autoLoginJsonEntity.level = level;
	}
	final String? signature = jsonConvert.convert<String>(json['signature']);
	if (signature != null) {
		autoLoginJsonEntity.signature = signature;
	}
	final String? nickname = jsonConvert.convert<String>(json['nickname']);
	if (nickname != null) {
		autoLoginJsonEntity.nickname = nickname;
	}
	final int? follows = jsonConvert.convert<int>(json['follows']);
	if (follows != null) {
		autoLoginJsonEntity.follows = follows;
	}
	final int? fans = jsonConvert.convert<int>(json['fans']);
	if (fans != null) {
		autoLoginJsonEntity.fans = fans;
	}
	final int? birthday = jsonConvert.convert<int>(json['birthday']);
	if (birthday != null) {
		autoLoginJsonEntity.birthday = birthday;
	}
	final int? userType = jsonConvert.convert<int>(json['userType']);
	if (userType != null) {
		autoLoginJsonEntity.userType = userType;
	}
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		autoLoginJsonEntity.token = token;
	}
	final String? imBigGroupId = jsonConvert.convert<String>(json['imBigGroupId']);
	if (imBigGroupId != null) {
		autoLoginJsonEntity.imBigGroupId = imBigGroupId;
	}
	final String? mobile = jsonConvert.convert<String>(json['mobile']);
	if (mobile != null) {
		autoLoginJsonEntity.mobile = mobile;
	}
	final int? isBeautyUserCode = jsonConvert.convert<int>(json['isBeautyUserCode']);
	if (isBeautyUserCode != null) {
		autoLoginJsonEntity.isBeautyUserCode = isBeautyUserCode;
	}
	final int? isUpstart = jsonConvert.convert<int>(json['isUpstart']);
	if (isUpstart != null) {
		autoLoginJsonEntity.isUpstart = isUpstart;
	}
	final int? isRegister = jsonConvert.convert<int>(json['isRegister']);
	if (isRegister != null) {
		autoLoginJsonEntity.isRegister = isRegister;
	}
	final int? pearl = jsonConvert.convert<int>(json['pearl']);
	if (pearl != null) {
		autoLoginJsonEntity.pearl = pearl;
	}
	final int? coin = jsonConvert.convert<int>(json['coin']);
	if (coin != null) {
		autoLoginJsonEntity.coin = coin;
	}
	final int? isLeader = jsonConvert.convert<int>(json['isLeader']);
	if (isLeader != null) {
		autoLoginJsonEntity.isLeader = isLeader;
	}
	final bool? dailySign = jsonConvert.convert<bool>(json['dailySign']);
	if (dailySign != null) {
		autoLoginJsonEntity.dailySign = dailySign;
	}
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		autoLoginJsonEntity.userId = userId;
	}
	final bool? forbidWords = jsonConvert.convert<bool>(json['forbidWords']);
	if (forbidWords != null) {
		autoLoginJsonEntity.forbidWords = forbidWords;
	}
	final bool? dailyGift = jsonConvert.convert<bool>(json['dailyGift']);
	if (dailyGift != null) {
		autoLoginJsonEntity.dailyGift = dailyGift;
	}
	final String? imSign = jsonConvert.convert<String>(json['imSign']);
	if (imSign != null) {
		autoLoginJsonEntity.imSign = imSign;
	}
	final int? imUser = jsonConvert.convert<int>(json['imUser']);
	if (imUser != null) {
		autoLoginJsonEntity.imUser = imUser;
	}
	return autoLoginJsonEntity;
}

Map<String, dynamic> $AutoLoginJsonEntityToJson(AutoLoginJsonEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['userCode'] = entity.userCode;
	data['gender'] = entity.gender;
	data['avatar'] = entity.avatar;
	data['level'] = entity.level;
	data['signature'] = entity.signature;
	data['nickname'] = entity.nickname;
	data['follows'] = entity.follows;
	data['fans'] = entity.fans;
	data['birthday'] = entity.birthday;
	data['userType'] = entity.userType;
	data['token'] = entity.token;
	data['imBigGroupId'] = entity.imBigGroupId;
	data['mobile'] = entity.mobile;
	data['isBeautyUserCode'] = entity.isBeautyUserCode;
	data['isUpstart'] = entity.isUpstart;
	data['isRegister'] = entity.isRegister;
	data['pearl'] = entity.pearl;
	data['coin'] = entity.coin;
	data['isLeader'] = entity.isLeader;
	data['dailySign'] = entity.dailySign;
	data['userId'] = entity.userId;
	data['forbidWords'] = entity.forbidWords;
	data['dailyGift'] = entity.dailyGift;
	data['imSign'] = entity.imSign;
	data['imUser'] = entity.imUser;
	return data;
}