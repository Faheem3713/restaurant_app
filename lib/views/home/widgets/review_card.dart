import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';
import 'rating.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard(
      {super.key,
      required this.name,
      required this.rating,
      required this.comment,
      required this.date});
  final String name;
  final String comment;
  final String date;
  final String rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RatingWidget(rating: rating),
              kWidth10,
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Text(
            comment,
            overflow: TextOverflow.visible,
          ),
          kHeight10,
          Text(
            date,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider()
        ],
      ),
    );
  }
}
