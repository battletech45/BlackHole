import 'package:black_hole/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/constant/colors.dart';
import '../../core/service/device_service.dart';
import '../../core/service/provider/auth.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onTap;
  final Animation<double>? progress;
  final bool isDrawer;
  final List<Widget> actions;
  const AppAppBar({
    super.key,
    this.onTap,
    this.progress,
    required this.isDrawer,
    this.actions = const <Widget>[],
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: isDrawer
          ? IconButton(
            color: AppColor.white,
            onPressed: onTap,
            tooltip: 'Menü',
              icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: progress!,
              ),
      )
          : null,
      actions: isDrawer
          ? [
        IconButton(
          color: AppColor.white,
          onPressed: () {
            if(context.read<AutherProvider>().isAuth) {
              context.push('/memberCart');
            }
            else {
              context.push('/guestCart');
            }
          },
          icon: const Icon(Icons.coffee),
          tooltip: 'Sepet',
        ),
      ]
          : actions,
    );
  }
}