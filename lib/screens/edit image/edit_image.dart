import 'dart:io';
import 'dart:typed_data';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:celebrate_assignment/screens/home/home_screen.dart';
import 'package:celebrate_assignment/widget/prop_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditImageScreen extends StatefulWidget {
  final File imageFile;

  const EditImageScreen({Key? key, required this.imageFile}) : super(key: key);

  @override
  _EditImageScreenState createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  double _rotationAngle = 0;
  bool _flippedHorizontally = false;
  bool _flippedVertically = false;
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
                    style: GoogleFonts.diphylleia(
                      color: const Color.fromARGB(255, 115, 115, 115),
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  selectedFrame.isNotEmpty
                      ? Container(
                          width:
                              250.h,
                          height:
                              250.h, 
                          child: ClipOval(
                            child: Stack(
                              children: [
                                Image.file(
                                  widget.imageFile,
                                  fit: BoxFit
                                      .cover,
                                  colorBlendMode: BlendMode
                                      .srcOver, 
                                  color: Colors.white.withOpacity(
                                      0),
                                ),
                                Positioned.fill(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10,
                                        sigmaY:
                                            10),
                                    child: Container(
                                      color: Colors
                                          .transparent, 
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )

                      // ClipOval(
                      //     child: Container(
                      //       width:
                      //           250.h,
                      //       height: 250
                      //           .h,
                      //       child: Image.file(
                      //         widget.imageFile,
                      //         fit: BoxFit
                      //             .cover,
                      //       ),
                      //     ),
                      //   )

                      // Container(
                      //     width: 200,
                      //     height: 200,
                      //     decoration: BoxDecoration(
                      //       shape: BoxShape.circle,
                      //     ),
                      //     child: ClipOval(
                      //       child: Image.file(
                      //         widget.imageFile,
                      //         height: 200, // Match the height of the container
                      //         width: 200, // Match the width of the container
                      //         fit: BoxFit
                      //             .cover, // Ensure the entire image is visible within the circular shape
                      //       ),
                      //     ),
                      //   )
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
                              color: const Color.fromARGB(255, 179, 179, 179),
                            ),
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
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Stack(
                    children: <Widget>[
                      Positioned(
                        top: -20,
                        right: -90,
                        child: AlertDialog(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          backgroundColor: Colors.black,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2.h,
                            horizontal: 20.w,
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _flippedHorizontally =
                                        !_flippedHorizontally;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Flip Horizontally',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _flippedVertically = !_flippedVertically;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Flip Vertically',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
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
          ),
        ],
      ),
      body: Center(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(_flippedHorizontally ? math.pi : 0)
            ..rotateZ(_flippedVertically ? math.pi : 0),
          child: Transform.rotate(
            angle: _rotationAngle * (math.pi / 180),
            child: Image.file(widget.imageFile),
          ),
        ),
      ),
    );
  }
}
