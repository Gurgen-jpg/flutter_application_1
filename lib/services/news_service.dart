import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/news_response.dart';
import 'package:flutter_application_1/models/pagination_response.dart';
import 'package:retrofit/retrofit.dart';

part 'news_service.g.dart';

@RestApi(baseUrl: 'https://api.spaceflightnewsapi.net')
abstract class NewsService {
 factory NewsService(Dio dio) = _NewsService;

@GET('/v4/articles/')
Future<PaginationResponse<NewsResponse>> getNews();

}