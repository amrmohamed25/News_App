import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc_observer.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/news_state.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/network/local/shared_preferences.dart';
import 'package:news_app/shared/network/remote/dio_remote.dart';
import 'package:news_app/shared/styles/themes.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData('isDark') ?? false;
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  bool? isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return NewsCubit()..getBusiness();
      },
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: NewsCubit.get(context).isDark == true
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: NewsLayout());
        },
      ),
    );
  }
}
