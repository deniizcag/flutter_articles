import 'package:dio/dio.dart';
import 'package:flutter_bloc_dio_articles/src/core/network/error/dio_error_handler.dart';
import 'package:flutter_bloc_dio_articles/src/core/network/error/exceptions.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/data/data_sources/remote/abstract_article_api.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/domain/models/article_model.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/domain/models/article_params.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/domain/models/article_response_model.dart';

const String apiUrl = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/";
const String apiKey = "WiRqmPm4mBO4ssOsQL7uWDS0lJO4KviJ";

String getApiKeyPath() {
  return "?api-key=$apiKey";
}

String getArticlePath(int period) {
  return "all-sections/${period.toString()}.json${getApiKeyPath()}";
}

class ArticleApiImp extends AbstractArticleApi {
  final Dio dio;

  CancelToken cancelToken = CancelToken();

  ArticleApiImp(this.dio);

  @override
  Future<ApiResponse<List<ArticleModel>>> getArticles(
      ArticlesParams params) async {
    try {
      final result = (await dio.get(getArticlePath(params.period)));
      if (result.data == null) {
        throw ServerException("Unknown Error", result.statusCode);
      }
      return ApiResponse.fromJson<List<ArticleModel>>(
          result.data, ArticleModel.fromJsonList);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
