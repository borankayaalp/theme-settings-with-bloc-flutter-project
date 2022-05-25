import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(const ThemeState(seedColor: Colors.blue, appBrightness: true));

  void onChangedThemeBrightness(bool newBrightness) {
    emit(state.copyWith(appBrightness: newBrightness));
  }

  void onChangedThemeColor(Color newColor) {
    emit(state.copyWith(seedColor: newColor));
  }

}
