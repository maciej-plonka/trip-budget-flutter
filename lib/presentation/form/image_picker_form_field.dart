import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerFormField extends FormField<String> {
  ImagePickerFormField(
      {Key key,
      String initialValue,
      Decoration backgroundDecoration,
      double height,
        double width,
      CropAspectRatio aspectRatio,
      FormFieldSetter<String> onSaved})
      : super(
            key: key,
            onSaved: onSaved,
            initialValue: initialValue,
            builder: _createBuilder( backgroundDecoration, height, width, aspectRatio));

  static FormFieldBuilder<String> _createBuilder(
      Decoration backgroundDecoration,
      double height,
      double width,
      CropAspectRatio aspectRatio) {
    return (FormFieldState<String> field) {
      return GestureDetector(
        onTap: () async {
          final image = await ImagePicker().getImage(source: ImageSource.gallery);
          if (image == null) {
            field.didChange(null);
            return;
          }
          final croppedImage = await ImageCropper.cropImage(
            sourcePath: image.path,
            aspectRatio: aspectRatio ?? CropAspectRatio(ratioX: 1, ratioY: 1),
            aspectRatioPresets: [CropAspectRatioPreset.square],
            compressQuality: 70,
          );
          field.didChange(croppedImage.path);
        },
        child: Container(
            decoration: backgroundDecoration,
            width: width ?? double.infinity,
            height: height ?? double.infinity,
            child: _buildWidget(field.value)),
      );
    };
  }

  static Widget _buildWidget(String imageUrl) {
    if (imageUrl != null) {
      return Image.file(File.fromUri(Uri.parse(imageUrl)));
    }
    return Container(
      decoration: const BoxDecoration(
        border:const  Border(
          bottom: const BorderSide(color: Colors.black12, width: 1)
        )
      ),
      child: const Center(
        child: const  Icon(
          Icons.photo_camera,
          size: 48.0,
          color: Colors.black26,
        ),
      ),
    );
  }
}
