import 'package:court_pro/core/enums/image_type.dart';
import 'package:court_pro/ui/common/image_widget.dart';
import 'package:court_pro/ui/common/text_widget.dart';
import 'package:court_pro/ui/resources/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../../../../../model/data/genre_model.dart';
import '../../../../../../resources/app_colors.dart';

class CatergoryCard extends StatelessWidget {
  const CatergoryCard({super.key, required this.genre});

  final Genre genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const ImageWidget(
              imageSrc: AppAssets.imgGenre,
              type: ImageType.asset,
              imgHeight: double.infinity,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: TextWidget(
              title: genre.name,
              size: 16,
              weight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
