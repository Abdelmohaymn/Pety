
import 'package:flutter/material.dart';

class CircleAvatarDefaultImage extends StatelessWidget{
  String? imageUrl;
  double? radius;
  CircleAvatarDefaultImage({
    super.key,
    this.imageUrl,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius??30,
      backgroundImage: getImage(imageUrl),
    );
  }

  ImageProvider getImage(String? image){
    if(image!=null){
      return NetworkImage(image);
    }
    return const AssetImage('assets/images/default_vet_image.jpg');
  }

}