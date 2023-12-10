import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/news.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 58),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [
            Container(
              height: 235,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        news.imageUrl!),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 8),
              child: Text(
                news.title,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: MaterialButton(
                onPressed: () {},
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                elevation: 1,
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Text('Back to instance')]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
