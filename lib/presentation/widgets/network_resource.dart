import 'package:flutter/material.dart';
import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:savomart/presentation/widgets/error_with_retry.dart';
import 'package:savomart/presentation/widgets/loading_widget.dart';

class NetworkResource extends StatelessWidget {
  const NetworkResource(
      {Key? key,
      required this.retry,
      required this.appError,
      required this.child,
      required this.loading,
      this.bgColor = scaffoldBg})
      : super(key: key);

  final VoidCallback retry;
  final AppError? appError;
  final Widget? child;
  final bool loading;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: AnimatedSwitcher(
          switchInCurve: Curves.ease,
          switchOutCurve: Curves.ease,
          duration: defaultAnimationDuration,
          child: loading
              ? const LoadingWidgetBounce()
              : appError != null
                  ? ErrorWithRetry(
                      appError: appError!,
                      retry: retry,
                    )
                  : child!),
    );
  }
}
