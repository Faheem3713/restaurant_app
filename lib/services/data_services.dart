import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_1/models/restaurant_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  DataServices._privateConstructor();
  static final instance = DataServices._privateConstructor();
  ValueNotifier<List<Restaurant>> restaurantNotifier = ValueNotifier([]);
  static const String dbName = 'emailDb';
  void getData() async {
    const String url =
        'https://run.mocky.io/v3/b91498e7-c7fd-48bc-b16a-5cb970a3af8a';

    final response = await http.get(Uri.parse(url));

    final result = (json.decode(response.body)['restaurants'] as List)
        .map((e) => Restaurant.fromJson(e))
        .toList();

    restaurantNotifier.value.addAll(result);
  }

  void addEmail(String email) async {
    final box = await Hive.openBox(dbName);
    box.add(email);
  }

  Future<List> getEmail(String email) async {
    final box = await Hive.openBox(dbName);
    final data = box.values.toList();
    return data;
  }
}
