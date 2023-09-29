import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_product/cubit/main/main_cubit.dart';
import 'package:flutter_application_product/screens/cart_screen.dart';
import 'package:flutter_application_product/screens/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    var cubit = MainCubit.get(context);
    cubit.getProducts();

   cubit.searchProducts = cubit.products;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, title: Text("HOME"),
      actions: [
        IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ));
              },
              icon: const Icon(Icons.search)),
          IconButton(onPressed: (){
       //   Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen(products: products,)));
          
          }, icon: Icon(Icons.shopping_cart))
        ],
      ),




      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return state is GetProductLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is GetProductError
                  ? const Center(
                      child: Text("Error, try again"),
                    )
                  : GridView.builder(
                    
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      padding: EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        return Card(
 
                           color: Color.fromARGB(255, 168, 196, 196),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             
                              Container(
                                width: 200,
                                height: 100,
                                decoration: BoxDecoration(
                                  border:Border.all(color:Color.fromARGB(255, 41, 79, 79),width: 1.5)),
                                child: Image.network(
                                  cubit.products[index].image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 15,),
                              Text(
                                cubit.products[index].title!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 95, 77, 6),fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              Text(cubit.products[index].category!, style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  Text(cubit.products[index].price!, style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.bold)),
                                  SizedBox(width: 85,),
                                 InkWell(
                                  onTap: () async{

                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      String data = jsonEncode(cubit.products[index].toJson());
                                      prefs.setString(cubit.products[index].title!, data);
                                      
                                     cubit.addToCart(cubit.products[index].title!);


                                  },child: Text("ADD", style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 112, 6, 20),fontWeight: FontWeight.bold),),
                                 )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: cubit.products.length,
                    );
        },
      ),

    
    );
  }
}
