import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile =
        await picker.getImage(source: ImageSource.camera, maxWidth: 600);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 130,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storedImage == null
              ? const Text(
                  "No image yet",
                  textAlign: TextAlign.center,
                )
              : Image.file(
                  _storedImage as File,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            icon: const Icon(Icons.camera),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.primary),
            ),
            label: const Text("Take Picture"),
            onPressed: () {
              _takePicture();
            },
          ),
        ),
      ],
    );
  }
}
