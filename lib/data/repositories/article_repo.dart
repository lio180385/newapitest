import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newapitest/data/models/api_model.dart';
import 'package:newapitest/res/strings.dart';

abstract class ArticleRepository {
  Future<List<Articles>> getArticles();
}

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<List<Articles>> getArticles() async {
    var response = await http.get(Uri.parse(AppStrings.url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Articles> articles = ApiResultModel.fromJson(data).articles;
      return articles;
    } else {
      throw Exception();
    }
  }
}
