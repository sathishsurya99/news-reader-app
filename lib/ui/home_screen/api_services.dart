import '../../all_package.dart';

class NewsService {
  final Dio _dio = Dio();
  final String _apiKey = '1fa12eaa201749508647c67904284f7b';
  final String _url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=';

  Future<List<dynamic>> fetchNews() async {
    try {
      final response = await _dio.get(_url + _apiKey);
      if (response.statusCode == 200) {
        final articles = response.data['articles'];
        _saveArticlesOffline(articles);
        return articles;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      return _loadArticlesOffline();
    }
  }

  Future<void> _saveArticlesOffline(List<dynamic> articles) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cachedArticles', json.encode(articles));
  }

  Future<List<dynamic>> _loadArticlesOffline() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cachedArticles = prefs.getString('cachedArticles');
    if (cachedArticles != null) {
      return json.decode(cachedArticles);
    } else {
      throw Exception('No cached articles available');
    }
  }
}
