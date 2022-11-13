import 'package:flutter/material.dart';
import 'package:shopp/screens/products_overview_screens.dart';
import './screens/product_details_screen.dart';
import './providers/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=> Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily:'Lato',
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Colors.deepOrange),
           
        ),
        home:  ProductsOverviewScreen(),
        routes:{ProductDetailsScreen.routename:(ctx)=> ProductDetailsScreen()} ,
      ),
    );
  }
}

