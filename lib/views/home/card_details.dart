import 'package:flutter/material.dart';
import 'package:task_1/constants/app_constants.dart';
import 'package:task_1/models/restaurant_model.dart';
import 'package:task_1/views/home/home_screen.dart';
import 'package:task_1/views/map.dart';

class RestaurantDetails extends StatelessWidget {
  const RestaurantDetails({super.key, required this.restaurant});
  final Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FindMap(latlng: restaurant.latlng),
              ));
        },
        child: const Icon(Icons.location_on_outlined),
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HomeCard(restaurant: restaurant)),
          SliverToBoxAdapter(
              child: subtitleText(
                  'Wednesday:' + restaurant.operatingHours['Wednesday'],
                  Icons.access_time_filled)),
          SliverToBoxAdapter(
            child: Text(
              'Rating & Reviews',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: restaurant.reviews.length, (context, index) {
            return ReviewCard(
                rating: restaurant.rating,
                name: restaurant.reviews[index].name,
                comment: restaurant.reviews[index].comments,
                date: restaurant.reviews[index].date);
          }))
        ],
      )),
    );
  }
}

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
