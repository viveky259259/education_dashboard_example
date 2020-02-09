import 'package:flutter/material.dart';

class BottomNavigationItemModel {
  IconData _icon;
  String _text;
  String _navigationScreen;

  BottomNavigationItemModel(this._icon, this._text, this._navigationScreen);

  String get navigationScreen => _navigationScreen;

  set navigationScreen(String value) {
    _navigationScreen = value;
  }

  String get text => _text;

  set text(String value) {
    _text = value;
  }

  IconData get icon => _icon;

  set icon(IconData value) {
    _icon = value;
  }
}
