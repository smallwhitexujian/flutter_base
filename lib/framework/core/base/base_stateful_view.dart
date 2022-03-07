import 'package:flutter/material.dart';
import 'package:flutter_base/framework/core/base/base_view.dart';
import 'package:flutter_base/framework/viewModel/final_base_view_model.dart';

///base 带状态的基类,基类必须要继承viewmodel,通过viewmode可以修改状态，
///或者控制viewmodel生命周期
///AutomaticKeepAliveClientMixin 保持之前状态防止重复处罚initstate
abstract class BaseStatefulView<T extends FinalBaseViewModel>
    extends StatefulWidget {
  ///加载成功后显示的页面
  final Widget child;

  ///加载中页面
  final Widget? loadingChild;

  ///数据为空的页面
  final Widget? emptyChild;

  ///请求失败显示的页面
  final Widget? errorChild;
  const BaseStatefulView(
      {Key? key,
      required this.child,
      this.loadingChild,
      this.emptyChild,
      this.errorChild})
      : super(key: key);

  @override
  _BaseStatefulViewState<T> createState() => _BaseStatefulViewState<T>();
}

class _BaseStatefulViewState<T extends FinalBaseViewModel>
    extends State<BaseStatefulView> with AutomaticKeepAliveClientMixin {
  late BaseView _baseView;
  @override
  void initState() {
    super.initState();
    _baseView = BaseView(
        child: widget.child,
        loadingChild: widget.loadingChild,
        emptyChild: widget.emptyChild,
        errorChild: widget.errorChild);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _baseView;
  }

  ///是否保持原有的切换状态,一般是指tab切换之后不再处罚initstate
  @override
  bool get wantKeepAlive => true;
}
