import 'dart:async';

import 'package:iki_news/model/news_api_response.dart';

class NewsBloc {
  StreamController<List<NewsApiResponse>> _americanNewsResponse = StreamController<List<NewsApiResponse>>();

  Stream get americanNewResponse => _americanNewsResponse.stream;

  Future<List<NewsApiResponse>> getAmericanNews(){
    // TODO : Call Your Repository Here
  }
}
