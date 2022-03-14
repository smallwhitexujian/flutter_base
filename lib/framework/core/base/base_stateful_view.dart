import 'package:flutter/material.dart';
import 'package:flutter_base/framework/core/ui_state/load_empty_view.dart';
import 'package:flutter_base/framework/core/ui_state/load_error_view.dart';
import 'package:flutter_base/framework/core/ui_state/load_state_parent_view.dart';
import 'package:flutter_base/framework/core/ui_state/loading_view.dart';
import 'package:flutter_base/framework/lib_base.dart';

///base 带状态的基类,基类必须要继承viewmodel,通过viewmode可以修改状态，
///或者控制viewmodel生命周期
///AutomaticKeepAliveClientMixin 保持之前状态防止重复处罚initstate
@immutable
abstract class BaseStatefulView<T extends BaseViewModel> extends StatefulWidget
    implements IView {
  late T _viewModel;

  ///加载中页面
  Widget? _loadingChild;

  ///数据为空的页面
  Widget? _emptyChild;

  ///请求失败显示的页面
  Widget? _errorChild;

  /// 创建ViewModel
  T createViewModel();

  /// 注册其它的provider 默认没有其它provider
  List<ChangeNotifierProvider>? registProviders() {
    return null;
  }

  BaseStatefulView({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _BaseStatefulViewState<T> createState() {
    _viewModel = createViewModel();
    return _BaseStatefulViewState<T>(_viewModel, registProviders(), this);
  }
}

class _BaseStatefulViewState<T extends BaseViewModel>
    extends State<BaseStatefulView> with AutomaticKeepAliveClientMixin {
  /// 布局构造状态
  IView? _iView;

  /// 对应viewModel
  T _viewModel;

  /// 其它provider
  List<ChangeNotifierProvider>? _providers;

  _BaseStatefulViewState(this._viewModel, this._providers, this._iView);
  @override
  void initState() {
    _iView?.initState(context);
    super.initState();
  }

  @override
  void dispose() {
    _iView?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget contentView = _iView!.buildView(context);
    return MultiProvider(
        providers: registProviders(),
        child: Stack(
          children: createPageView(contentView),
        ));
  }

  /// 构造页面内容
  List<Widget> createPageView(Widget contentView) {
    List<Widget> widgets = [];
    widgets.add(contentView);
    bool canLoading = _iView == null ? false : _iView!.canLoading();
    if (canLoading) {
      // 加载中页面
      Widget loadingView = createStateView(_getLoadingWidget());
      if (loadingView != null) {
        widgets.add(loadingView);
      }
      // 错误页面
      Widget errorView = createStateView(_getErrorWidget(_viewModel));
      if (errorView != null) {
        widgets.add(errorView);
      }
    }
    return widgets;
  }

  Widget createStateView(Widget stateView) {
    // 加载布局
    Widget sate = Consumer(
        builder: (context, T viewModel, _) => Visibility(
              child: stateView,
              visible: viewModel.isOnComplete(),
            ));
    return sate;
  }

  ///是否保持原有的切换状态,一般是指tab切换之后不再处罚initstate
  @override
  bool get wantKeepAlive => true;

  /// 注册其它的provider 默认没有其它provider
  List<ChangeNotifierProvider> registProviders() {
    List<ChangeNotifierProvider> providers = [];
    var baseProvider = ChangeNotifierProvider(
      create: (context) => _viewModel,
    );
    providers.add(baseProvider);
    if (!CommonUtils.isEmpt<ChangeNotifierProvider>(_providers)) {
      providers.addAll(_providers!);
    }
    return providers;
  }

  ///加载错误页面
  Widget _getErrorWidget(T viewModel) {
    return LoadStateParentView(
      (widget._errorChild ??
          BaseLibPlugin.resConfig?.configLoadErrorView() ??
          const LoadErrorView(null)),
      _onRefresh(viewModel),
    );
  }

  ///加载空页面
  Widget _getEmptyWidget(T viewModel) {
    return LoadStateParentView(
      (widget._emptyChild ??
          BaseLibPlugin.resConfig?.configLoadEmptyWidget() ??
          const LoadEmptyView(null)),
      _onRefresh(viewModel),
    );
  }

  ///加载中...页面 加载中所以不用处理其他事件
  Widget _getLoadingWidget() {
    return LoadStateParentView(
      (widget._loadingChild ??
          BaseLibPlugin.resConfig?.configLoadingWidget() ??
          const LoadingView(null)),
      null,
    );
  }

  ///通知viewModle刷新
  VoidCallback _onRefresh(T viewModel) {
    return () {
      viewModel.notifyListeners();
    };
  }
}

abstract class IView {
  /// 布局初始化之前调用
  @protected
  void initState(BuildContext context);

  /// 创建布局
  @protected
  Widget buildView(BuildContext context);

  void dispose();

  /// 是否需要loading
  bool canLoading();
}

/// 页面状态
enum PageState {
  // 加载中
  loading,
  // 显示内容
  content,
  // 错误页
  error
}
