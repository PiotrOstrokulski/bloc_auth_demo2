import 'package:bloc_auth_demo/cubits/auth/auth_cubit.dart';
import 'package:bloc_auth_demo/cubits/data/data_cubit.dart';
import 'package:bloc_auth_demo/get_it.dart';
import 'package:bloc_auth_demo/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServices();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DataCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'bloc auth demo',
        home: HomePage(),
      ),
    );
  }
}
