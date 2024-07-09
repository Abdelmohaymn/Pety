


import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pety/features/community/add_post_screen/models/add_post_request.dart';
import 'package:pety/features/community/community_screen/models/get_posts_response.dart';
import 'package:pety/features/community/community_screen/models/post_votes_body.dart';
import 'package:pety/features/community/shared/cubit/community_states.dart';
import 'package:pety/features/community/shared/data/repository/community_repository.dart';
import 'package:pety/shared/extensions.dart';
import 'package:pety/shared/network/local/shared_pred_constants.dart';
import 'package:pety/shared/network/local/shared_pref_helper.dart';

class CommunityCubit extends Cubit<CommunityStates>{

  final CommunityRepository _communityRepository;
  CommunityCubit(this._communityRepository) : super(const CommunityStates.initial());


  File? postImageFile;
  TextEditingController postController = TextEditingController();
  String? profileImage;
  String? userId;

  void getUserData() async{
    emit(const CommunityStates.loadProfileImage());
    User user = User.fromJson(jsonDecode(SharedPrefHelper.getData(key: SharedPrefConstants.userData)));
    profileImage = user.photo!.url;
    userId = user.id;
    emit(const CommunityStates.successProfileImage());
  }

  void pickImage() async{
    emit(const CommunityStates.loadImage());
    postImageFile = await _communityRepository.pickImage();
    emit(const CommunityStates.successImage());
  }

  void deletePostImage(){
    emit(const CommunityStates.loadImage());
    postImageFile=null;
    emit(const CommunityStates.successImage());
  }

  void createPost() async{
    emit(const CommunityStates.loadAddPost());
    if(!postController.text.isNotBlank()){
      emit(const CommunityStates.errorAddPost(error: 'You have to write something'));
      return;
    }
    final response = await _communityRepository.createPost(
      postBody: await AddPostRequest(
          context: postController.text,
          photo: postImageFile
      ).toFormData()
    );
    response.when(
        success: (data){
          posts=null;
          emit(const CommunityStates.successAddPost());
          getPosts();
        },
        failure: (error){
          emit(CommunityStates.errorAddPost(error: error.apiErrorModel.message!));
        }
    );
  }

  void onBackFromAddPost(){
    postController.clear();
    postImageFile=null;
  }

  GetPostsResponse? posts;

  void getPosts() async{
    emit(const CommunityStates.loadGetPosts());
    final response = await _communityRepository.getPosts();
    response.when(
        success: (data){
          posts=data;
          emit(const CommunityStates.successGetPosts());
        },
        failure: (error){
          emit(CommunityStates.errorGetPosts(error: error.apiErrorModel.message!));
        }
    );
  }

  void upVotePost({required int index}) async{
    await _communityRepository.upVotePost(
      voteBody: PostVotesBody(postId: posts!.data![index].id!)
    );
  }

  void downVotePost({required int index}) async{
    await _communityRepository.downVotePost(
        voteBody: PostVotesBody(postId: posts!.data![index].id!)
    );
  }

  void resetVotePost({required int index}) async{
    await _communityRepository.resetVotePost(
        voteBody: PostVotesBody(postId: posts!.data![index].id!)
    );
  }

}