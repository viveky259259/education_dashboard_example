import 'package:education_dashboard_example/common/model/vendor.model.dart';
import 'package:education_dashboard_example/common/repository/api.dart';
import 'package:education_dashboard_example/dashboard/bloc/dashboard.event.dart';
import 'package:education_dashboard_example/dashboard/bloc/dashboard.state.dart';
import 'package:education_dashboard_example/dashboard/model/service_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() {
    this.add(InitEvent());
  }

  @override
  DashboardState get initialState => InitialState();

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is InitEvent) {
      List<ServiceModel> services = List();
      services.add(ServiceModel(
          "Graduation",
          "Graduation services\nand information",
          "assets/icons/graduation_cap_icon.png",
          true,
          "graduation"));
      services.add(ServiceModel("Calender", "Academic annual calender",
          "assets/icons/calendar_icon.png", false, "graduation"));
      services.add(ServiceModel(
          "Campus Safety",
          "Information on campus\nsafety and security",
          "assets/icons/campus_safety_icon.png",
          false,
          "graduation"));
      services.add(ServiceModel(
          "Watercooler",
          "Online discussions on\nschool and general",
          "assets/icons/watercooler_icon.png",
          true,
          "graduation"));
      services.add(ServiceModel(
          "Tutoring Services",
          "Find a tutor or offer your\ntutoring services",
          "assets/icons/tutoring_service_icon.png",
          false,
          "graduation"));
      services.add(ServiceModel(
          "Book Store",
          "Browse and buy books\nfor your classes",
          "assets/icons/book_store.png",
          false,
          "graduation"));

      yield ServiceFetchedState(services);
    }
    if (event is GetVendorEvent) {
      List<VendorModel> vendors =
          await CommonApi().getVendorsBySchoolId(event.schoolId);
      if (vendors != null)
        showDialog(
            context: event.context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))
              ),
                title: Text("Vendor List"),
                content: vendors.length > 0
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                            vendors.length,
                            (index) => ListTile(
                                  title: Text(vendors[index].vendorName),
                                  subtitle: Text(vendors[index].material),
                                )),
                      )
                    : Text("No vendors")));
    }
  }
}
