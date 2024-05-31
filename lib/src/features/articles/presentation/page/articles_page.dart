import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/data/data_sources/remote/article_api_imp.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/presentation/bloc/bloc/articles_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/network/dio_network.dart';
import '../../../../core/utils/usecases/usecase.dart';
import '../../data/data_sources/remote/abstract_article_api.dart';
import '../../data/repositories/articles_repo_impl.dart';
import '../../domain/repository/abstract_articles_repository.dart';
import '../../domain/usecases/articles_usecase.dart';
import '../widget/article_card_widget.dart';
class ArticlesPage extends StatelessWidget {
  const ArticlesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (BuildContext context, ArticlesState state) {
        if (state is ArticlesLoadingState) {
          return Center(
            child: Column(
              children: [Text('Loadinggggg')],
            ),
          );
        } else if (state is SuccessGetArticlesState) {
          return ListView.builder(
                      itemCount: state.articles.length,
                      itemBuilder: (context, index) {
                        return ArticleCardWidget(
                          nyTimesModel: state.articles[index],
                        );
                      },
                    );
        } else if (state is ErrorGetArticlesState) {
          return Text('Error getting articles!');
        } else {
          return Text('Error!');
        }
      },
    );
  }
}