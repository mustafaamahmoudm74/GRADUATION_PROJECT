import 'package:flutter/material.dart';

import 'dialogs.dart';

class DialogWidget extends StatelessWidget {
  final String? title;
  final String? msg;
  final double? dialogWidth;
  final List<Widget>? actions;
  final Widget customView;
  final CustomViewPosition customViewPosition;
  final TextStyle titleStyle;
  final TextStyle? msgStyle;
  final TextAlign? titleAlign;
  final TextAlign? msgAlign;
  final Color color;

  const DialogWidget({
    super.key,
    this.title,
    this.msg,
    this.dialogWidth,
    this.actions,
    required this.customView,
    required this.customViewPosition,
    required this.titleStyle,
    this.msgStyle,
    this.titleAlign,
    this.msgAlign,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(88),
      width: 296,
      height: 196,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (customViewPosition == CustomViewPosition.BEFORE_TITLE)
              customView,
            if (title != null)
              Text(
                title!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: titleAlign,
              ),
            if (customViewPosition == CustomViewPosition.AFTER_TITLE)
              customView,
            if (msg != null)
              Text(
                msg!,
                style: msgStyle,
                textAlign: msgAlign,
              ),
            if (customViewPosition == CustomViewPosition.BEFORE_MESSAGE)
              customView,
            if (actions != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions!,
              ),
          ],
        ),
      ),
    );
  }
}
