import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Carts.dart';

part 'carts_event.dart';
part 'carts_state.dart';

class CartsBloc extends Bloc<CartsEvent, CartsState> {
  CartsBloc() : super(CartsInitial(cart: [])) {
    on<CartsEvent>((event, emit) async {
      final response =
          await http.get(Uri.parse("https://dummyjson.com/carts"));
      if (response.statusCode == 200) {
        var getCartsData = json.decode(response.body.toString());
        final cartsData = getCartsData['carts'] as List<dynamic>;

        final cartList = cartsData
            .map((RespMain) => Carts.fromJson(RespMain))
            .toList();

        emit (CartsState(cart: cartList));
      } else {
        throw Exception('Failed to load');
      }
    });
  }
}
