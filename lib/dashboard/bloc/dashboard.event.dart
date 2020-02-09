import 'package:flutter/cupertino.dart';

class DashboardEvent {}

class InitEvent extends DashboardEvent {}

class GetVendorEvent extends DashboardEvent {
  final String schoolId;
  final BuildContext context;

  GetVendorEvent(this.schoolId, this.context);
}
