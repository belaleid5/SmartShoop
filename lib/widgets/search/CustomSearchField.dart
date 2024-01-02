import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.onChanged,
    this.onTap,
    required this.controller,
    this.onSubmitted,
  });
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  final Function()? onTap;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // Add padding around the search bar
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        // Use a Material design search bar
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: 'Search...',
            // Add a clear button to the search bar
            suffixIcon:
                IconButton(icon: const Icon(Icons.clear), onPressed: onTap),
            // Add a search icon or button to the search bar
            prefixIcon: const Icon(Icons.search),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
