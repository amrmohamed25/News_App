import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/news_state.dart';
import 'package:news_app/shared/components/components.dart';

class Sport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var list = NewsCubit.get(context).sports;
          return list.isNotEmpty
              ? ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildArticleItem(
                        article: list[index], context: context);
                  },
                  separatorBuilder: (context, index) {
                    return buildSeparator();
                  },
                  itemCount: list.length)
              : const Center(child: CircularProgressIndicator());
        });
  }
}
