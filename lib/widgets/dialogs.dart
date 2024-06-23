import 'package:flutter/material.dart';

import 'DialogWidget.dart';

enum CustomViewPosition {
  BEFORE_TITLE,
  AFTER_TITLE,
  BEFORE_MESSAGE,
  AFTER_MESSAGE,
}

class Dialogs {
  ///[titleStyle] can be used to change the dialog title style
  static const TextStyle titleStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 14);

  ///[bcgColor] background default value
  static const Color bcgColor = Colors.white;

  ///[holder] holder for the custom view
  static const Widget holder = SizedBox(
    height: 34,
  );

  /// [dialogShape] dialog outer shape
  static const ShapeBorder dialogShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)));

  /// [BottomSheetShape] bottom dialog outer shape
  static const ShapeBorder BottomSheetShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)));

  static const CustomViewPosition customViewPosition =
      CustomViewPosition.BEFORE_TITLE;

  /// Displays normal Material dialog above the current contents of the app
  static Future<void> materialDialog({
    required BuildContext context,
    Function(dynamic value)? onClose,
    String? title,
    String? msg,
    @Deprecated('The actions is Deprecated, please use actionsBuilder')
    List<Widget>? actions,
    Function(BuildContext context)? actionsBuilder,
    Widget customView = holder,
    CustomViewPosition customViewPosition = CustomViewPosition.BEFORE_TITLE,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    ShapeBorder dialogShape = dialogShape,
    TextStyle titleStyle = titleStyle,
    TextStyle? msgStyle,
    TextAlign? titleAlign,
    TextAlign? msgAlign,
    Color color = bcgColor,
    double? dialogWidth,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      builder: (context) {
        return Dialog(
          backgroundColor: color,
          shape: dialogShape,
          child: DialogWidget(
            title: title,
            dialogWidth: dialogWidth,
            msg: msg,
            actions: actionsBuilder != null ? actionsBuilder(context) : actions,
            customView: customView,
            customViewPosition: customViewPosition,
            titleStyle: titleStyle,
            msgStyle: msgStyle,
            titleAlign: titleAlign,
            msgAlign: msgAlign,
            color: color,
          ),
        );
      },
    ).then((value) => onClose?.call(value));
  }

  static void bottomMaterialDialog({
    required BuildContext context,
    Function(dynamic value)? onClose,
    String? title,
    String? msg,
    @Deprecated('The actions is Deprecated, please use actionsBuilder')
    List<Widget>? actions,
    Function(BuildContext context)? actionsBuilder,
    Widget customView = holder,
    CustomViewPosition customViewPosition = CustomViewPosition.BEFORE_TITLE,
    bool barrierDismissible = true,
    ShapeBorder dialogShape = BottomSheetShape,
    TextStyle titleStyle = titleStyle,
    TextStyle? msgStyle,
    Color color = bcgColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
  }) {
    showModalBottomSheet(
      context: context,
      shape: dialogShape,
      backgroundColor: color,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      builder: (context) => DialogWidget(
        title: title,
        msg: msg,
        actions: actionsBuilder != null ? actionsBuilder(context) : actions,
        customView: customView,
        customViewPosition: customViewPosition,
        titleStyle: titleStyle,
        msgStyle: msgStyle,
        color: color,
      ),
    ).then((value) => onClose?.call(value));
  }
}
