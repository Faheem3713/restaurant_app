import 'package:flutter/material.dart';
import 'package:task_1/models/restaurant_model.dart';
import 'package:task_1/views/home/card_details.dart';

import '../../services/data_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: DataServices.instance.restaurantNotifier,
        builder: (context, value, _) {
          return value.isNotEmpty
              ? ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return HomeCard(
                      restaurant: value[index],
                    );
                  },
                )
              : const SizedBox();
        },
      ),
    );
  }
}

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
            subtitleText(restaurant.cuisineType, Icons.close_rounded),
            subtitleText(restaurant.address, Icons.location_on)
          ],
        ),
      ),
    );
  }
}

Widget subtitleText(String text, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Icon(icon, color: Colors.black54),
        Text(
          text,
          style: const TextStyle(color: Colors.black54, fontSize: 16),
        ),
      ],
    ),
  );
}

class RatingWidget extends StatelessWidget {
  RatingWidget({super.key, required this.rating});
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(5),
      child: Text('★$rating'),
    );
  }
}
