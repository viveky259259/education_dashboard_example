import 'package:education_dashboard_example/dashboard/bloc/dashboard.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard/dashboard.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<DashboardBloc>(
            create: (BuildContext context) => DashboardBloc(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: TextTheme(
              display1: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//             display1:
            ),
            primarySwatch: Colors.blue,
          ),
          home: DashboardScreen(),
        ));
  }
}
