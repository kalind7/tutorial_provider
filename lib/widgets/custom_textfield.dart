import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.textInputType,
    this.textInputAction,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;

  TextInputType? textInputType;
  TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          keyboardType: textInputType ?? TextInputType.number,
          textInputAction: textInputAction ?? TextInputAction.next,
          controller: controller,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black),
            // prefixIcon: const Icon(
            //   Icons.search,
            //   color: Colors.white,
            // ),
            fillColor: Colors.grey.shade300,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black38, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red, width: 1.5)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
