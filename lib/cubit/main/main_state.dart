part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}


class bottomNavigateState extends MainState{}



class GetProductLoading extends MainState{}

class GetProductSuccess extends MainState{}

class GetProductError extends MainState{}



class SearchProductState extends MainState{}


//add to cart
class AddProductToCartState extends MainState{}

