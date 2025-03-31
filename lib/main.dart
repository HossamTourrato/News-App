import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/injection_container.dart';

import 'config/theme/app_theme.dart';
import 'features/news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'features/news/presentation/bloc/article/remote/remote_article_event.dart';
import 'features/news/presentation/pages/home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => serviceLocator()..add(const GetArticle()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          // onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const NewsHomePage()
      ),
    );
  }
}


