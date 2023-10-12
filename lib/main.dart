import 'package:bloc_carts/Carts.dart';
import 'package:bloc_carts/CartsBloc/carts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Products.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CartsBloc>(
        create: (BuildContext context) => CartsBloc(),
      ),

    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    context.read<CartsBloc>().add(FetchEvent());
    return Scaffold(
      body: BlocBuilder<CartsBloc, CartsState>(
        builder: (context, state) {

          return ListView.builder(
              itemCount: state.cart?.length,
              itemBuilder: (BuildContext context, int index) {
                Carts car = state.cart![index];
                return Card(

                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID: ${car.id}"),
                        Text("USER ID: ${car.userId}"),
                        Container(
                          height: 152,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:car.products?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    color: Colors.lightGreen,
                                    elevation: 10,
                                    child: Column(
                                      children: [
                                        Text("MY CART",style: TextStyle(color: Colors.white),),
                                        Text("product id : ${car.products?[index].id}"),
                                        Text("title : ${car.products?[index].title}"),
                                        Text("price : ${car.products?[index].price}"),
                                        Text("qty : ${car.products?[index].quantity}"),
                                        Text("total : ${car.products?[index].total}"),
                                        Text("Discount% : ${car.products?[index].discountPercentage}"),
                                        Text("New Price : ${car.products?[index].discountedPrice}"),

                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Text("Products:${car.products}"),
                        Text("AVAILABLE STOCK: ${car.total}"),
                        Text("BRAND: ${car.totalQuantity}"),
                        Text("RATING: ${car.totalProducts}"),
                        Text("PRICE: ${car.discountedTotal}"),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
