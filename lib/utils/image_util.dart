class ImageUtil {
  static String exportImageToURL(String url) {
    String exportURL = url.replaceAll('file/d/', 'uc?export=view&id=');
    return exportURL.replaceAll('/view?usp=drivesdk', '');
  }
}
