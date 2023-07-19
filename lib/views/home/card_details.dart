import 'package:flutter/material.dart';
import 'package:task_1/constants/app_constants.dart';
import 'package:task_1/models/restaurant_model.dart';
import 'package:task_1/views/home/widgets/rating.dart';
import 'package:task_1/views/map.dart';
import 'home_card.dart';
import 'widgets/review_card.dart';

class RestaurantDetails extends StatelessWidget {
  const RestaurantDetails({super.key, required this.restaurant});
  final Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: primaryColor),
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
              child: SubTitleWidget(
                  text: 'Wednesday:  ${restaurant.operatingHours['Wednesday']}',
                  icon: Icons.access_time_filled)),
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
