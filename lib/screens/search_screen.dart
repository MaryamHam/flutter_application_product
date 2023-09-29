import 'package:flutter/material.dart';
import 'package:flutter_application_product/cubit/main/main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

  var controller = TextEditingController();


  @override
  Widget build(BuildContext context) {

   var cubit = MainCubit.get(context);
   

    return Scaffold(
     appBar: AppBar(backgroundColor: Colors.black, title: Text("SEARCH")
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height*.02,),
            Container(
              height: MediaQuery.sizeOf(context).height*.05,
              width: MediaQuery.sizeOf(context).width*.9,
              child: SearchBar(
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 151, 148, 148)),
                controller: controller,
                onChanged: (value) {
                  cubit.searchProduct(value);
                },
                trailing: [
                  IconButton(
                      onPressed: () {
                      cubit.searchProduct(controller.text);
                      },
                      icon: const Icon(Icons.search,color: Colors.white,))
                ],
              ),
            ),
             SizedBox(height: MediaQuery.sizeOf(context).height*.01,),
            BlocBuilder<MainCubit, MainState>(
              builder: (context, state) {
                return cubit.searchProducts.isEmpty
                    ? const Center(
                      child: Text("No product match search", style: TextStyle(color: Color.fromARGB(255, 41, 79, 79),fontWeight: FontWeight.bold),))
                    : ListView.builder(
                        itemCount: cubit.searchProducts.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Color.fromARGB(255, 168, 196, 196),

                            child: ListTile(
                              leading: Container(
                                 width: 100,
                                height: 100,
                                 decoration: BoxDecoration(
                                  border:Border.all(color:Color.fromARGB(255, 41, 79, 79),width: 1.5)),
                                child: Image.network(
                                  cubit.searchProducts[index].image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(cubit.searchProducts[index].title!,style: TextStyle(color: Color.fromARGB(255, 51, 88, 88),fontSize: 14,fontWeight: FontWeight.bold),),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(cubit.searchProducts[index].category!,style: TextStyle(color: Colors.black,),),
                                  Text(cubit.searchProducts[index].price!,style: TextStyle(color: Colors.black)),
                                ],
                              ),
                            ),
                          );
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      );
              },
            )
          ],
        ),
      ),


    );
  }
}