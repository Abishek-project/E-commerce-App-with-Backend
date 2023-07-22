import 'dart:io';

import 'package:file_picker/file_picker.dart';

pickImages() async {
  List<File> images = [];
  try {
    var img = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: true);

    if (img != null && img.files.isNotEmpty) {
      for (var element in img.files) {
        images.add(File(element.path.toString()));
      }
    }
    return images;
  } catch (e) {
    print(e);
  }
}
