import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.padding,
    this.hintText,
    this.controller,
    this.title,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters
  }) : super(key: key);
  final EdgeInsetsGeometry padding;
  final String? hintText;
  final TextEditingController? controller;
  final String? title;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title??'',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText:hintText 
              ),
              style: const TextStyle(
                fontSize: 15
              ),
              keyboardType:keyboardType,
              maxLength: maxLength,
              inputFormatters: inputFormatters,
            ),
            )
          ],
      ),
    );
  }
  
}