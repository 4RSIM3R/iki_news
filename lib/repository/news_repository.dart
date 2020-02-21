import 'package:iki_news/model/api_service_model.dart';
import 'package:iki_news/model/news_api_response.dart';
import 'package:iki_news/service/api_service.dart';

class NewsRepository {
  ApiService apiService = ApiService();
  //https://pastebin.com/eyMt8qDA
  Future<ApiServiceModel<List<NewsApiResponse>>> getAmericanData() async {
    // TODO : Call Your Apibase Here To Get Some Data
    final response = await apiService
        .get('top-headlines?country=id&category=business&apiKey=0b1da1fe4e3d44e08b546002b29d6489');
    return ApiServiceModel.fromResponseList(
      response,
      (data) => data.map((x) => NewsApiResponse.fromJson(x as Map<String, dynamic>)).toList(),
    );
  }
}
