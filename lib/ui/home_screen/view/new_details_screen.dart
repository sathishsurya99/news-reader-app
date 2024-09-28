import '../../../all_package.dart';

class NewsDetailsScreen extends StatefulWidget {
  final dynamic article;

  const NewsDetailsScreen({super.key, required this.article});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Details'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.article['urlToImage'] != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.article['urlToImage'],
                      width: double.infinity,
                      height: screenWidth * 0.6,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://t4.ftcdn.net/jpg/04/26/82/93/360_F_426829322_9UdfjbRtK7lDhi4mKWI9sGMgBNN70odz.jpg',
                      width: double.infinity,
                      height: screenWidth * 0.6,
                      fit: BoxFit.cover,
                    ),
                  ),
            SizedBox(height: screenWidth * 0.04),
            Text(
              widget.article['title'],
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: screenWidth * 0.03),
            Text(
              widget.article['publishedAt'],
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: screenWidth * 0.05),
            Divider(color: Colors.blue[200]),
            SizedBox(height: screenWidth * 0.03),
            Text(
              widget.article['content'] ?? 'Content not available',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
