import 'package:flutter/material.dart';

Widget buildDrawerButton(
  BuildContext context, {
  required IconData icon,
  required String text,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      minimumSize: Size(MediaQuery.of(context).size.width * 0.75, 50),
    ),
    child: Row(
      children: [
        Icon(icon, color: const Color(0xFF8B4513)),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF8B4513),
            ),
          ),
        ),
        const Icon(Icons.arrow_forward_ios, color: Color(0xFF8B4513), size: 18),
      ],
    ),
  );
}

Widget buildBottomDrawerItem(
  BuildContext context, {
  required IconData icon,
  required String text,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(width: 15),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
