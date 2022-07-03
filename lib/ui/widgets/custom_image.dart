import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app_case_study/core/constants/app_constant.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final BoxFit fit;
  const CustomImage({required this.image, required this.height, required this.width, this.fit = BoxFit.cover ,  Key? key,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: image, height: height, width: width, fit: fit,
        placeholder: (context, url) => Image.asset(AppConstants.placeholder, height: height, width: width, fit: fit),
        errorWidget: (context, url, error) => Image.asset(AppConstants.placeholder, height: height, width: width, fit: fit),
      ),
    );
  }
}
