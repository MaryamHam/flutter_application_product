import 'package:flutter/material.dart';
import 'package:flutter_application_product/cubit/auth/auth_cubit.dart';
import 'package:flutter_application_product/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  var userNameController = TextEditingController();
   var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.sizeOf(context).width * .93,
          height: MediaQuery.sizeOf(context).height * .8,
          margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * .03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .04,
              ),
              TextFormField(
                controller: userNameController,
                  decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 158, 160, 161),
                hintText: "User Name",
                hintStyle: TextStyle(color: Colors.black),
              )),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .04,
              ),
              TextFormField(
                controller: passwordController,
                 decoration: InputDecoration(
                filled: true,
                fillColor:const Color.fromARGB(255, 158, 160, 161),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.black),
              )),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .04,
              ),





              Container(
                width: MediaQuery.sizeOf(context).width * .5,
                height: MediaQuery.sizeOf(context).height * .05,
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if(state is ErrorLoginState){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Error Please try again")) );
                    }else if(state is SuccessLoginState){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>const HomeScreen(),));
                    }

                
                  },
                  builder: (context, state) {
                    return state is LoadingLoginState
                  ? const CircularProgressIndicator(): ElevatedButton(
                        style:const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: HomeScreen()));
                          AuthCubit.get(context)
                              .login(userNameController.text,passwordController.text);
                        },
                        child:const Text(
                          "Login",
                        )
                        );
                  },
                  
                
                  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
