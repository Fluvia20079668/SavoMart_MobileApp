import 'dart:io';

import 'package:animations/animations.dart';
import 'package:savomart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class RemovableFileImage extends StatelessWidget {
  const RemovableFileImage(
      {Key? key,
      this.image,
      this.removeImage,
      this.index,
      this.width = defaultPadding * 10,
      this.height = defaultPadding * 10,
      this.pos = 0})
      : super(key: key);
  final File? image;
  final Function(int)? removeImage;
  final int? index;
  final double width;
  final double height;
  final double pos;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OpenContainer(
          closedBuilder: (BuildContext context, void Function() action) {
            return SizedBox(
                height: height,
                width: width,
                child: Image.file(image!, fit: BoxFit.cover));
          },
          openBuilder: (BuildContext context,
              void Function({Object returnValue}) action) {
            return Scaffold(
              body: PhotoView(
                imageProvider: FileImage(image!),
              ),
            );
          },
        ),
        if (removeImage != null)
          Positioned(
            right: pos,
            top: pos,
            child: IconButton(
                onPressed: () => removeImage!(index!),
                icon: const Icon(Icons.remove_circle, color: Colors.red)),
          ),
      ],
    );
  }
}
