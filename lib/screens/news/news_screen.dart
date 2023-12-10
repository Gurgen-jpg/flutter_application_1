import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/news/news_bloc.dart';
import 'package:flutter_application_1/models/news.dart';
import 'package:flutter_application_1/screens/news_details/news_details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'All news',
            style: TextStyle(
              fontSize: 20,
            ),
          )),
      body: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
        return switch (state) {
          final NewsFailure state => Text('error'),
          final NewsInitial state => const SizedBox.shrink(),
          final NewsLoading state => Center(
              child: CircularProgressIndicator(),
            ),
          final NewsSuccess state => ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                final newsItem = state.news[index];

                return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              NewsDetailsScreen(news: newsItem),
                        ),
                      );
                    },
                    leading: newsItem.imageUrl != null
                        ? Container(
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(newsItem.imageUrl!))),
                          )
                        : SizedBox.shrink(),
                    title: Text(
                      newsItem.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(newsItem.description, maxLines: 2));
              })
        };
      }),
    );
  }
}
