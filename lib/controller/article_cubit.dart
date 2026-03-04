import 'package:flutter_bloc/flutter_bloc.dart';
import 'article_state.dart';
import '../services/journal_provider.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());

  void loadArticles() async {
    emit(ArticleLoading());
    try {
      final result = await JournalProvider().getBreakingNews();
      emit(ArticleSuccess(result.articles ?? []));
    } catch (e) {
      emit(ArticleError(e.toString()));
    }
  }
}