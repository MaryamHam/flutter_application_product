import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());


static AuthCubit get(context) => BlocProvider.of(context);



  void login(String userName, String password) {

    emit(LoadingLoginState());
    Dio().post("https://fakestoreapi.com/auth/login",data: {
      "username": userName,
      "password":password,
    }).then((value) {

      if(value.statusCode == 200){
      emit(SuccessLoginState());

      }

    }).catchError((error) {
      
      print(error.toString());

      emit(ErrorLoginState());
    });
  }


}
