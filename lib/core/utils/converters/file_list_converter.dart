import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

class FileListConverter implements JsonConverter<List<File>, List<String>> {
  const FileListConverter();

  @override
  List<File> fromJson(List<String> json) {
    return json.map((path) => File(path)).toList();
  }

  @override
  List<String> toJson(List<File> files) {
    return files.map((file) => file.path).toList();
  }
}
