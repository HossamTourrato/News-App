import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/article/remote/remote_article_bloc.dart';
import '../bloc/article/remote/remote_article_state.dart';
import '../widget/widgets.dart';

class NewsHomePage extends StatelessWidget {
  const NewsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
      body: buildBody() ,
    );
  }

  buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(
            color: Colors.black
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.search_outlined, color: Colors.deepOrange),
          ),
        ),
      ],
    );
  }

  buildBody() {
    return BlocBuilder<RemoteArticleBloc,RemoteArticleState> (
      builder: (_,state) {
        if (state is RemoteArticleLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticleError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticleFetched) {

           return ListView.builder(
            itemBuilder: (context,index){
              return ArticleWidget(
                article: state.articles![index] ,
                onArticlePressed: (article) => (){},
              );
            },
            itemCount: state.articles!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}