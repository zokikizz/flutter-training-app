import 'package:flutter/material.dart';
import 'package:empty_widget/empty_widget.dart';



class EmptyListWidget extends StatelessWidget {

  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:EmptyWidget(
        image: null,
        packageImage: PackageImage.Image_3,
        title: 'Currently this list is empty',
        subTitle: null,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          color: Color(0xff9da9c7),
          fontWeight: FontWeight.w500,
        ),
        subtitleTextStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xffabb8d6),
        ),
      )
    );
  }

}