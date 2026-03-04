import 'package:dio/dio.dart';
import '../models/article_info.dart';

class JournalProvider {
  final _dio = Dio();

  Future<ArticleModel> getBreakingNews() async {
    final response = await _dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=43cafb2de81b4de691d7862a8ee4ef57',
    );
    return ArticleModel.fromJson(response.data);
  }
}