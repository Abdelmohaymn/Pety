

import 'package:freezed_annotation/freezed_annotation.dart';
part 'pet_layout_states.freezed.dart';

@Freezed()
class PetLayoutStates with _$PetLayoutStates{
  const factory PetLayoutStates.initial() = _Initial;
  const factory PetLayoutStates.changeBottomNavIndexState() = PetLayoutChangeBottomNavIndexState;
  const factory PetLayoutStates.loadChatBotMessages() = LoadingChatBotMessages;
  const factory PetLayoutStates.successChatBotMessages() = SuccessChatBotMessages;
  const factory PetLayoutStates.errorChatBotMessages({required String error}) = ErrorChatBotMessages;
  const factory PetLayoutStates.loadClearMessages() = LoadingClearMessages;
  const factory PetLayoutStates.successClearMessages() = SuccessClearMessages;
  const factory PetLayoutStates.loadAllowAnimatedText() = LoadingAllowAnimatedText;
  const factory PetLayoutStates.successAllowAnimatedText() = SuccessAllowAnimatedText;
}