enum FileTypeEnum { voice, image, video, document }
FileTypeEnum handleFileType(String mimeType) {
  if (mimeType.startsWith("image/")) {
    return FileTypeEnum.image;
  } else if (mimeType.startsWith("video/")) {
    return FileTypeEnum.video;
  } else if (mimeType.startsWith("audio/")) {
    return FileTypeEnum.voice;
  } else {
    return FileTypeEnum.document;
  }
}
