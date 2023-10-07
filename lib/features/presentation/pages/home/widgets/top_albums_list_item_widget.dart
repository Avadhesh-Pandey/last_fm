import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_fm/features/data/model/topalbums_model.dart';
import 'package:last_fm/features/data/model/topalbums_model.dart' as img;

class TopAlbumsListItemWidget extends StatelessWidget {
  final Album album;

  const TopAlbumsListItemWidget(this.album, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CachedNetworkImage(
          width: 120.w,
          height: 120.h,
          imageUrl: getImage(album.image),
          placeholder: (context, url) => const Icon(Icons.music_note_outlined),
          errorWidget: (context, url, error) => const Icon(Icons.music_off_outlined),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            album.name ?? "",
            maxLines: 3,
            style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              getTotalPlays(album.playcount),
              maxLines: 1,
              style: TextStyle(
                fontSize: 10.sp,
              ),
            ),
            Icon(
              Icons.play_arrow_rounded,
              size: 10.h,
            )
          ],
        ),
      ],
    );
  }

  String getTotalPlays(num? playcount) {
    if (playcount != null && playcount > 0) {
      if (playcount > 1000) {
        return "Over ${(album.playcount! / 1000).floor()} K plays";
      } else {
        return "Over ${(album.playcount)} plays";
      }
    }
    return "";
  }

  String getImage(List<img.Image>? image) {
    String img = "";
    if (image != null && image.isNotEmpty) {
      if (image.length > 2) {
        img = image[2].text ?? "";
      } else {
        img = image.last.text ?? "";
      }
    }

    return img;
  }
}
