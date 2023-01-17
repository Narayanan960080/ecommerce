import 'package:flutter/material.dart';
import '../Model/ApiClient.dart';
import '../Model/ApiInterface.dart';
import '../Model/ApiResponse.dart';
import '../Model/Response/NewData.dart';
import '../Model/Status.dart';




class HomeVM extends ChangeNotifier{

  final _myRepo = ApiInterface();
  List<ListData> listOfData= [];
  ApiResponse<NewsData> dataConvert = ApiResponse.loading();

  ApiResponse<NewsData> get getData => dataConvert;


  setData(ApiResponse<NewsData> response) {
    print("Response :: $response");
    dataConvert = response;
    if(response.status == Status.completed){
      if(response.data!.data!.listData != null){
        List<ListData>? data1 = response.data!.data!.listData;
        listOfData = data1!;
        notifyListeners();
      }else{
        listOfData = [];
        notifyListeners();
      }

    }

  }



  Future<void> fetch(Map<String,dynamic> params,HomeVM model) async {
    model.setData( ApiResponse.loading());
    _myRepo.getNews(params,false,"")
        .then((value) {
      return model.setData( ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      return model.setData(ApiResponse.error(error.toString()));
    });
  }



}