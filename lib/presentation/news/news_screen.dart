import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core/services/NewsServices.dart';
import '../../models/artical_model.dart';
import 'news_tile.dart';


class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key, required this.category});
  final String category;
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<ArticleModel> articles=[];
  bool isLoading=true;
  @override
  void initState()  {
    super.initState();
    getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    articles = await NewsService(Dio()).getNews(category: widget.category);
    isLoading = false; // قم بتعديل الحالة هنا فقط
    setState(() {}); // تحديث الواجهة
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News"), // عرض اسم الفئة في شريط التطبيق
        ),
        body:isLoading
        ? Center(child: CircularProgressIndicator())
        : CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: articles.length,
                (context, index) {
              return News_Title(
                articleModel: articles[index],
              );
            },
          ),
        ),
      ],
    ),
    );
  }

}


