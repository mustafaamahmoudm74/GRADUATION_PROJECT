import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumericalRangeFormatter extends TextInputFormatter {
  final double min;
  final double max;

  NumericalRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') {
      return newValue;
    } else if ((double.tryParse(newValue.text) ?? 0) < min) {
      return const TextEditingValue().copyWith(text: min.toStringAsFixed(2));
    } else {
      return (double.tryParse(newValue.text) ?? 0) > max ? oldValue : newValue;
    }
  }
}

class CustomTextFieldWidget extends StatefulWidget {
  static int get _companyDecimalNumber => 3;

  static List<TextInputFormatter> get integerNumberFormatter =>
      [FilteringTextInputFormatter.digitsOnly];

  static List<TextInputFormatter> get decimalNumberFormatter => [
        FilteringTextInputFormatter.allow(
            RegExp('^\\d+\\.?\\d{0,$_companyDecimalNumber}'))
      ];

  final TextEditingController? controller;
  final bool obscure;
  final bool? readOnly;
  final bool enableInteractiveSelection;
  final String? hint;
  final String? label;
  final Color? backGroundColor, focusedBorderColor;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final int? maxLine, minLines;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool? isDense;
  final Color? borderColor;
  final bool disableBorder;
  final FocusNode? focusNode;
  final double? borderRadiusValue, width, height;
  final void Function(String?)? onSave;
  final Widget? prefixIcon, suffixIcon;
  final void Function(String)? onChange;
  final Function()? onSuffixTap, onTap;
  final List<TextInputFormatter>? formatter;
  final TextInputAction? textInputAction;
  final bool? expands;
  final bool enable,
      isClickable,
      autoFocus,
      cancelDisableBackground,
      disableLabel;
  final TextDirection? textDirection;
  final TextAlign? textAlign;

  const CustomTextFieldWidget({
    super.key,
    this.isDense,
    this.enableInteractiveSelection = true,
    this.style,
    this.onChange,
    this.label,
    this.validator,
    this.maxLine,
    this.hint,
    this.backGroundColor,
    this.controller,
    this.obscure = false,
    this.enable = true,
    this.textDirection,
    this.readOnly = false,
    this.disableLabel = false,
    this.textInputType = TextInputType.text,
    this.borderColor,
    this.borderRadiusValue,
    this.prefixIcon,
    this.width,
    this.hintStyle,
    this.suffixIcon,
    this.onSuffixTap,
    this.onTap,
    this.height,
    this.formatter,
    this.focusNode,
    this.focusedBorderColor,
    this.onSave,
    this.minLines,
    this.disableBorder = false,
    this.textInputAction,
    this.expands,
    this.isClickable = false,
    this.autoFocus = false,
    this.cancelDisableBackground = false,
    this.textAlign = TextAlign.start,
  });

  @override
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscure;
  }

  InputBorder? getBorder(BuildContext context, {double? radius, Color? color}) {
    if (widget.disableBorder) return null;
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 16),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }

  void _toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 328,
      height: widget.height ?? 48,
      child: TextFormField(
        onTap: widget.onTap,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        textDirection: widget.textDirection,
        textAlign: widget.textAlign ?? TextAlign.start,
        autofocus: widget.autoFocus,
        mouseCursor: widget.isClickable ? SystemMouseCursors.click : null,
        textInputAction: widget.textInputAction ??
            (widget.onSave != null ? null : TextInputAction.next),
        onFieldSubmitted: widget.onSave,
        focusNode: widget.focusNode,
        readOnly: widget.readOnly ?? false,
        textAlignVertical: TextAlignVertical.center,
        validator: widget.validator,
        enabled: widget.enable,
        inputFormatters: widget.formatter,
        obscureText: _isObscured,
        controller: widget.controller,
        expands: widget.expands ?? false,
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0, fontSize: 0),
          labelText: widget.disableLabel ? null : widget.label ?? widget.hint,
          labelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
          enabledBorder: getBorder(context,
              radius: widget.borderRadiusValue, color: widget.borderColor),
          disabledBorder: getBorder(context,
              radius: widget.borderRadiusValue, color: widget.borderColor),
          focusedBorder: getBorder(context,
              radius: widget.borderRadiusValue, color: Colors.black12),
          border: getBorder(context,
              radius: widget.borderRadiusValue, color: Colors.black12),
          isDense: widget.isDense ?? false,
          prefixIconConstraints: BoxConstraints(
            minWidth: widget.prefixIcon == null ? 0 : 35,
            minHeight: 48,
            maxHeight: 48,
          ),
          suffixIconConstraints: BoxConstraints(
            minWidth: widget.suffixIcon == null ? 0 : 45,
            minHeight: 48,
            maxHeight: 48,
          ),
          constraints: BoxConstraints(
            minHeight: widget.height ?? 48,
            maxHeight: widget.height ?? 48,
            minWidth: widget.width ?? 320,
            maxWidth: widget.width ?? 320,
          ),
          hintText: (widget.label == null && !widget.disableLabel)
              ? null
              : widget.hint,
          prefixIcon: widget.prefixIcon ??
              SizedBox(width: widget.borderRadiusValue ?? 24),
          suffixIcon: widget.suffixIcon == null
              ? SizedBox(width: widget.borderRadiusValue ?? 24)
              : SizedBox(
                  width: 30,
                  child: InkWell(
                    onTap: widget.onSuffixTap ?? _toggleObscureText,
                    borderRadius: BorderRadius.circular(widget.height ?? 48),
                    hoverColor: Colors.transparent,
                    child: widget.suffixIcon,
                  ),
                ),
          hintStyle: widget.hintStyle,
        ),
        onChanged: widget.onChange,
        textCapitalization: TextCapitalization.words,
        maxLines: widget.maxLine ?? 1,
        minLines: widget.minLines ?? 1,
        keyboardType: widget.textInputType,
        style: widget.style?.copyWith(height: 1),
      ),
    );
  }
}
