import 'package:flutter/material.dart';
import 'package:task_1/views/home/widgets/rating.dart';

import '../../models/restaurant_model.dart';
import 'card_details.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantDetails(restaurant: restaurant),
            ));
      },
      child: Card(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/image/restaurants.png',
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  RatingWidget(
                    rating: restaurant.rating,
                  )
                ],
              ),
            ),
            SubTitleWidget(
                text: restaurant.cuisineType, icon: Icons.close_rounded),
            SubTitleWidget(text: restaurant.address, icon: Icons.location_on)
          ],
        ),
      ),
    );
  }
}
