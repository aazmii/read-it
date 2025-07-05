import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.text, this.readOnly, this.showLoader = false});
  final String text;
  final bool? readOnly, showLoader;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Stack(
        children: [
          TextFormField(
            initialValue: text,
            expands: true,
            maxLines: null,
            textAlignVertical: TextAlignVertical.top,
            decoration: const InputDecoration(
              fillColor: Colors.transparent,
              filled: true,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
            ),
          ),
          if (showLoader!) const Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
