import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final InputDecoration? inputDecoration;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool? obsecureText;
  final String hintText;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final bool showPrefixIcon;
  final bool showSuffixIcon;
  final EdgeInsets? contentPadding;
  final void Function()? onTap;
  final Color? fillColor;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final Color? enableBorderColor;
  const TextFieldWidget({
    Key? key,
    this.enableBorderColor,
    this.enabledBorder,
    this.border,
    this.fillColor,
    this.textEditingController,
    this.focusNode,
    this.suffixIcon,
    this.inputDecoration,
    this.textInputFormatter,
    this.textInputAction,
    this.onChanged,
    this.textInputType,
    required this.hintText,
    this.obsecureText,
    this.prefixIcon,
    this.hintStyle,
    this.showPrefixIcon = false,
    this.showSuffixIcon = false,
    this.contentPadding,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      focusNode: focusNode,
      onChanged: onChanged,
      onTap: onTap,
      decoration: inputDecoration ??
          InputDecoration(
            fillColor: fillColor,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            // contentPadding: contentPadding ?? const EdgeInsets.all(8),
            hintText: hintText,
            enabled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: enableBorderColor ?? Colors.black,
                width: 1,
              ),
            ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: enableBorderColor ?? Colors.black,
                    width: 1,
                  ),
                ),
            border: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(211, 211, 211, 1),
                    width: 1,
                  ),
                ),
          ),
      inputFormatters: textInputFormatter,
      keyboardType: textInputType ?? TextInputType.text,
      obscureText: obsecureText ?? false,
      textInputAction: textInputAction ?? TextInputAction.next,
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final InputDecoration? inputDecoration;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool? obsecureText;
  final String hintText;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final bool showPrefixIcon;
  final bool showSuffixIcon;
  final EdgeInsets? contentPadding;
  final String initialValue;
  final void Function(String?)? onSaved;
  final bool readOnly;
  final Color? enableBorderColor;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final int? maxLines;
  const TextFormFieldWidget({
    Key? key,
    this.maxLines,
    this.border,
    this.enabledBorder,
    this.enableBorderColor,
    this.textEditingController,
    this.focusNode,
    this.suffixIcon,
    this.inputDecoration,
    this.textInputFormatter,
    this.textInputAction,
    this.onChanged,
    this.textInputType,
    required this.hintText,
    this.obsecureText,
    this.prefixIcon,
    this.hintStyle,
    this.showPrefixIcon = false,
    this.showSuffixIcon = false,
    this.contentPadding,
    required this.initialValue,
    required this.onSaved,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: textEditingController,
      focusNode: focusNode,
      onChanged: onChanged,
      onSaved: onSaved,
      readOnly: readOnly,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        // contentPadding: contentPadding ?? const EdgeInsets.all(8),
        hintText: hintText,
        enabled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: enableBorderColor ?? const Color(0xFF808080),
            width: 1,
          ),
        ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: enableBorderColor ?? const Color(0xFF808080),
                width: 1,
              ),
            ),
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color.fromRGBO(211, 211, 211, 1),
                width: 1,
              ),
            ),
      ),
      maxLines: maxLines,
      inputFormatters: textInputFormatter,
      keyboardType: textInputType ?? TextInputType.text,
      obscureText: obsecureText ?? false,
      textInputAction: textInputAction ?? TextInputAction.next,
    );
  }
}
