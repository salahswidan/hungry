import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.isPassword,
    required this.controller,
  });
  final String hint;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${widget.hint}';
        }
        if (widget.isPassword && value.length < 6) {
          return 'Password must be at least 6 characters long}';
        }
        return null;
      },
      obscureText: _obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: widget.hint,
        fillColor: Colors.white,
        filled: true,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;

                  });
                },
                child: Icon(CupertinoIcons.eye) ,
              )
            : null,
      ),
    );
  }
}
