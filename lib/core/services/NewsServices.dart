import 'package:dio/dio.dart';

import '../../models/artical_model.dart';

class NewsService{
  final Dio dio;
  NewsService( this.dio);
  Future<List<ArticleModel>> getNews({required category}) async{
    var response = await dio.get("https://newsapi.org/v2/top-headlines?category=$category&apiKey=4e37e6ff010541df8a2682308afbc0d2" );
    Map<String,dynamic> jsonData= response.data;
    List<dynamic> articles= jsonData['articles'];
    List<ArticleModel>articlesList= [];
    for(var article in articles){
      ArticleModel articlemodel=ArticleModel.fromJson(article);
      articlesList.add(articlemodel);
    }
    print(articlesList);
    return articlesList;
    // for(var article in articles){
    //   print(article['author']);
    // }
  }
}