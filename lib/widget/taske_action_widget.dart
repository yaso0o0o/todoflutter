

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaskActionButton extends StatelessWidget {
  final String iconPath ;
  final void Function() onPressed ;
  const TaskActionButton({super.key, required this.iconPath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        iconPath,
        height: 21,
        width: 21,
        color: Color(0xffe53170),
      ),
    );
  }
}

