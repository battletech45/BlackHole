import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constant/assets.dart';
import '../../core/constant/colors.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.child,
    this.extendBody = true,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.backgroundImage = true,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = false,
  });

  final Widget? child;
  final PreferredSizeWidget? appBar;
  final bool extendBody;
  final bool resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool backgroundImage;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: DecoratedBox(
          decoration: backgroundImage
              ? const BoxDecoration(
                  image: DecorationImage(image: AssetImage(AppAsset.appBG), opacity: 0.5, repeat: ImageRepeat.repeat),
                )
              : const BoxDecoration(),
          child: child,
        ),
      ),
      appBar: appBar,
      extendBody: extendBody,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
