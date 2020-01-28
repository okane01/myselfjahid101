import 'dart:io';

import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as paths;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraWidget extends StatefulWidget {
 final Function onSelectedImage;
  CameraWidget(
    this.onSelectedImage,
  );
  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  File _storedImage;

  Future<void> _picImage() async {
    final _newImage = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
    );
    setState(() {
      _storedImage = _newImage;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = paths.basename(appDir.path);
    final savedImage = await _newImage.copy('${appDir.path}/$fileName');

    widget.onSelectedImage(
      savedImage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: _storedImage == null
                ? Icon(
                    Icons.folder_open,
                    color: Theme.of(context).primaryColor,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    child: Image.file(
                      _storedImage,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.folder_open,
          ),
          onPressed: _picImage,
        ),
      ],
    );
  }
}
