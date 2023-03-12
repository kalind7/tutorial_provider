import 'package:dio/dio.dart';
import 'package:responsive/model/post_detail_model.dart';

import '../model/post_model.dart';

class Apis {
  static Future<List<PostModel>> getApiDatas() async {
    //to fetch data
    var url = 'https://jsonplaceholder.typicode.com/posts';

    // to make network calls
    Dio dio = Dio();

    //to add list of datas from network and return .
    List<PostModel> postList = [];

    try {
      //to check response from internet
      var response = await dio.get(url);

      // print(response.data);

      //particular list lai model ma convert garcha
      for (var element in response.data) {
        postList.add(PostModel.fromJson(element));
      }

      return postList;
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  static Future<PostDetailModel> getDetailPost({int? id}) async {
    var url = 'https://jsonplaceholder.typicode.com/posts/$id';

    Dio dio = Dio();

    try {
      var response = await dio.get(url);

      print('***********************');
      print(response.data);

      return PostDetailModel.fromJson(response.data);
    } catch (e) {
      print('****************');
      print(e);
      throw Exception(e.toString());
    }
  }
}
