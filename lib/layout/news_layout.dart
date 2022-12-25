import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class NewsLayout extends StatelessWidget
{
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer <NewsCubit, NewsStates> (
      listener: (context, state) {},
      builder: (context, state)
      {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions:
            [
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(context, SearchScreen());
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: ()
                  {
                    NewsCubit.get(context).changeThemeMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined)),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItems,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },
          ),

        );
      },
    );
  }
}
