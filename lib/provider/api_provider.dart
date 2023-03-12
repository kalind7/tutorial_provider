import 'package:flutter/material.dart';
import 'package:responsive/model/post_detail_model.dart';

import '../apis/api.dart';
import '../model/post_model.dart';

class ApiProvider extends ChangeNotifier {
  List<PostModel> mainPostList = [];

  PostDetailModel? postDetailModel;

  //to return datas from api.
  Future fetchData() async {
    var allPostData = await Apis.getApiDatas();

    mainPostList = allPostData;

    notifyListeners();
  }

  Future fetchDetailModel({int? id}) async {
    var allDetailData = await Apis.getDetailPost(id: id);

    postDetailModel = allDetailData;

    notifyListeners();
  }

  init() {
    fetchData();
    fetchDetailModel();
  }
}
