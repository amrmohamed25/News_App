import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/news_state.dart';
import 'package:news_app/shared/components/components.dart';

class Search extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: defaultFormField(
                    onchange: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    controller: searchController,
                    label: "Search",
                    keyType: TextInputType.text,
                    validate: (value) {
                      if (value.isEmpty) {
                        return "search can't be empty";
                      }
                      return null;
                    },
                    prefix: Icons.search),
              ),
              Expanded(child: articleBuilder(list, context, true))
            ],
          ),
        );
      },
    );
  }
}
