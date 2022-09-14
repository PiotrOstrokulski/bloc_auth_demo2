import 'package:bloc_auth_demo/views/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth/auth_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {
        if (state is Authorized) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShopPage(),
            ),
          );
        }
        if (state is Unauthorized) {
          loginController.text = '';
          passwordController.text = '';
          // alertdialog - zly login/haslo
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              controller: loginController,
            ),
            TextField(
              controller: passwordController,
            ),
            ElevatedButton(
              //powinno byc asynchroniczne gdyby nie bylo mockiem
              onPressed: () {
                context.read<AuthCubit>().authorize(loginController.text, passwordController.text);
              },
              child: Text('log in'),
            ),
            Text('przykladowy poprawny user - user1'),
            Text('przykladowy poprawny password - pass1'),
          ],
        ),
      ),
    );
  }
}
