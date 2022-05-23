import 'package:flutter/material.dart';
import 'package:qubehealth/app/utils/screen_utils/size_config.dart';

class FeelingIconWidget extends StatelessWidget {
  const FeelingIconWidget({
    Key? key,
    required this.iconUrl,
    required this.radius,
  }) : super(key: key);
  final double radius;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: radius.vdp(),
      width: radius.vdp(),
      child: Image.asset(
        iconUrl,
        fit: BoxFit.contain,
      ),
    );
  }
}
