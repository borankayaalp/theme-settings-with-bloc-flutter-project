import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_bloc/logic/cubit/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                BlocProvider.of<ThemeCubit>(context).state.seedColor,
                BlendMode.srcATop),
            child: const FlutterLogo(
              size: 100,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,
                width: 50,
                color: Theme.of(context).primaryColor,
              ),
              Container(
                height: 50,
                width: 50,
                color: Theme.of(context).primaryColor
              ),
              Container(
                height: 50,
                width: 50,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),
          ),
          SizedBox(
            height: 50,
            child: TextButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),
          ),
        ],
      ),
    );
  }
}
