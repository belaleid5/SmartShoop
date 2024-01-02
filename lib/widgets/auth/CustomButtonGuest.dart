import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomButtonGuest extends StatelessWidget {
  const CustomButtonGuest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.9),
              foregroundColor: Colors.black.withOpacity(0.5),
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )),
          onPressed: () {
            context.go("/");
          },
          child: const Text(
            "Guest?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
