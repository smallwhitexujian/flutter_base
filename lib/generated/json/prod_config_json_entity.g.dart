import 'package:flutter_base/generated/json/base/json_convert_content.dart';
import 'package:flutter_base/app/module/splash/bean/prod_config_json_entity.dart';

ProdConfigJsonEntity $ProdConfigJsonEntityFromJson(Map<String, dynamic> json) {
	final ProdConfigJsonEntity prodConfigJsonEntity = ProdConfigJsonEntity();
	final ProdConfigJsonBeautyConfig? beautyConfig = jsonConvert.convert<ProdConfigJsonBeautyConfig>(json['beautyConfig']);
	if (beautyConfig != null) {
		prodConfigJsonEntity.beautyConfig = beautyConfig;
	}
	final ProdConfigJsonEmojiConfig? emojiConfig = jsonConvert.convert<ProdConfigJsonEmojiConfig>(json['emojiConfig']);
	if (emojiConfig != null) {
		prodConfigJsonEntity.emojiConfig = emojiConfig;
	}
	final ProdConfigJsonEnvConfig? envConfig = jsonConvert.convert<ProdConfigJsonEnvConfig>(json['envConfig']);
	if (envConfig != null) {
		prodConfigJsonEntity.envConfig = envConfig;
	}
	final ProdConfigJsonGiftConfig? giftConfig = jsonConvert.convert<ProdConfigJsonGiftConfig>(json['giftConfig']);
	if (giftConfig != null) {
		prodConfigJsonEntity.giftConfig = giftConfig;
	}
	final ProdConfigJsonImConfig? imConfig = jsonConvert.convert<ProdConfigJsonImConfig>(json['imConfig']);
	if (imConfig != null) {
		prodConfigJsonEntity.imConfig = imConfig;
	}
	final ProdConfigJsonRsConfig? rsConfig = jsonConvert.convert<ProdConfigJsonRsConfig>(json['rsConfig']);
	if (rsConfig != null) {
		prodConfigJsonEntity.rsConfig = rsConfig;
	}
	final ProdConfigJsonSocketConfig? socketConfig = jsonConvert.convert<ProdConfigJsonSocketConfig>(json['socketConfig']);
	if (socketConfig != null) {
		prodConfigJsonEntity.socketConfig = socketConfig;
	}
	final int? version = jsonConvert.convert<int>(json['version']);
	if (version != null) {
		prodConfigJsonEntity.version = version;
	}
	return prodConfigJsonEntity;
}

Map<String, dynamic> $ProdConfigJsonEntityToJson(ProdConfigJsonEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['beautyConfig'] = entity.beautyConfig.toJson();
	data['emojiConfig'] = entity.emojiConfig.toJson();
	data['envConfig'] = entity.envConfig.toJson();
	data['giftConfig'] = entity.giftConfig.toJson();
	data['imConfig'] = entity.imConfig.toJson();
	data['rsConfig'] = entity.rsConfig.toJson();
	data['socketConfig'] = entity.socketConfig.toJson();
	data['version'] = entity.version;
	return data;
}

ProdConfigJsonBeautyConfig $ProdConfigJsonBeautyConfigFromJson(Map<String, dynamic> json) {
	final ProdConfigJsonBeautyConfig prodConfigJsonBeautyConfig = ProdConfigJsonBeautyConfig();
	return prodConfigJsonBeautyConfig;
}

Map<String, dynamic> $ProdConfigJsonBeautyConfigToJson(ProdConfigJsonBeautyConfig entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}

ProdConfigJsonEmojiConfig $ProdConfigJsonEmojiConfigFromJson(Map<String, dynamic> json) {
	final ProdConfigJsonEmojiConfig prodConfigJsonEmojiConfig = ProdConfigJsonEmojiConfig();
	final int? version = jsonConvert.convert<int>(json['version']);
	if (version != null) {
		prodConfigJsonEmojiConfig.version = version;
	}
	return prodConfigJsonEmojiConfig;
}

Map<String, dynamic> $ProdConfigJsonEmojiConfigToJson(ProdConfigJsonEmojiConfig entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['version'] = entity.version;
	return data;
}

ProdConfigJsonEnvConfig $ProdConfigJsonEnvConfigFromJson(Map<String, dynamic> json) {
	final ProdConfigJsonEnvConfig prodConfigJsonEnvConfig = ProdConfigJsonEnvConfig();
	final String? apiUrl = jsonConvert.convert<String>(json['apiUrl']);
	if (apiUrl != null) {
		prodConfigJsonEnvConfig.apiUrl = apiUrl;
	}
	final String? h5Url = jsonConvert.convert<String>(json['h5Url']);
	if (h5Url != null) {
		prodConfigJsonEnvConfig.h5Url = h5Url;
	}
	return prodConfigJsonEnvConfig;
}

Map<String, dynamic> $ProdConfigJsonEnvConfigToJson(ProdConfigJsonEnvConfig entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['apiUrl'] = entity.apiUrl;
	data['h5Url'] = entity.h5Url;
	return data;
}

