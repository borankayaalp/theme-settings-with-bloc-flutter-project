import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/theme_cubit.dart';

class BrighnessListTileWidget extends StatelessWidget {
  const BrighnessListTileWidget({required this.title, Key? key})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return ListTile(
          title: Text(title),
          trailing: Switch(
            value: state.appBrightness,
            onChanged: (bool newValue) {
              BlocProvider.of<ThemeCubit>(context)
                  .onChangedThemeBrightness(newValue);
            },
          ),
        );
      },
    );
  }
}
