import 'dart:io';
import 'dart:typed_data';

import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:celebrate_assignment/screens/home/home_screen.dart';
import 'package:celebrate_assignment/widget/prop_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditImageScreen extends StatefulWidget {
  final File imageFile;

  const EditImageScreen({Key? key, required this.imageFile}) : super(key: key);

  @override
  _EditImageScreenState createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  double _rotationAngle = 0;
  String selectedFrame = '';

  Future<void> _showCropDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  Text(
                    'Upload Image',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 115, 115, 115),
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  // selectedFrame.isNotEmpty
                  //     ? Stack(
                  //         children: [
                  //           Image.asset(
                  //             selectedFrame,
                  //             height: 250.h,
                  //           ),
                  //           Positioned.fill(
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(12),
                  //               child: Image.file(
                  //                 widget.imageFile,
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       )
                  //     : Image.file(
                  //         widget.imageFile,
                  //         height: 250.h,
                  //       ),

                  selectedFrame.isNotEmpty
                      ? Image.asset(
                          selectedFrame,
                          height: 250.h,
                        )
                      : Image.file(
                          widget.imageFile,
                          height: 250.h,
                        ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFrame = '';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 179, 179, 179)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Original',
                              style: TextStyle(
                                color: Color.fromARGB(255, 115, 115, 115),
                              ),
                            ),
                          ),
                        ),
                      ),
                      PropWidget(
                        imagePath: 'assets/images/user_image_frame_1.png',
                        onTap: () {
                          setState(() {
                            selectedFrame =
                                'assets/images/user_image_frame_1.png';
                          });
                        },
                      ),
                      PropWidget(
                        imagePath: 'assets/images/user_image_frame_2.png',
                        onTap: () {
                          setState(() {
                            selectedFrame =
                                'assets/images/user_image_frame_2.png';
                          });
                        },
                      ),
                      PropWidget(
                        imagePath: 'assets/images/user_image_frame_3.png',
                        onTap: () {
                          setState(() {
                            selectedFrame =
                                'assets/images/user_image_frame_3.png';
                          });
                        },
                      ),
                      PropWidget(
                        imagePath: 'assets/images/user_image_frame_4.png',
                        onTap: () {
                          setState(() {
                            selectedFrame =
                                'assets/images/user_image_frame_4.png';
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 55.h,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 9, 137, 124),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: const Center(
                        child: Text(
                          'Use this image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(194, 6, 5, 5),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.rotate_right,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _rotationAngle -= 90;
              });
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.flip,
              color: Colors.white,
            ),
            onPressed: () {
              // Implement image flipping logic here
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const HomeScreen()));
              Future.microtask(() {
                _showCropDialog(context);
              });
            },
            child: const Text(
              'CROP',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Transform.rotate(
          angle: _rotationAngle *
              (3.14159265359 / 180), // Convert degrees to radians
          child: Image.file(widget.imageFile),
        ),
      ),
    );
  }
}
