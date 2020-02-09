class ServiceModel {
  String _title;
  String _subTitle;
  String _icon;
  bool _hasUnReadNotification;
  String _pageRouteName;

  ServiceModel(this._title, this._subTitle, this._icon,
      this._hasUnReadNotification, this._pageRouteName);

  String get pageRouteName => _pageRouteName;

  set pageRouteName(String value) {
    _pageRouteName = value;
  }

  bool get hasUnReadNotification => _hasUnReadNotification;

  set hasUnReadNotification(bool value) {
    _hasUnReadNotification = value;
  }

  String get icon => _icon;

  set icon(String value) {
    _icon = value;
  }

  String get subTitle => _subTitle;

  set subTitle(String value) {
    _subTitle = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}
