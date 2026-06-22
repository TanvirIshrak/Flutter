import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_local_storage/provider/counter_provider.dart';

import 'app.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_)=> CounterProvider(),
  child: const MyApp()));
}

