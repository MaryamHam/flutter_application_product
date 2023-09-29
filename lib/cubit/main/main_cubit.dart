import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_product/models/product_model.dart';
import 'package:flutter_application_product/screens/cart_screen.dart';
import 'package:flutter_application_product/screens/home_screen.dart';
import 'package:flutter_application_product/screens/login_screen.dart';
import 'package:flutter_application_product/screens/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

   List<ProductModel> products =[]; 

   List<ProductModel> searchProducts = [];

   List<ProductModel> cartProducts = [];


   Dio dio = Dio();


//bottom navigation bar

   int bottomNavigationindex =0;
    List <Widget> screens = [
      HomeScreen(),
      SearchScreen(),
      CartScreen(),
      //CartScreen(products: [])

    ];

  void changeButton({required int value}){
    bottomNavigationindex = value;
    
    emit(bottomNavigateState());

  }


//show all products
   void getProducts() {
    emit(GetProductLoading());
    dio.get("https://fakestoreapi.com/products").then((value) {
      if (value.statusCode == 200) {
        for (var element in value.data) {
          products.add(ProductModel.fromJson(element));
        }

        emit(GetProductSuccess());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetProductError());
    });
  }
  


//search about product
  void searchProduct(String text) {
    searchProducts = products
        .where((element) =>
            element.title!.toLowerCase().contains(text.toLowerCase()))
        .toList();

    emit(SearchProductState());
  }
  

//add to cart
  void addToCart(String text) async{

  SharedPreferences prefs = await SharedPreferences.getInstance();

   if(prefs.containsKey(text)){
    cartProducts = products
   .where((element) => element.title!.toLowerCase().contains(text.toLowerCase())).toList();

   
  
   }


  //   cartProducts = products
  //  .where((element) => element.title!.toLowerCase().contains(text.toLowerCase())).toList();
  
  //  for (var element in products) {
  //   if( prefs.containsKey(element.title!)){
  //     cartProducts.add(element);
    
  //   }
  //  }

   emit(AddProductToCartState());

  }



  // void addPr(ProductModel product){

  //   List<ProductModel> currentCart = [];
  //   currentCart.add(product);
  //    emit(AddProductToCartState());

  // }



}
