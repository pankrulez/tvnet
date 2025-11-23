import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef AdaptiveVoidCallback = void Function();

class AdaptiveButton extends StatelessWidget {
  final Widget child;
  final AdaptiveVoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  const AdaptiveButton({Key? key, required this.child, this.onPressed, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    if (platform == TargetPlatform.iOS) {
      return CupertinoButton(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        color: CupertinoColors.activeBlue,
        onPressed: onPressed,
        child: child,
      );
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(padding: padding),
      onPressed: onPressed,
      child: child,
    );
  }
}

Future<T?> showAdaptiveDialog<T>({
  required BuildContext context,
  required Widget title,
  required Widget content,
  List<Widget>? actions,
}) {
  final platform = Theme.of(context).platform;
  if (platform == TargetPlatform.iOS) {
    return showCupertinoDialog<T>(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: title,
        content: content,
        actions: actions ?? <Widget>[],
      ),
    );
  }

  return showDialog<T>(
    context: context,
    builder: (_) => AlertDialog(
      title: title,
      content: content,
      actions: actions ?? <Widget>[],
    ),
  );
}
