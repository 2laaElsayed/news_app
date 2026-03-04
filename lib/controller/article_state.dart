import '../models/article_info.dart';

abstract class ArticleState {}

class ArticleInitial extends ArticleState {}
class ArticleLoading extends ArticleState {}

class ArticleSuccess extends ArticleState {
  final List<Article> dataList;
  ArticleSuccess(this.dataList);
}

class ArticleError extends ArticleState {
  final String error;
  ArticleError(this.error);
}