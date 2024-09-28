import '../../../all_package.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Reader App'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (newsController.isLoading.value) {
          return Center(
              child: CircularProgressIndicator(color: Colors.blue[900]));
        }

        if (newsController.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red, size: 60),
                const SizedBox(height: 10),
                Text(
                  newsController.errorMessage.value,
                  style: TextStyle(fontSize: 18, color: Colors.blue[900]),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => newsController.fetchNews(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Retry',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );
        }
        if (newsController.newsList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.article_outlined, color: Colors.blue[300], size: 60),
                const SizedBox(height: 10),
                Text(
                  'No news articles available.',
                  style: TextStyle(fontSize: 18, color: Colors.blue[700]),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => newsController.fetchNews(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Refresh',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: newsController.newsList.length,
          itemBuilder: (context, index) {
            final article = newsController.newsList[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => NewsDetailsScreen(article: article),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 500));
              },
              child: Card(
                elevation: 8,
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: Colors.blue[50],
                    child: Row(
                      children: [
                        article['urlToImage'] != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  article['urlToImage'],
                                  width: screenWidth * 0.25,
                                  height: screenWidth * 0.25,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://t4.ftcdn.net/jpg/04/26/82/93/360_F_426829322_9UdfjbRtK7lDhi4mKWI9sGMgBNN70odz.jpg',
                                  width: screenWidth * 0.25,
                                  height: screenWidth * 0.25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article['title'],
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: screenWidth * 0.02),
                                Text(
                                  article['description'] ?? '',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: screenWidth * 0.02),
                                Text(
                                  article['publishedAt'],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
