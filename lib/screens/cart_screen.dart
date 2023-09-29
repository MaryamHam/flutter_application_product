import 'package:flutter/material.dart';
import 'package:flutter_application_product/cubit/main/main_cubit.dart';
import 'package:flutter_application_product/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  CartScreen({
    super.key,
    // required this.products

  });

 // List <ProductModel> products ;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = MainCubit.get(context);
    //cubit.getProducts();
    
      
    var cartProducts = cubit.cartProducts;
   
    // cubit.addToCart();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("CART"),
      ),


       body: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
         
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            child: ListView.builder(
                itemCount: cartProducts.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 7, left: 16, right: 16),
                    child: Card(
                      color: Color.fromARGB(255, 168, 196, 196),
                      child: ListTile(
                         leading: CircleAvatar(
                          backgroundImage: NetworkImage( cartProducts[index].image!),
                         
                         ),
                        
                        title: Text(
                          cartProducts[index].title!,
                          style: TextStyle(
                              color: Color.fromARGB(255, 63, 40, 58),
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          cartProducts[index].price!.toString(),
                          style: TextStyle(
                            color: Color.fromARGB(255, 63, 40, 58),
                          ),
                        ),

                        // trailing: InkWell(
                        //   onTap: () async {
                        //      SharedPreferences prefs = await SharedPreferences.getInstance();
                        //     prefs.remove(cartProducts[index].title!);
                        //     cartProducts.remove(cartProducts[index]);
                        //   },

                        //   child: Text("Remove from cart",style: TextStyle(color: Color.fromARGB(255, 115, 30, 123)),),
                        // ),
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
