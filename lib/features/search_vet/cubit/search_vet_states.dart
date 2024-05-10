import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_vet_states.freezed.dart';

@Freezed()
class SearchVetStates<T> with _$SearchVetStates<T> {
  const factory SearchVetStates.initial() = _Initial;
  const factory SearchVetStates.loading() = Loading;
  const factory SearchVetStates.success(T data) = Success<T>;
  const factory SearchVetStates.error({required String error}) = Error;
  const factory SearchVetStates.changeFilterValue() = ChangeFilterValue;
  const factory SearchVetStates.moveToNextScreen() = MoveToNextScreen;
  const factory SearchVetStates.moveToPrevScreen() = MoveToPrevScreen;
  const factory SearchVetStates.loadUserData() = LoadingUserData;
  const factory SearchVetStates.successUserData() = SuccessUserData;
  const factory SearchVetStates.loadAddReview() = LoadingAddReview;
  const factory SearchVetStates.successAddReview() = SuccessAddReview;
  const factory SearchVetStates.errorAddReview({required String error}) = ErrorAddReview;
}
