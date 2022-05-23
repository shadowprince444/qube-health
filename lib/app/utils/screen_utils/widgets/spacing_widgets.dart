import 'package:flutter/material.dart';
import 'package:qubehealth/app/utils/screen_utils/size_config.dart';

class VSpace extends StatelessWidget {
  final double height;

  const VSpace(this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: (height).vdp());
  }
}

class HSpace extends StatelessWidget {
  final double width;

  const HSpace(this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: (width).hdp());
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider(this.height, {Key? key, this.dividerColor}) : super(key: key);
  final double height;
  final Color? dividerColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: dividerColor ??
            Colors.black.withOpacity(
              .3,
            ),
        child: SizedBox(
          height: (height).vdp(),
          width: double.infinity,
        ));
  }
}
