import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const PropWidget({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color.fromARGB(255, 179, 179, 179)),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Image.asset(
            imagePath,
            width: 34.w,
          ),
        ),
      ),
    );
  }
}
