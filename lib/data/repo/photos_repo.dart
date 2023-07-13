import 'dart:convert';
import 'package:web_mobril_test/data/photo_dto.dart';
import 'package:web_mobril_test/utils/constants.dart';
import 'package:http/http.dart' as http;

class PhotosRepo {
  static Future<List<PhotoDto>> getPhotoList()async {
    final url = Uri.parse("$kBaseUrl/photos");
    final response = await http.get(url);
    final jsonArray = jsonDecode(response.body) as Iterable;
    return jsonArray.map((e) => PhotoDto.fromJson(e)).toList();
  }
}
