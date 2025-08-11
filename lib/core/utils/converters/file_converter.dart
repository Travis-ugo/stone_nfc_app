// lib/core/utils/converters/file_converter.dart
import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

class FileConverter implements JsonConverter<File?, String?> {
  const FileConverter();

  @override
  File? fromJson(String? json) {
    return json != null ? File(json) : null;
  }

  @override
  String? toJson(File? file) {
    return file?.path;
  }
}