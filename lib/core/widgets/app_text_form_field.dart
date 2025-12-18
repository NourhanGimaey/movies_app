import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatefulWidget {
  final String customLabel;
  final TextInputType customKeyboardType;
  final TextInputAction customTextInputAction;
  final Widget? customPrefixIcon;
  final TextEditingController? controller;
  final bool isName;
  final bool isEmail;
  final bool isPhone;
  final bool isPassword;
  final bool isConfirmPassword;
  final TextEditingController? matchPasswordController;
  final void Function(String)? onChanged;

  const AppTextFormField({
    super.key,
    required this.customKeyboardType,
    required this.customTextInputAction,
    required this.customPrefixIcon,
    required this.customLabel,
    this.controller,
    this.isName = false,
    this.isEmail = false,
    this.isPhone = false,
    this.isPassword = false,
    this.isConfirmPassword = false,
    this.matchPasswordController,
    this.onChanged,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name';
  }
  return null;
}

String? emailValidator(String? value) {
  final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? phoneValidator(String? value) {
  final RegExp phoneRegex = RegExp(
    r'^\+?\d{1,3}?[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$',
  );
  if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
  } else if (!phoneRegex.hasMatch(value)) {
    return 'Please enter valid phone number';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  if (!value.contains(RegExp(r'[A-Z]'))) {
    return 'Password must contain at least one uppercase letter';
  }
  if (!value.contains(RegExp(r'[a-z]'))) {
    return 'Password must contain at least one lowercase letter';
  }
  if (!value.contains(RegExp(r'[0-9]'))) {
    return 'Password must contain at least one number';
  }
  if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return 'Password must contain at least one special character';
  }
  return null;
}

String? confirmPasswordValidator(
  String? confirmPasswordValue,
  TextEditingController? passwordController,
) {
  if (confirmPasswordValue == null || confirmPasswordValue.isEmpty) {
    return 'Please confirm your password';
  }
  if (passwordController == null ||
      confirmPasswordValue != passwordController.text) {
    return 'Passwords do not match';
  }
  return null;
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isObscureText = true;
  @override
  void initState() {
    super.initState();
    if (widget.isPhone && widget.controller!.text.isEmpty) {
      widget.controller!.text = '+2';
      widget.controller!.selection = TextSelection.fromPosition(
        TextPosition(offset: widget.controller!.text.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      textInputAction: widget.customTextInputAction,
      keyboardType: widget.customKeyboardType,
      obscureText: widget.isPassword || widget.isConfirmPassword
          ? isObscureText
          : !isObscureText,
      inputFormatters: widget.isPhone
          ? [FilteringTextInputFormatter.allow(RegExp(r'[\d\+\-\s\(\)]'))]
          : null,
      validator: (value) {
        if (widget.isName) {
          return nameValidator(value);
        } else if (widget.isEmail) {
          return emailValidator(value);
        } else if (widget.isPassword) {
          return passwordValidator(value);
        } else if (widget.isConfirmPassword) {
          return confirmPasswordValidator(
            value,
            widget.matchPasswordController,
          );
        } else if (widget.isPhone) {
          return phoneValidator(value);
        }
        return null;
      },
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.primaryContainer,
        label: Text(widget.customLabel),
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: widget.customPrefixIcon,
        ),
        prefixIconColor: Theme.of(context).colorScheme.primary,
        suffixIconColor: Theme.of(context).colorScheme.primary,
        suffixIcon: Visibility(
          visible: widget.isPassword || widget.isConfirmPassword,
          child: IconButton(
            onPressed: () {
              isObscureText = !isObscureText;
              setState(() {});
            },
            icon: Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
          ),
        ),
        contentPadding: EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}
