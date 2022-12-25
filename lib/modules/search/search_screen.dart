import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget
{

  SearchScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer <NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).search;
        return Scaffold(
        appBar: AppBar(),
        body: Column(
          children:
          [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (value)
                  {
                    if (value!.isEmpty)
                    {
                      return 'Search must not be Empty';
                    }
                    return null;
                  },
                  labelText: 'Search',
                  prefixIcon: Icons.search
              ),
            ),
            Expanded(child: articleBuilder(list, context, isSearch: true)),
          ],
        ),
      );
      }
    );
  }
}
