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

class CustomTextFieldWidget extends StatelessWidget {
  static int get _companyDecimalNumber => 3;

  static List<TextInputFormatter> get integerNumberFormatter => [FilteringTextInputFormatter.digitsOnly];

  static List<TextInputFormatter> get decimalNumberFormatter => [FilteringTextInputFormatter.allow(RegExp('^\\d+\\.?\\d{0,$_companyDecimalNumber}'))];

  final TextEditingController? controller;
  final bool? obscure;
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
  final bool enable, isClickable, autoFocus, cancelDisableBackground, disableLabel;
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

  InputBorder? getBorder(BuildContext context, {double? radius, Color? color}) {
    if (disableBorder) return null;
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 16),
      borderSide: BorderSide(
        color: color ??Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 328,
      height: height ?? 48,
      child: TextFormField(
        onTap: onTap,
        enableInteractiveSelection: enableInteractiveSelection,
        textDirection: textDirection,
        textAlign: textAlign ?? TextAlign.start,
        autofocus: autoFocus,
        mouseCursor: isClickable ? SystemMouseCursors.click : null,
        textInputAction: textInputAction ?? (onSave != null ? null : TextInputAction.next),
        onFieldSubmitted: onSave,
        focusNode: focusNode,
        readOnly: readOnly ?? false,
        textAlignVertical: TextAlignVertical.center,
        validator: validator,
        enabled: enable,
        inputFormatters: formatter,
        obscureText: obscure ?? false,
        controller: controller,
        expands: expands ?? false,
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0, fontSize: 0),
          labelText: disableLabel ? null : label ?? hint,
          labelStyle: const TextStyle(fontSize: 14,color: Colors.grey),
          enabledBorder: getBorder(context, radius: borderRadiusValue, color: borderColor),
          disabledBorder: getBorder(context, radius: borderRadiusValue, color: borderColor),
          focusedBorder: getBorder(context, radius: borderRadiusValue, color: Colors.black12),
          border: getBorder(context, radius: borderRadiusValue, color: Colors.black12),
          isDense: isDense ?? false,
          prefixIconConstraints: BoxConstraints(
            minWidth: prefixIcon == null ? 0 : 35,
            minHeight: 48,
            maxHeight: 48,
          ),
          suffixIconConstraints: BoxConstraints(
            minWidth: suffixIcon == null ? 0 : 45,
            minHeight: 48,
            maxHeight: 48,
          ),
          constraints: BoxConstraints(
            minHeight: height ?? 48,
            maxHeight: height ?? 48,
            minWidth: width ?? 320,
            maxWidth: width ?? 320,
          ),
          // fillColor: enable
          //     ? (backGroundColor ?? ThemeClass.of(context).background)
          //     : cancelDisableBackground
          //     ? (backGroundColor ?? ThemeClass.of(context).background)
          //     : ThemeClass.of(context).dark.withOpacity(0.3),
          filled: true,
          hintText: (label == null && !disableLabel) ? null : hint,
          prefixIcon: prefixIcon ?? SizedBox(width: borderRadiusValue ?? 24),
          suffixIcon: suffixIcon == null
              ? SizedBox(width: borderRadiusValue ?? 24)
              : SizedBox(
            width: 30,
            child: InkWell(
              onTap: onSuffixTap,
              borderRadius: BorderRadius.circular(height ?? 48),
              hoverColor: Colors.transparent,
              child: suffixIcon,
            ),
          ),
          hintStyle: hintStyle ,
        ),
        onChanged: onChange,
        textCapitalization: TextCapitalization.words,
        maxLines: maxLine ?? 1,
        minLines: minLines ?? 1,
        keyboardType: textInputType,
        style: style?.copyWith(height: 1) ,
      ),
    );
  }
}
