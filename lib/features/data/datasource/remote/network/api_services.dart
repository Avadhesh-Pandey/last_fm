import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio();

  Future<Response> getTopAlbums(int page) async {
    return await dio.get('https://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist=cher&api_key=a35699f435445486aec22d7a19e652bf&format=json',queryParameters: {"page":page});
  }
}
