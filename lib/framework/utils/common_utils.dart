class CommonUtils {
  /// 集合是否是空的
  static bool isEmpt<T>(List<T>? datas) {
    return datas == null || datas.isEmpty;
  }
}
