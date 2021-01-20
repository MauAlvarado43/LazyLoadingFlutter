import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Cache Image Test",
    home: HomePage()
  ));
}


/*  ListTile(
  leading: CachedNetworkImage(
  imageUrl: poke[index]["img"],
  imageBuilder: (context, imageProvider) => Container(
  width: 80.0,
  height: 80.0,
  decoration: BoxDecoration(
  shape: BoxShape.circle,
  image: DecorationImage(
  image: imageProvider, fit: BoxFit.cover),
  ),
  ),
  errorWidget: (context, url, error) => Icon(Icons.error),
  ),
  title: Text(poke[index]["name"]),
  );*/
