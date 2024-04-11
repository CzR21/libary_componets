import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../helpers/app_scrolable.dart';
import '../helpers/responsive_helper.dart';

enum ButtonAlignment { center, left, right }

class CustomButtom extends StatefulWidget {

  final void Function() onPressed;
  final String text;
  final String? leadingIconAsset;
  final Color primaryColor;
  final Color secondColor;
  final Color disabledColor;
  final Color disabledSecondColor;
  final Color? textColor;
  final TextStyle textStyle;
  final Color? disabledTextColor;
  final ButtonAlignment alignment;
  final bool outlined;
  final bool enabled;
  final bool loading;
  final bool leadingIcon;
  final bool invertedLeadingIconPosition;
  final bool compact;
  final bool expands;
  final double borderRadios;

  const CustomButtom({
    super.key,
    required this.onPressed,
    required this.text,
    this.leadingIconAsset,
    required this.primaryColor,
    required this.secondColor,
    required this.disabledColor,
    required this.disabledSecondColor,
    this.textColor,
    required this.textStyle,
    this.disabledTextColor,
    this.alignment = ButtonAlignment.center,
    this.outlined = false,
    this.enabled = true,
    this.loading = false,
    this.leadingIcon = false,
    this.invertedLeadingIconPosition = false,
    this.compact = false,
    this.expands = true,
    this.borderRadios = 999,
  });

  @override
  State<CustomButtom> createState() => _CustomButtomState();
}

class _CustomButtomState extends State<CustomButtom> {

  @override
  Widget build(BuildContext context) {
    final textColor = widget.enabled
        ? widget.textColor ?? (widget.outlined ? widget.primaryColor : widget.secondColor)
        : widget.disabledTextColor ?? (widget.outlined ? widget.disabledColor : widget.disabledSecondColor);

    final loadingIcon = Center(
      child: SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          color: textColor,
          strokeWidth: 2,
        ),
      ),
    );

    return ElevatedButton(
      onPressed: () {
        FocusScope.of(context).unfocus();
        if (widget.enabled && !widget.loading) {
          widget.onPressed.call();
        }
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(
          vertical: widget.compact ? 8 : 16,
          horizontal: 24,
        ),
        splashFactory: InkSplash.splashFactory,
        alignment: widget.alignment == ButtonAlignment.left ? Alignment.centerLeft : widget.alignment == ButtonAlignment.center ? Alignment.center : Alignment.centerRight,
        minimumSize: Size(
          widget.expands ? double.infinity : 0,
          max(ResponsivenessHelper.of(context).lineHeightOf(widget.textStyle), 16) + (widget.compact ? 16 : 32),
        ),
        maximumSize: Size(
          double.infinity,
          max(ResponsivenessHelper.of(context).lineHeightOf(widget.textStyle), 16) + (widget.compact ? 16 : 32),
        ),
        shape: RoundedRectangleBorder(
          side: widget.outlined ? BorderSide(color: widget.enabled ? widget.primaryColor : widget.disabledColor,) : BorderSide.none,
          borderRadius: BorderRadius.circular(widget.borderRadios),
        ),
        shadowColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: !widget.outlined
            ? widget.enabled
            ? widget.primaryColor
            : widget.disabledColor
            : Colors.transparent,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(
              builder: (context) {
                if (widget.alignment == ButtonAlignment.left) {
                  if (widget.loading) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        loadingIcon,
                        const SizedBox(width: 16),
                      ],
                    );
                  }
                  if (widget.leadingIcon) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: widget.leadingIconAsset == null ? Container() : SvgPicture.asset(
                            widget.leadingIconAsset!,
                            fit: BoxFit.contain,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    );
                  }
                }
                return const SizedBox();
              },
            ),
            Builder(
              builder: (context) {
                if (widget.alignment == ButtonAlignment.center && widget.invertedLeadingIconPosition) {
                  if (widget.loading) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        loadingIcon,
                        const SizedBox(width: 16),
                      ],
                    );
                  }
                  if (widget.leadingIcon) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: widget.leadingIconAsset == null ? Container() : SvgPicture.asset(
                            widget.leadingIconAsset!,
                            fit: BoxFit.contain,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    );
                  }
                }
                return const SizedBox();
              },
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxWidth - (widget.leadingIcon || widget.loading ? 32 : 0),
              ),
              child: AppScrollableText(widget.text, style: widget.textStyle.copyWith(color: textColor,),
              ),
            ),
            Builder(
              builder: (context) {
                if (widget.alignment == ButtonAlignment.center && !widget.invertedLeadingIconPosition) {
                  if (widget.loading) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 16),
                        loadingIcon,
                      ],
                    );
                  }
                  if (widget.leadingIcon) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: widget.leadingIconAsset == null ? Container() : SvgPicture.asset(
                            widget.leadingIconAsset!,
                            fit: BoxFit.contain,
                            color: textColor,
                          ),
                        ),
                      ],
                    );
                  }
                }
                return const SizedBox();
              },
            ),
            Builder(
              builder: (context) {
                if (widget.alignment == ButtonAlignment.right) {
                  if (widget.loading) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 16),
                        loadingIcon,
                      ],
                    );
                  }
                  if (widget.leadingIcon) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: widget.leadingIconAsset == null ? Container() : SvgPicture.asset(
                            widget.leadingIconAsset!,
                            fit: BoxFit.contain,
                            color: textColor,
                          ),
                        ),
                      ],
                    );
                  }
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
