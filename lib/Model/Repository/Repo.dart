
import '../Response/BaseData.dart';
import '../Response/NewData.dart';

abstract class Repo{


  Future<NewsData?> getNews(Map<String,dynamic> params,bool isRefresh,String page) async {
    return null;
  }


}