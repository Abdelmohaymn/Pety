
/*
abstract class PetLayoutStates {}

class PetLayoutInitialState extends PetLayoutStates{}

class PetLayoutChangeBottomNavIndexState extends PetLayoutStates{}*/


import 'package:freezed_annotation/freezed_annotation.dart';
part 'pet_layout_states.freezed.dart';

@Freezed()
class PetLayoutStates with _$PetLayoutStates{
  const factory PetLayoutStates.initial() = _Initial;
  const factory PetLayoutStates.changeBottomNavIndexState() = PetLayoutChangeBottomNavIndexState;
}