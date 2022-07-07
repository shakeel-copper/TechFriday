import 'package:flutter/material.dart';
import 'package:fri_tech/controller/weatherController.dart';
import 'package:get/get.dart';


class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {

  WeatherController weatherController = Get.put(WeatherController());

  @override
  void initState() {
    super.initState();
    weatherController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=> weatherController.isLoading.value==false?const Center(child: CircularProgressIndicator(),):
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 100,),
              Card(
                color: Colors.brown.shade50,
                child: Column(
                  children: [
                    Image.asset("assets/images/cloudy.png",width: 200,height: 200,),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Divider(
                        color: Colors.brown.shade400,
                        thickness: 10,
                      ),
                    ),
                    Text("${weatherController.weatherModel?.main?.temp??""}${"°C"}",style: const TextStyle(fontSize: 50),)
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    color: Colors.brown.shade50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      child: Column(
                        children: [
                          Image.asset("assets/images/sunny.png",width: 40,height: 40,),
                          Text(weatherController.weatherModel?.main?.tempMin.toString()??"",style: const TextStyle(fontSize: 20),)
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.brown.shade50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      child: Column(
                        children: [
                          Image.asset("assets/images/cloud.png",width: 40,height: 40,),
                          Text(weatherController.weatherModel?.main?.tempMax.toString()??"",style: const TextStyle(fontSize: 20),)
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.brown.shade50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      child: Column(
                        children: [
                          Image.asset("assets/images/rainy-day.png",width: 40,height: 40,),
                          Text(weatherController.weatherModel?.main?.humidity.toString()??"",style: const TextStyle(fontSize: 20),)
                        ],
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
  


}