ProdConfigJsonGiftConfig $ProdConfigJsonGiftConfigFromJson(Map<String, dynamic> json) {
	final ProdConfigJsonGiftConfig prodConfigJsonGiftConfig = ProdConfigJsonGiftConfig();
	final String? giftSvgaZipUrl = jsonConvert.convert<String>(json['giftSvgaZipUrl']);
	if (giftSvgaZipUrl != null) {
		prodConfigJsonGiftConfig.giftSvgaZipUrl = giftSvgaZipUrl;
	}
	final int? version = jsonConvert.convert<int>(json['version']);
	if (version != null) {
		prodConfigJsonGiftConfig.version = version;
	}
	return prodConfigJsonGiftConfig;
}

Map<String, dynamic> $ProdConfigJsonGiftConfigToJson(ProdConfigJsonGiftConfig entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['giftSvgaZipUrl'] = entity.giftSvgaZipUrl;
	data['version'] = entity.version;
	return data;
}

ProdConfigJsonImConfig $ProdConfigJsonImConfigFromJson(Map<String, dynamic> json) {
	final ProdConfigJsonImConfig prodConfigJsonImConfig = ProdConfigJsonImConfig();
	final String? bigGroupId = jsonConvert.convert<String>(json['bigGroupId']);
	if (bigGroupId != null) {
		prodConfigJsonImConfig.bigGroupId = bigGroupId;
	}
	final int? sdkappid = jsonConvert.convert<int>(json['sdkappid']);
	if (sdkappid != null) {
		prodConfigJsonImConfig.sdkappid = sdkappid;
	}
	return prodConfigJsonImConfig;
}

Map<String, dynamic> $ProdConfigJsonImConfigToJson(ProdConfigJsonImConfig entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['bigGroupId'] = entity.bigGroupId;
	data['sdkappid'] = entity.sdkappid;
	return data;
}

ProdConfigJsonRsConfig $ProdConfigJsonRsConfigFromJson(Map<String, dynamic> json) {
	final ProdConfigJsonRsConfig prodConfigJsonRsConfig = ProdConfigJsonRsConfig();
	final ProdConfigJsonRsConfigIcons? icons = jsonConvert.convert<ProdConfigJsonRsConfigIcons>(json['icons']);
	if (icons != null) {
		prodConfigJsonRsConfig.icons = icons;
	}
	final int? version = jsonConvert.convert<int>(json['version']);
	if (version != null) {
		prodConfigJsonRsConfig.version = version;
	}
	return prodConfigJsonRsConfig;
}

Map<String, dynamic> $ProdConfigJsonRsConfigToJson(ProdConfigJsonRsConfig entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['icons'] = entity.icons.toJson();
	data['version'] = entity.version;
	return data;
}

ProdConfigJsonRsConfigIcons $ProdConfigJsonRsConfigIconsFromJson(Map<String, dynamic> json) {
	final ProdConfigJsonRsConfigIcons prodConfigJsonRsConfigIcons = ProdConfigJsonRsConfigIcons();
	final String? charmFirst = jsonConvert.convert<String>(json['charmFirst']);
	if (charmFirst != null) {
		prodConfigJsonRsConfigIcons.charmFirst = charmFirst;
	}
	final String? richSecond = jsonConvert.convert<String>(json['richSecond']);
	if (richSecond != null) {
		prodConfigJsonRsConfigIcons.richSecond = richSecond;
	}
	final String? richFirst = jsonConvert.convert<String>(json['richFirst']);
	if (richFirst != null) {
		prodConfigJsonRsConfigIcons.richFirst = richFirst;
	}
	final String? charmSecond = jsonConvert.convert<String>(json['charmSecond']);
	if (charmSecond != null) {
		prodConfigJsonRsConfigIcons.charmSecond = charmSecond;
	}
	final String? charmThird = jsonConvert.convert<String>(json['charmThird']);
	if (charmThird != null) {
		prodConfigJsonRsConfigIcons.charmThird = charmThird;
	}
	final String? richThird = jsonConvert.convert<String>(json['richThird']);
	if (richThird != null) {
		prodConfigJsonRsConfigIcons.richThird = richThird;
	}
	final String? msgBean = jsonConvert.convert<String>(json['msgBean']);
	if (msgBean != null) {
		prodConfigJsonRsConfigIcons.msgBean = msgBean;
	}
	return prodConfigJsonRsConfigIcons;
}

Map<String, dynamic> $ProdConfigJsonRsConfigIconsToJson(ProdConfigJsonRsConfigIcons entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['charmFirst'] = entity.charmFirst;
	data['richSecond'] = entity.richSecond;
	data['richFirst'] = entity.richFirst;
	data['charmSecond'] = entity.charmSecond;
	data['charmThird'] = entity.charmThird;
	data['richThird'] = entity.richThird;
	data['msgBean'] = entity.msgBean;
	return data;
}

ProdConfigJsonSocketConfig $ProdConfigJsonSocketConfigFromJson(Map<String, dynamic> json) {
	final ProdConfigJsonSocketConfig prodConfigJsonSocketConfig = ProdConfigJsonSocketConfig();
	return prodConfigJsonSocketConfig;
}

Map<String, dynamic> $ProdConfigJsonSocketConfigToJson(ProdConfigJsonSocketConfig entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}