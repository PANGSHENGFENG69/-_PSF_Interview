library weather_app;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:psf_dioriverdemo/model/apiModel/Request/index.dart';
import 'package:psf_dioriverdemo/model/apiModel/Response/index.dart';

part 'controller/controller.dart';
part 'pages/weatherScreen.dart';
part 'service/service.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

//這邊如果有需要很多頁面的話，會在設計一個 Router的機制.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}
