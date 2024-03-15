import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoIconButton extends StatelessWidget {
  const LogoIconButton({
    required this.onPressed,
    required this.logo,
    super.key,
  });

  final VoidCallback onPressed;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        logo,
        height: 24,
        width: 24,
      ),
    );
  }
}
