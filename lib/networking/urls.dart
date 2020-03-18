class NetworkUtil {
  // TODO: change to dynamic URL after api deploy
  static const String baseURL = 'http://192.168.0.9:8000/api';

  // endpoints
  static const String markers = '$baseURL/markers/';
  static const String categories = '$baseURL/categories/';
}
