import 'package:education_dashboard_example/dashboard/bloc/dashboard.bloc.dart';
import 'package:education_dashboard_example/dashboard/bloc/dashboard.event.dart';
import 'package:education_dashboard_example/dashboard/bloc/dashboard.state.dart';
import 'package:education_dashboard_example/dashboard/model/service_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/bottom_navigation_item.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<BottomNavigationItemModel> bottomItems = List();
  DashboardBloc dashboardBloc;

  @override
  void initState() {
    super.initState();
    bottomItems.add(BottomNavigationItemModel(Icons.send, "Messages", ""));
    bottomItems.add(BottomNavigationItemModel(Icons.search, "Search", ""));
    bottomItems.add(BottomNavigationItemModel(Icons.home, "Home", ""));
    bottomItems
        .add(BottomNavigationItemModel(Icons.person_outline, "Directory", ""));
    bottomItems.add(BottomNavigationItemModel(Icons.today, "Schedule", ""));
    dashboardBloc = BlocProvider.of<DashboardBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
          if (state is ServiceFetchedState) {
            List<ServiceModel> services = state.services;
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Dashboard",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 48,
                        width: 48,
                        child: new Stack(
                          children: <Widget>[
                            new IconButton(
                                icon: Icon(
                                  Icons.notifications_none,
                                  size: 32,
                                ),
                                onPressed: () {}),
                            new Positioned(
                              right: 10,
                              top: 8,
                              child: new Container(
                                padding: EdgeInsets.all(2),
                                decoration: new BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 12,
                                  minHeight: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 48,
                        width: 48,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: GridView.builder(
                      padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16),
                      shrinkWrap: true,
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                dashboardBloc
                                    .add(GetVendorEvent("SCH-1", context));
                              },
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16, left: 16, right: 16),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                          services[index].icon,
                                          height: 96,
                                          width: 72,
                                        ),
                                        Text(services[index].title,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          services[index].subTitle,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black38,fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            services[index].hasUnReadNotification
                                ? Positioned(
                                    top: -4,
                                    right: -4,
                                    child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red),
                                    ),
                                  )
                                : SizedBox()
                          ],
                        );
                      }),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: 2,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: List.generate(
              bottomItems.length,
              (index) => BottomNavigationBarItem(
                    activeIcon: Icon(
                      bottomItems[index].icon,
                      color: Colors.grey,
                    ),
                    icon: Icon(bottomItems[index].icon),
                    title: Text(bottomItems[index].text),
                  ))),
    );
  }
}
