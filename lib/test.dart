import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Test extends StatefulWidget {
  const Test({super.key});
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool ontap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            ontap = !ontap;
          });
        },
        child: Center(
            child: ontap
                ? Image.asset('assets/images/user_image_frame_1.png')
                : Container(
                    //color: Colors.pink, // Set the background color to yellow
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.pink.withOpacity(
                            0.5), // Adjust the opacity value (0.0 to 1.0) to make the image transparent
                        BlendMode
                            .dstATop, // Use dstATop blend mode to apply transparency
                      ),
                      child: Image.asset(
                        'assets/images/logo.jpeg',
                        height: 250.h,
                      ),
                    ),
                  )),
      ),
    );
  }
}
