import 'package:flutter/cupertino.dart';
import 'package:flutter_base/framework/base_lib_plugin.dart';
import 'package:flutter_base/framework/lib_base.dart';
import 'package:flutter_base/framework/viewModel/base_view_model.dart';

import '../ui_state/load_empty_view.dart';
import '../ui_state/load_error_view.dart';
import '../ui_state/load_state_parent_view.dart';
import '../ui_state/loading_view.dart';

class BaseView<T extends BaseViewModel> extends StatelessWidget {
  ///加载成功后显示的页面
  final Widget child;

  ///加载中页面
  final Widget? loadingChild;

  ///数据为空的页面
  final Widget? emptyChild;

  ///请求失败显示的页面
  final Widget? errorChild;

  ///声明状态和状态消费者
  ///import 'package:consumer/consumer.dart';
  ///class ExampleState {
  ///  int counter = 0;
  ///  String time = DateTime.now().toString();
  ///}
  ///
  ///var consumer = Consumer(ExampleState());
  ///关于Consumer使用参考 https://github.com/ymzuiku/flutter_consumer/blob/master/README-CN.md
  // Consumer<T>? consumer;

  ///memo 的概念是来自于 react.Hooks, 它用来描述监听变化的对象，仅有监听对象变化时，才会派发更新。
  ///一个原则是，我们在 builder 对象中需要使用什么属性，memo 返回的数组就定义什么属性, 我们这里有一些例子：
  ///如果我们由 consumer.build 创建的两个 widget：
  /// *** definition a state ***
  /// class ExampleState {
  ///   List<String> animates = [];
  ///   int age = 0;
  ///   String name = 'dog';
  /// }
  ///
  /// *** create a consumer ***
  /// var consumer = Consumer(ExampleState());
  ///
  /// Column(
  ///   children: <Widget>[
  ///     consumer.build((ctx, state) {
  ///          print('Update when state.age change');
  ///          return Text(
  ///            '$state.age',
  ///           style: Theme.of(context).textTheme.display1,
  ///         );
  ///       },
  ///       memo: (state) => [state.age, state.animates],
  ///     ),
  ///     consumer.build((ctx, state) {
  ///         print('Update when state.name change');
  ///         return Text(
  ///           state.name,
  ///           style: Theme.of(context).textTheme.display1,
  ///         );
  ///       },
  ///       memo: (state) => [state.name],
  ///     ),
  ///   ],
  /// );
  // List<dynamic> Function(dynamic)? memo;

  const BaseView({
    Key? key,
    required this.child,
    this.loadingChild,
    this.emptyChild,
    this.errorChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
        child: child,
        builder: (BuildContext context, T viewModel, Widget? child) {
          if (viewModel.isSuccess()) {
            return child!;
          } else {
            return FutureBuilder(
              future: viewModel.doNewwrok(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (viewModel.isFail()) {
                    ///加载失败
                    return _getErrorWidget(viewModel);
                  } else if (viewModel.isEmpty()) {
                    ///数据为空
                    return _getEmptyWidget(viewModel);
                  } else {
                    ///加载成功
                    return child!;
                  }
                } else {
                  ///加载中
                  return _getLoadingWidget();
                }
              },
            );
          }
        });
  }

  ///加载错误页面
  Widget _getErrorWidget(T viewModel) {
    return LoadStateParentView(
      (errorChild ??
          BaseLibPlugin.resConfig?.configLoadErrorView() ??
          const LoadErrorView(null)),
      _onRefresh(viewModel),
    );
  }

  ///加载空页面
  Widget _getEmptyWidget(T viewModel) {
    return LoadStateParentView(
      (emptyChild ??
          BaseLibPlugin.resConfig?.configLoadEmptyWidget() ??
          const LoadEmptyView(null)),
      _onRefresh(viewModel),
    );
  }

  ///加载中...页面 加载中所以不用处理其他事件
  Widget _getLoadingWidget() {
    return LoadStateParentView(
      (loadingChild ??
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
