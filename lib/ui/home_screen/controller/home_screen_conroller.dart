import '../../../all_package.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var newsList = [].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      isLoading(true);
      var articles = await NewsService().fetchNews();
      newsList.assignAll(articles);
      errorMessage('');
    } catch (e) {
      errorMessage('Failed to load news. Please try again.');
    } finally {
      isLoading(false);
    }
  }
}
