import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core/services/NewsServices.dart';
import '../../models/artical_model.dart';
import 'news_tile.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<ArticleModel> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    // استدعاء الخدمة لجلب الأخبار
    articles = await NewsService(Dio()).getNews(category: "general");

    // التحديث للحالة بعد الجلب
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News')),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // عرض مؤشر التحميل
          : CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return News_Title(articleModel: articles[index]);
              },
              childCount: articles.length,
            ),
          ),
        ],
      ),
    );
  }
}


