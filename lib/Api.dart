import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_youtube/flutter_youtube.dart';

import 'model/Video.dart';


const CHAVE_YOUTUBE_API ="AIzaSyDB3xSjTm0GCGQN7cbLB_OXKMjp1H5eVGM";
const ID_CANAL = "UCI0cEXCkQLAeLleKgWD5fhg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>>pesquisar(String pesquisa) async {
    http.Response response = await http.get(
        URL_BASE + "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
            //return Video.converterJson(map);
          }
      ).toList();

      return videos;


    } else {

    }
  }
}