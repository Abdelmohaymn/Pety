

import 'package:freezed_annotation/freezed_annotation.dart';
part 'community_states.freezed.dart';

@Freezed()
class CommunityStates<T> with _$CommunityStates<T>{
  const factory CommunityStates.initial() = _Initial;
  const factory CommunityStates.loadImage() = ImageLoad;
  const factory CommunityStates.successImage() = ImageSuccess;

  const factory CommunityStates.loadAddPost() = LoadAddPost;
  const factory CommunityStates.successAddPost() = SuccessAddPost;
  const factory CommunityStates.errorAddPost({required String error}) = ErrorAddPost;

  const factory CommunityStates.loadProfileImage() = LoadProfileImage;
  const factory CommunityStates.successProfileImage() = SuccessProfileImage;

  const factory CommunityStates.loadGetPosts() = LoadGetPosts;
  const factory CommunityStates.successGetPosts() = SuccessGetPosts;
  const factory CommunityStates.errorGetPosts({required String error}) = ErrorGetPosts;

}