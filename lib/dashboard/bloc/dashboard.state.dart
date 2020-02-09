import 'package:education_dashboard_example/dashboard/model/service_model.dart';

class DashboardState {}

class InitialState extends DashboardState {}

class ServiceFetchedState extends DashboardState {
  final List<ServiceModel> services;

  ServiceFetchedState(this.services);
}
