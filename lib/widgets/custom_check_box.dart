import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomCheckBoxWidget extends StatefulWidget {
  final bool isChecked, disabled, cancelFocusChangeOnMark, startWithTitle;
  final String? title;
  final FocusNode? focusNode, nextFocusNode;
  final void Function(bool?)? onChange;

  const CustomCheckBoxWidget({
    super.key,
    this.onChange,
    this.title,
    this.focusNode,
    this.nextFocusNode,
    this.disabled = false,
    this.cancelFocusChangeOnMark = false,
    this.startWithTitle = true,
    required this.isChecked,
  });

  @override
  State<CustomCheckBoxWidget> createState() => _CustomCheckBoxWidgetState();
}

class _CustomCheckBoxWidgetState extends State<CustomCheckBoxWidget> {
  late bool checked = false;

  @override
  void initState() {
    super.initState();
    checked = widget.isChecked;
  }

  @override
  void didUpdateWidget(covariant CustomCheckBoxWidget oldWidget) {
    checked = widget.isChecked;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// If The Widget Starts With Title Build Title And Space
        if (widget.title != null && widget.startWithTitle)
          Text(
            widget.title!,
            style: const TextStyle(fontSize: 16)
                .copyWith(color: widget.disabled ? Colors.grey : null),
          ),
        if (widget.title != null && widget.startWithTitle)
          Transform.scale(
            scale: 1.1,
            child: Focus(
              canRequestFocus: false,
              onKeyEvent: (node, event) {
                if (event is KeyDownEvent) {
                  if (event.logicalKey == LogicalKeyboardKey.enter) {
                    FocusScope.of(context).requestFocus(widget.nextFocusNode);
                  }
                  return KeyEventResult.ignored;
                }
                return KeyEventResult.handled;
              },
              child: Checkbox(
                activeColor: Colors.blue,
                focusNode: widget.focusNode,
                side: const BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.grey,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                value: checked,
                onChanged: widget.disabled
                    ? (_) {}
                    : (bool? value) {
                        if (widget.onChange != null) widget.onChange!(value);
                        if (widget.nextFocusNode != null &&
                            !widget.cancelFocusChangeOnMark) {
                          FocusScope.of(context)
                              .requestFocus(widget.nextFocusNode);
                        }
                        setState(
                          () {
                            checked = value ?? false;
                          },
                        );
                      },
              ),
            ),
          ),

        /// If The Widget Starts With Check Box Build Title And Space
        if (widget.title != null && !widget.startWithTitle)
          const SizedBox(width: 14),
        if (widget.title != null && !widget.startWithTitle)
          Text(
            widget.title!,
            style: const TextStyle(fontSize: 16)
                .copyWith(color: widget.disabled ? Colors.grey : null),
          ),
      ],
    );
  }
}
