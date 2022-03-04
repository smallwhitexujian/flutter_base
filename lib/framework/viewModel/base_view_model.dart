import 'package:flutter_base/framework/viewModel/final_base_view_model.dart';

///baseViewmodel
abstract class BaseViewModel<T> extends FinalBaseViewModel {
  BaseViewModel();

  ///获取http请求参数
  Map<String, dynamic> getRequestParams();

  ///获取http请求url
  String getUrl();
}
