import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/news_state.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/sports/sport.dart';
import 'package:news_app/shared/network/local/shared_preferences.dart';
import 'package:news_app/shared/network/remote/dio_remote.dart';



class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List titles = ["Business", "Sports", "Science", "Settings"];

  List screens = [Business(), Sport(), Science()];

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];

  void setIndex(index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavBarState());
  }

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: '/v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'b1b94dcee3984948801fddb3917ea7e2'
    }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url: '/v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'b1b94dcee3984948801fddb3917ea7e2'
    }).then((value) {
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: '/v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'b1b94dcee3984948801fddb3917ea7e2'
    }).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  bool isDark = false;

  void changeThemeMode([bool? fromShared]) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeThemeMode());
    } else {
      isDark = !isDark;
      CacheHelper.setBoolean(key: 'isDark', value: isDark)
          .then((value) => emit(NewsChangeThemeMode()));
    }
  }

  List<dynamic> search = [];

  void getSearch(value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: '/v2/everything', query: {
      'q': '$value',
      'apiKey': 'b1b94dcee3984948801fddb3917ea7e2'
    }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
