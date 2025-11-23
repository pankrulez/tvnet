import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// AdaptiveAppBar returns a PreferredSizeWidget that shows a Cupertino-styled
// navigation bar on iOS and a Material AppBar on other platforms. This keeps
// the rest of the UI (drawers, bottom nav) intact while providing an iOS
// visual for the top bar.
class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? backgroundColor;
  final double elevation;
  final PreferredSizeWidget? bottom;

  const AdaptiveAppBar({
    Key? key,
    this.title,
    this.actions,
    this.centerTitle = false,
    this.backgroundColor,
    this.elevation = 4.0,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    if (platform == TargetPlatform.iOS) {
      // Compose a Column: CupertinoNavigationBar + optional bottom widget
      final navBar = CupertinoNavigationBar(
        middle: title,
        trailing: actions != null
            ? Row(mainAxisSize: MainAxisSize.min, children: actions!)
            : null,
        backgroundColor: backgroundColor ?? CupertinoColors.systemBackground,
      );

      if (bottom != null) {
        return Material(
          color: Colors.transparent,
          child: SafeArea(
            bottom: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: kToolbarHeight, child: navBar),
                bottom!,
              ],
            ),
          ),
        );
      }

      return Material(
        color: Colors.transparent,
        child: SafeArea(
          bottom: false,
          child: SizedBox(height: kToolbarHeight, child: navBar),
        ),
      );
    }

    return AppBar(
      title: title,
      actions: actions,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      elevation: elevation,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
