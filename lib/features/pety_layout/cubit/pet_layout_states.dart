

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pety/features/pety_layout/cubit/pet_layout_states.dart';
part 'pet_layout_states.freezed.dart';

@Freezed()
class PetLayoutStates<T> with _$PetLayoutStates<T>{
  const factory PetLayoutStates.initial() = _Initial;
  const factory PetLayoutStates.changeBottomNavIndexState() = PetLayoutChangeBottomNavIndexState;
  // chatBot states
  const factory PetLayoutStates.loadChatBotMessages() = LoadingChatBotMessages;
  const factory PetLayoutStates.successChatBotMessages() = SuccessChatBotMessages;
  const factory PetLayoutStates.errorChatBotMessages({required String error}) = ErrorChatBotMessages;
  const factory PetLayoutStates.loadClearMessages() = LoadingClearMessages;
  const factory PetLayoutStates.successClearMessages() = SuccessClearMessages;
  const factory PetLayoutStates.loadAllowAnimatedText() = LoadingAllowAnimatedText;
  const factory PetLayoutStates.successAllowAnimatedText() = SuccessAllowAnimatedText;
  // find my pet states
  const factory PetLayoutStates.loadChangeLocation() = LoadingChangeLocation;
  const factory PetLayoutStates.successChangeLocation() = SuccessChangeLocation;
  const factory PetLayoutStates.loadGetLocations() = LoadingGetLocations;
  const factory PetLayoutStates.successGetLocations() = SuccessGetLocations;
  const factory PetLayoutStates.loadPetImage() = LoadingPetImage;
  const factory PetLayoutStates. successPetImage() = SuccessPetImage;
  const factory PetLayoutStates.loadRegisterPet() = LoadingRegisterPet;
  const factory PetLayoutStates.successRegisterPet() = SuccessRegisterPet;
  const factory PetLayoutStates.errorRegisterPet({required String error}) = ErrorRegisterPet;
  const factory PetLayoutStates.loadFindPet() = LoadingFindPet;
  const factory PetLayoutStates.successFindPet(T data) = SuccessFindPet<T>;
  const factory PetLayoutStates.errorFindPet({required String error}) = ErrorFindPet;


}