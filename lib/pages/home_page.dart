import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:test_cache/controllers/home_controller.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) => Scaffold(
          appBar: AppBar(title: Text("Pokedex")),
          body: Container(
            child: _.buildList(),
          ),
          resizeToAvoidBottomPadding: false,
        )
    );
  }

}