import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

const _avatarSize = 48.0;

class Avatar extends StatelessWidget {
  const Avatar({super.key, this.photo});

  final String? photo;

  @override
  Widget build(BuildContext context) {
    if (photo == null) {
      return const CircleAvatar(
        radius: _avatarSize,
        child: Icon(Icons.person_outline, size: _avatarSize),
      );
    }

    return CircleAvatar(
      radius: _avatarSize,
      backgroundColor: Colors.grey[200],
      backgroundImage: null, // we will use child for image
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: photo!,
          width: _avatarSize * 2, 
          height: _avatarSize * 2,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Icon(
            Icons.person_outline,
            size: _avatarSize,
            color: Colors.grey,
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            size: _avatarSize,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
