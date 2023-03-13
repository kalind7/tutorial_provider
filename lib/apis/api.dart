import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:responsive/model/post_detail_model.dart';

import '../model/post_model.dart';
import 'endpoints.dart';

class Apis {
  //GET POST DATAS
  static Future<List<PostModel>> getApiDatas() async {
    //to fetch data

    // to make network calls
    Dio dio = Dio();

    //to add list of datas from network and return .
    List<PostModel> postList = [];

    try {
      //to check response from internet
      var response = await dio.get(Endpoints.url);

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
  //END//

  //GET DETAIL API//
  static Future<PostDetailModel> getDetailPost({int? id}) async {
    // var url = 'https://jsonplaceholder.typicode.com/posts/$id';

    Dio dio = Dio();

    try {
      var response = await dio.get('${Endpoints.url}/$id');

      print('***********************');
      print(response.data);

      return PostDetailModel.fromJson(response.data);
    } on DioError catch (e) {
      print('****************');
      print(e.response?.realUri);
      // print(e);
      print(e.response?.statusCode);
      throw Exception(e.toString());
    }
  }

  //END//

  //POST DATAS//

  static Future<bool> postServerDatas(Map<String, dynamic> datas) async {
    // var url = 'https://jsonplaceholder.typicode.com/posts';

    Dio dio = Dio();

    BotToast.showLoading();
    try {
      var response = await dio.post(Endpoints.url, data: datas);

      BotToast.showText(
        text: 'Your data is posted\n ${response.statusCode}',
      );

      BotToast.closeAllLoading();
      return true;
    } on DioError catch (e) {
      print('************** SHOW ERROR ************');
      print(e.toString());
      BotToast.showText(
        text: 'Error occurred \n ${e.response?.statusCode}',
      );
      BotToast.closeAllLoading();
      return false;
    }
  }
  //END//

  //UPDATE DATAS//

  static Future<bool> updateServerDatas(
      {required int id, required Map<String, dynamic> datas}) async {
    Dio dio = Dio();

    BotToast.showLoading();
    try {
      var response = await dio.patch('${Endpoints.url}/$id', data: datas);

      BotToast.showText(
        text: 'Your data is updated\n ${response.statusCode}',
      );

      BotToast.closeAllLoading();
      return true;
    } on DioError catch (e) {
      print('************** SHOW ERROR ************');
      print(e.toString());
      BotToast.showText(
        text: 'Error occurred \n ${e.response?.statusCode}',
      );
      BotToast.closeAllLoading();
      return false;
    }
  }
  //END//

  //DELETE DATA//
  static Future<bool> deleteDatas({
    required int id,
  }) async {
    Dio dio = Dio();

    BotToast.showLoading();
    try {
      var response = await dio.delete('${Endpoints.url}/$id');

      BotToast.showText(
        text: 'Your data is deleted\n ${response.statusCode}',
      );

      BotToast.closeAllLoading();
      return true;
    } on DioError catch (e) {
      print('************** SHOW ERROR ************');
      print(e.toString());
      BotToast.showText(
        text: 'Error occurred \n ${e.response?.statusCode}',
      );
      BotToast.closeAllLoading();
      return false;
    }
  }
}
