import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsio/components/bottomsheet.dart';
import 'package:newsio/components/components.dart';
import 'package:newsio/utils/colors.dart';
import 'package:newsio/utils/text.dart';

class NewsBox extends StatefulWidget {
  final String imageurl, title, time, description, url;
  const NewsBox(
      {Key? key,
      required this.imageurl,
      required this.title,
      required this.time,
      required this.description,
      required this.url})
      : super(key: key);

  static bool open = false;

  @override
  State<NewsBox> createState() => _NewsBoxState();
}

class _NewsBoxState extends State<NewsBox> {
  @override
  Widget build(BuildContext context) {
    // var h = MediaQuery.of(context).size.height;

    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              NewsBox.open = true;
            });
            showMyBottomSheet(context, widget.title, widget.description,
                widget.imageurl, widget.url);
          },
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 5, right: 5, top: 5),
            width: w,
            color: AppColors.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.imageurl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow),
                  ),
                  placeholder: (context, url) =>
                      CircularProgressIndicator(color: AppColors.primary),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      modifiedText(
                          color: AppColors.white, size: 16, text: widget.title),
                      SizedBox(height: 5),
                      modifiedText(
                          color: AppColors.lightwhite,
                          size: 12,
                          text: widget.time),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        DividerWidget(),
      ],
    );
  }
}
