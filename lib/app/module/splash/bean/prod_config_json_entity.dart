import 'dart:convert';
import 'package:flutter_base/generated/json/base/json_field.dart';
import 'package:flutter_base/generated/json/prod_config_json_entity.g.dart';

@JsonSerializable()
class ProdConfigJsonEntity {

	late ProdConfigJsonBeautyConfig beautyConfig;
	late ProdConfigJsonEmojiConfig emojiConfig;
	late ProdConfigJsonEnvConfig envConfig;
	late ProdConfigJsonGiftConfig giftConfig;
	late ProdConfigJsonImConfig imConfig;
	late ProdConfigJsonRsConfig rsConfig;
	late ProdConfigJsonSocketConfig socketConfig;
	late int version;
  
  ProdConfigJsonEntity();

  factory ProdConfigJsonEntity.fromJson(Map<String, dynamic> json) => $ProdConfigJsonEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProdConfigJsonEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProdConfigJsonBeautyConfig {


  
  ProdConfigJsonBeautyConfig();

  factory ProdConfigJsonBeautyConfig.fromJson(Map<String, dynamic> json) => $ProdConfigJsonBeautyConfigFromJson(json);

  Map<String, dynamic> toJson() => $ProdConfigJsonBeautyConfigToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProdConfigJsonEmojiConfig {

	late int version;
  
  ProdConfigJsonEmojiConfig();

  factory ProdConfigJsonEmojiConfig.fromJson(Map<String, dynamic> json) => $ProdConfigJsonEmojiConfigFromJson(json);

  Map<String, dynamic> toJson() => $ProdConfigJsonEmojiConfigToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProdConfigJsonEnvConfig {

	late String apiUrl;
	late String h5Url;
  
  ProdConfigJsonEnvConfig();

  factory ProdConfigJsonEnvConfig.fromJson(Map<String, dynamic> json) => $ProdConfigJsonEnvConfigFromJson(json);

  Map<String, dynamic> toJson() => $ProdConfigJsonEnvConfigToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProdConfigJsonGiftConfig {

	late String giftSvgaZipUrl;
	late int version;
  
  ProdConfigJsonGiftConfig();

  factory ProdConfigJsonGiftConfig.fromJson(Map<String, dynamic> json) => $ProdConfigJsonGiftConfigFromJson(json);

  Map<String, dynamic> toJson() => $ProdConfigJsonGiftConfigToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProdConfigJsonImConfig {

	late String bigGroupId;
	late int sdkappid;
  
  ProdConfigJsonImConfig();

  factory ProdConfigJsonImConfig.fromJson(Map<String, dynamic> json) => $ProdConfigJsonImConfigFromJson(json);

  Map<String, dynamic> toJson() => $ProdConfigJsonImConfigToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProdConfigJsonRsConfig {

	late ProdConfigJsonRsConfigIcons icons;
	late int version;
  
  ProdConfigJsonRsConfig();

  factory ProdConfigJsonRsConfig.fromJson(Map<String, dynamic> json) => $ProdConfigJsonRsConfigFromJson(json);

  Map<String, dynamic> toJson() => $ProdConfigJsonRsConfigToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProdConfigJsonRsConfigIcons {

	late String charmFirst;
	late String richSecond;
	late String richFirst;
	late String charmSecond;
	late String charmThird;
	late String richThird;
	late String msgBean;
  
  ProdConfigJsonRsConfigIcons();

  factory ProdConfigJsonRsConfigIcons.fromJson(Map<String, dynamic> json) => $ProdConfigJsonRsConfigIconsFromJson(json);

  Map<String, dynamic> toJson() => $ProdConfigJsonRsConfigIconsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProdConfigJsonSocketConfig {


  
  ProdConfigJsonSocketConfig();

  factory ProdConfigJsonSocketConfig.fromJson(Map<String, dynamic> json) => $ProdConfigJsonSocketConfigFromJson(json);

  Map<String, dynamic> toJson() => $ProdConfigJsonSocketConfigToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}