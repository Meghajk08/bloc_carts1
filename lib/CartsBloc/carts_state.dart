part of 'carts_bloc.dart';

class CartsState {
  List<Carts>? cart = [];

  CartsState({required this.cart});
}

class CartsInitial extends CartsState {
  CartsInitial({required super.cart});
}
