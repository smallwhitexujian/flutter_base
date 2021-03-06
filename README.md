# i18n 国际化使用规则

## 初始化

```dart
 return new MaterialApp(
        locale: Locale(_locale, ""),//手动设置选择本地语言
        localizationsDelegates: [
            I18n.delegate,//初始化delegate
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: I18n.delegate.supportedLocales,//初始化本地支持的语言
        localeResolutionCallback:I18n.delegate.resolution(fallback: new Locale('zh', '')),//默认语言
  }
```

## I18n命令操作介绍

```md
1. vs code 打开命令 快捷键 shift+ctrl+p
2. Flutter I18n Json: Initialize //初始化当前i18n文件,只需要首次初始化即可不用重复初始化 一路回车下去即可
    生成文件如下：
    i18n/xx-xx.json,            // 地区语言配置文件key-value
    lib/generated/i18n.dart，   // 自动生成文件每次执行此文件会重新生成,
    i18nconfig.json             // 默认配置文件,一般不会做修改
3. Flutter I18n Json:Update     // 更新,每次有添加文本必须要执行改命令
4. Flutter I18n Json: Remove locale // 移除,直接移除某个地区语言命令
```

## xx-xx.json文件使用介绍

我们来看几个示例,

```json
{
    "hello": "hello!",                  //默认格式无参
    "greeting": {                       //模块名称
        "formal": "Hello",              //无参构造1
        "informal": "Hi",               //无参构造2
        "placeholder": {                //模块下的模块可以支持多层嵌套使用，但是建议避免否者方法参数无敌长
            "formal": "Hello {name}",   //有参构造1
            "informal": "Hi {name}"     //有参构造1
        }
    },
     "greetings": [                     //数组构造参
        "Hello",
        "Hi"
    ]
}

```

上面的语言json文件最终会生成为以下构造方法，无参则直接返回String对象,有参则用{}选中替换参数.

```dart
/// "hello!"
String get hello => "hello!";
/// "Hello"
String get greetingFormal => "Hello";
/// "Hi"
String get greetingInformal => "Hi";
/// "Hello ${name}"
String greetingPlaceholderFormal(String name) => "Hello ${name}";
/// "Hi ${name}"
String greetingPlaceholderInformal(String name) => "Hi ${name}";
/// ["Hello", "Hi"] 获取数组 
List<String> get greetings => ["Hello", "Hi"];
```

那么问题来了这些方法在哪里呢.最终都会在lib/generated/i18n.dart i18n文件中生成,每次updata之后就会自动生成出来

```dart
class _I18n_xx_XX extends I18n {
  const _I18n_xx_XX();

  @override
  String get hello => "¡Hola!";
  @override
  String greetTo(String name) => "Encantado de conocerte, ${name}!";
}
```

## 最后的坑 lib/generated/i18n.dart

`i18n.dart` 这个文件每次updata就会自动生成,重新替换掉原先的方法;但是这个文件首次生成的时候会因为dart语言升级的关系插件库还没有同步升级所以需要手动修改一下,否则项目会报错.需要修改代码我已经贴在这里用于对照

```dart
  static Locale? _locale;

   static LocaleChangeCallback? onLocaleChanged;

   static I18n of(BuildContext context) =>
      Localizations.of<I18n>(context, WidgetsLocalizations)!;

      LocaleResolutionCallback resolution({Locale? fallback}) {
    return (Locale? locale, Iterable<Locale> supported) {
      if (isSupported(locale)) {
        return locale;
      }
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    };
  }


    @override
  Future<WidgetsLocalizations> load(Locale locale) {
    I18n._locale ??= locale;
    I18n._shouldReload = false;
    final String lang = I18n._locale != null ? I18n._locale.toString() : "";
    final String languageCode =
        I18n._locale != null ? I18n._locale!.languageCode : "";


 @override
  bool isSupported(Locale? locale) {
    for (var i = 0; i < supportedLocales.length && locale != null; i++) {
      final l = supportedLocales[i];
      if (l.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
```
