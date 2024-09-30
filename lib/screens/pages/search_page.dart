import 'package:flutter/material.dart';
import '../../model/weather_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    WeatherModel? data =
        ModalRoute.of(context)!.settings.arguments as WeatherModel?;

    return Scaffold(
      backgroundColor: const Color(0xffE3F2FD),
      appBar: AppBar(
        backgroundColor: const Color(0xffE3F2FD),
        centerTitle: true,
        title: const Text("Searched values"),
      ),
      body: data == null
          ? const Center(
              child: Text("No data available"),
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: const Color(0xFF8BAAC2),
                          ),
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage("assets/backgorund1.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            const Spacer(),
                            Text(
                              data.locationName,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "${data.region}, ${data.country}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black38,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              data.conditionText,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "Temperature: ${data.temperatureC}°C / ${data.temperatureF}°F",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Last updated: ${data.lastUpdated}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF8BAAC2),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 10,
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://${data.image.split("//")[1]}",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height / 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Wind Speed Kmph ${data.winKPH}"),
                                    Text("Wind Speed Kmph ${data.windMPH}")
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 18,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF8BAAC2),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("ID: ${data.id}"),
                            const Icon(Icons.map),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
