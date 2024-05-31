import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dio_articles/src/core/network/dio_network.dart';
import 'package:flutter_bloc_dio_articles/src/core/utils/usecases/usecase.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/data/data_sources/remote/abstract_article_api.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/data/data_sources/remote/article_api_imp.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/data/repositories/articles_repo_impl.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/domain/repository/abstract_articles_repository.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/domain/usecases/articles_usecase.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/presentation/bloc/bloc/articles_bloc.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/presentation/page/articles_page.dart';
import 'package:provider/provider.dart';

void main() {
  DioNetwork.initDio();
  runApp(App());
}
class App extends StatelessWidget {
  const App({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ArticleApiImp>(
          create: (_) => ArticleApiImp(DioNetwork.appAPI),
        ),
        Provider<AbstractArticlesRepository>(
          create: (context) => ArticlesRepositoryImp(
              Provider.of<ArticleApiImp>(context, listen: false)),
        ),
        Provider<ArticlesUseCase>(
          create: (context) => ArticlesUseCase(
              Provider.of<AbstractArticlesRepository>(context, listen: false)),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ArticlesBloc>(
            create: (context) {
              return ArticlesBloc(
                Provider.of<ArticlesUseCase>(context, listen: false),
              )..add(const OnGettingArticlesEvent("s", 1));
            },
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Timer',
          theme: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Color.fromRGBO(72, 74, 126, 1),
            ),
          ),
          home: const ArticlesPage(),
        ),
      ),
    );
  }
}
