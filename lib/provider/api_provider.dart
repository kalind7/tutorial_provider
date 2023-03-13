import 'package:flutter/material.dart';
import 'package:responsive/model/post_detail_model.dart';

import '../apis/api.dart';
import '../model/post_model.dart';

class ApiProvider extends ChangeNotifier {
  List<PostModel> mainPostList = [];

  PostDetailModel? postDetailModel;

  bool isLoading = false;

  toggleLoading(bool newLoading) {
    isLoading = !newLoading;
    notifyListeners();
  }

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
    // fetchDetailModel();
  }

  // Future fetchPostData(Map<String, dynamic> datas) async {
  //   toggleLoading(true);
  //   var postData = await Apis.postServerDatas(datas);
  //   toggleLoading(false);
  // }
}
