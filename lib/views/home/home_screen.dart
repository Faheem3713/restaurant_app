import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_1/constants/app_constants.dart';
import '../../controllers/data_services.dart';
import 'home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final resData = ref.watch(restaurantProvider);
          return resData.when(
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final val = data[index];
                return HomeCard(
                  restaurant: val,
                );
              },
            ),
            error: (error, stackTrace) => const Center(
              child: Text('error'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
