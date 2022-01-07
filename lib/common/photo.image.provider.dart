import 'package:flutter/material.dart';
import 'dart:io';

class PhotoImageProvider {
  Object getImageProvider(File f) => f.existsSync()
      ? FileImage(f)
      : const AssetImage('assets/imgs/noImage.png');
}
