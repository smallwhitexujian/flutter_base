class AssetsUtils {
  AssetsUtils();

  ///获取assets图片资源的全路径
  ///[imageName] 图片名称不含后缀，e.g: logo
  ///[postfix] 图片后缀: .png
  static String loadAssetsImg(String imageName, {String postfix = '.png'}) {
    if (imageName.startsWith("images/")) {
      return imageName;
    } else {
      return 'images/$imageName$postfix';
    }
  }
}