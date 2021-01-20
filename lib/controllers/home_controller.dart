import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeController extends GetxController{

  static int page = 0;
  ScrollController scrollController = new ScrollController();
  bool isLoading = false;
  List poke = new List();
  final dio = new Dio();

  @override
  void onInit(){
    super.onInit();

    this.getMoreData(page);

    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        getMoreData(page);
      }
    });

  }

  Widget buildList(){
    return ListView.builder(
        itemCount: poke.length + 1,
        padding: EdgeInsets.symmetric(vertical: 8.0),
        controller: scrollController,
        itemBuilder: (BuildContext context, int index){
          if (index == poke.length) {
            return buildProgressIndicator();
          }
          else{
            return new ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage: CachedNetworkImageProvider(poke[index]["img"]),
                backgroundColor: Colors.white,
              ),
              title: Text(poke[index]["name"]),
            );
          }
        }
    );
  }

  Widget buildProgressIndicator(){
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  void getMoreData(int index) async{

    if(!isLoading){

      isLoading = true;

      update();

      var url = "https://pokeapi.co/api/v2/pokemon?limit=20&offset=" + (20*page).toString();
      Response response = await dio.get(url);

      List temp = new List();
      for(int i = 0; i < response.data["results"].length; i++){
        Response pokemon = await dio.get(response.data["results"][i]["url"]);
        temp.add({
          "img": pokemon.data["sprites"]["front_default"],
          "name": response.data["results"][i]["name"]
        });
      }

        isLoading = false;
        poke.addAll(temp);
        page++;

        update();

    }

  }

}
