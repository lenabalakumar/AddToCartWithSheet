part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartLoadingEvent extends CartEvent {}

class CartLoadedEvent extends CartEvent {}

class DecrementEvent extends CartEvent {
  final ItemModel itemFromEvent;

  DecrementEvent({required this.itemFromEvent});
}
