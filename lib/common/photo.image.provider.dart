import 'package:flutter/material.dart';
import 'dart:io';

class PhotoImageProvider {
  ImageProvider getImageProvider(File f) => f.existsSync()
      ? FileImage(f)
      : const AssetImage('assets/imgs/noImage.png');
}
