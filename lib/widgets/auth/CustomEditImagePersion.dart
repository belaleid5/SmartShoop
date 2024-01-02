import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_smart/consts/AppColor.dart';

class PickedImageWidget extends StatefulWidget {
  const PickedImageWidget({
    super.key,
    this.pickedImage,
    this.funCamera,
    this.fubGallery,
  });
  final XFile? pickedImage;
  final Function()? funCamera, fubGallery;
  @override
  State<PickedImageWidget> createState() => _PickedImageWidgetState();
}

class _PickedImageWidgetState extends State<PickedImageWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return widget.pickedImage == null
        ? Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: size.width * 0.30,
                ),
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
              Positioned(
                right: 105,
                bottom: 104,
                child: InkWell(
                  onTap: widget.funCamera,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColor.darkPrimary.withOpacity(0.8),
                    ),
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      size: 25,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ],
          )
        : InkWell(
            onTap: widget.fubGallery,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: AppColor.darkPrimary,
                    width: 2,
                  ),
                ),
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: size.width * 0.30,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.file(
                      File(widget.pickedImage!.path),
                      fit: BoxFit.fill,
                      height: size.width * 0.30,
                    ))),
          );
  }
}
