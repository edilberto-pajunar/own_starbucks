import 'package:flutter/material.dart';
import '../shared/colors.dart';

enum _ButtonType { solid, outlined }

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? icon;
  final double? width;
  final double? height;
  final _ButtonType _type;

  const PrimaryButton._({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
    this.width,
    this.height,
    required _ButtonType type,
  }) : _type = type;

  factory PrimaryButton.solid({
    Key? key,
    required String text,
    required VoidCallback? onPressed,
    bool isLoading = false,
    Widget? icon,
    double? width,
    double? height,
  }) {
    return PrimaryButton._(
      key: key,
      text: text,
      onPressed: onPressed,
      isLoading: isLoading,
      icon: icon,
      width: width,
      height: height,
      type: _ButtonType.solid,
    );
  }

  factory PrimaryButton.outlined({
    Key? key,
    required String text,
    required VoidCallback? onPressed,
    bool isLoading = false,
    Widget? icon,
    double? width,
    double? height,
  }) {
    return PrimaryButton._(
      key: key,
      text: text,
      onPressed: onPressed,
      isLoading: isLoading,
      icon: icon,
      width: width,
      height: height,
      type: _ButtonType.outlined,
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonChild = isLoading
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                _type == _ButtonType.solid ? AppColor.white : AppColor.primary,
              ),
            ),
          )
        : icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [icon!, const SizedBox(width: 8), Text(text)],
          )
        : Text(text);

    final button = _type == _ButtonType.solid
        ? ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              foregroundColor: AppColor.white,
              disabledBackgroundColor: AppColor.darkGrey,
              disabledForegroundColor: AppColor.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              minimumSize: Size(width ?? 0, height ?? 48),
            ),
            child: buttonChild,
          )
        : OutlinedButton(
            onPressed: isLoading ? null : onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColor.primary,
              disabledForegroundColor: AppColor.darkGrey,
              side: BorderSide(
                color: onPressed != null ? AppColor.primary : AppColor.darkGrey,
                width: 1.5,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              minimumSize: Size(width ?? 0, height ?? 48),
            ),
            child: buttonChild,
          );

    return width != null
        ? SizedBox(width: width, height: height, child: button)
        : button;
  }
}
