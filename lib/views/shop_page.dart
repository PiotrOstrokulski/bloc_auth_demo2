import 'package:bloc_auth_demo/cubits/data/data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth/auth_cubit.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  void initState() {
    // bez tokena (zakladajac ze mamy jednorazowa autoryzacje na homepage) wystarczy napisac
    // context.read<DataCubit>().loadData(); zamiast 19-22 linijki
    final state = context.read<AuthCubit>().state;
    if (state is Authorized) {
      context.read<DataCubit>().loadData(state.token);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          if (state is DataLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.products[index].name),
                  leading: Text(state.products[index].price),
                  subtitle: Text(state.products[index].isAvailable.toString()),
                );
              },
            );
          } else
            return Text('abc');
        },
      ),
    );
  }
}
