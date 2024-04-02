import 'dart:io';
import 'package:celebrate_assignment/screens/edit%20image/edit_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditImageScreen(imageFile: _image!),
          ),
        );
      } else {
        print('No image selected.');
      }
    });
  }

  // Future<void> getImage() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     CroppedFile? croppedFile = await ImageCropper().cropImage(
  //       sourcePath: pickedFile.path,
  //       aspectRatioPresets: [
  //         CropAspectRatioPreset.square,
  //         CropAspectRatioPreset.ratio3x2,
  //         CropAspectRatioPreset.original,
  //         CropAspectRatioPreset.ratio4x3,
  //         CropAspectRatioPreset.ratio16x9
  //       ],
  //        androidUiSettings: AndroidUiSettings(
  //         toolbarTitle: 'Crop Image',
  //         toolbarColor: Colors.deepOrange,
  //         toolbarWidgetColor: Colors.white,
  //         initAspectRatio: CropAspectRatioPreset.original,
  //         lockAspectRatio: false,
  //       ),
  //       iosUiSettings: IOSUiSettings(
  //         minimumAspectRatio: 1.0,
  //       ),
  //     );
  //     if (croppedFile != null) {
  //       _image = croppedFile as File?;
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => EditImageScreen(imageFile: _image!),
  //         ),
  //       );
  //     }
  //   } else {
  //     print('No image selected.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2.r,
                  blurRadius: 30.r,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 115, 115, 115),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Center(
                child: Text(
                  'Add Image / Icon',
                  style: GoogleFonts.diphylleia(
                    color: Color.fromARGB(255, 115, 115, 115),
                  ),
                  // style: GoogleFonts.nunito(     quintessential charm gowunBatang
                  //   color: const Color.fromARGB(255, 115, 115, 115),
                  // ),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.all(12),
            height: 120.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color.fromARGB(255, 115, 115, 115))),
            child: Column(
              children: [
                Text(
                  'Upload Image',
                  style: GoogleFonts.diphylleia(
                      color: Color.fromARGB(255, 115, 115, 115),
                      fontSize: 18.sp),
                ),
                Spacer(),
                GestureDetector(
                  onTap: getImage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 9, 137, 124),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.only(
                        top: 8.h, bottom: 8.h, left: 20.w, right: 20.w),
                    child: const Text(
                      'Choose from Device',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
