import 'package:flutter/material.dart';

import '../../models/artical_model.dart';

class News_Title extends StatelessWidget {
  const News_Title({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image(image: NetworkImage(articleModel.image?? ""), fit: BoxFit.cover,width: double.infinity,
            height: 200,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Text(articleModel.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 9,
        ),
        Text(articleModel.description?? "",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
