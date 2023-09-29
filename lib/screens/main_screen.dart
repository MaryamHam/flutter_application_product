import 'package:flutter/material.dart';
import 'package:flutter_application_product/cubit/main/main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = MainCubit.get(context);

    //  cubit.navigatorFun(MainCubit.get(context).index);

    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: cubit.screens[cubit.bottomNavigationindex],
          bottomNavigationBar: BlocConsumer<MainCubit, MainState>(
            listener: (context, state) {},
            builder: (context, state) {
              return BottomNavigationBar(
                  currentIndex: cubit.bottomNavigationindex,
                  type: BottomNavigationBarType.fixed,
                  onTap: (value) {
                    cubit.changeButton(value: value);
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home,color: Colors.black,), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search,color: Colors.black,), label: "Search"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart,color: Colors.black,), label: "Cart"),
                  ]);
            },
          ),
        );
      },
    );
  }
}
