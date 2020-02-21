import 'dart:async';

import 'package:iki_news/model/news_api_response.dart';
import 'package:iki_news/repository/news_repository.dart';
import 'package:iki_news/service/api_exceptions.dart';

class NewsBloc {
  NewsRepository repository = NewsRepository();

  StreamController<List<NewsApiResponse>> _americanNewsResponse = StreamController<List<NewsApiResponse>>();

  Stream get americanNewResponse => _americanNewsResponse.stream;

  Future<List<NewsApiResponse>> getAmericanNews() async {
    // TODO : Call Your Repository Here
    List<NewsApiResponse> _list = [];
    try {
      final response = await repository.getAmericanData();
      _list.addAll(response.data);
      _americanNewsResponse.sink.add(response.data);
    } catch (e) {
      if (e is BussinessException) {
        print(e.message);
        throw e.message;
      } else {
        print(e.toString());
        throw e.toString();
      }
    }
    return _list;
  }
}
