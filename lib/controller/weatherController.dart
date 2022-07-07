import 'package:fri_tech/model/weather.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WeatherController extends GetxController{
  WeatherModel? weatherModel;
  RxBool isLoading = false.obs;

  Future<void> fetchData() async {
    String url = "https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=5cd6452477d6be2cfca2559c1e4f2793";
    isLoading.value = false;
    var response  = await http.get(Uri.parse(url));
    try{
      if(response.statusCode == 200) {
        print(response.body);
        isLoading.value = true;
        var jsonResponse = convert.jsonDecode(response.body);
        weatherModel = WeatherModel.fromJson(jsonResponse);
        print(jsonResponse);
      }
    }catch(e){
      print(e);
    }
  }
}