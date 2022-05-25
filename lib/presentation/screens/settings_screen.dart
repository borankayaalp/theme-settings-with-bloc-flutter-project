import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/theme_cubit.dart';
import '../widgets/brightness_listtile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color screenPickerColor =
        BlocProvider.of<ThemeCubit>(context).state.seedColor;

    return SafeArea(
      child: Center(
        child: ListView(
          children: [
            const ExpansionTile(
              title: Text('Brightness Setting'),
              children: [
                BrighnessListTileWidget(title: 'Brightness of the App'),
              ],
            ),
            ExpansionTile(
              title: const Text('Main Color Setting'),
              children: [
                ListTile(
                  title: const Text('Selected Color'),
                  subtitle: Text(
                      '${ColorTools.materialNameAndCode(screenPickerColor)}'
                      '\naka '
                      '${ColorTools.nameThatColor(screenPickerColor)}'),
                  trailing: ColorIndicator(
                    height: 50,
                    width: 50,
                    borderRadius: 25,
                    color: screenPickerColor,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ColorPicker(
                    color: screenPickerColor,
                    onColorChanged: (Color color) {
                      BlocProvider.of<ThemeCubit>(context)
                          .onChangedThemeColor(color);
                    },
                    width: 44,
                    height: 44,
                    borderRadius: 22,
                    heading: Text(
                      'Select color',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    subheading: Text(
                      'Select color shade',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
