import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helper/api_helper.dart';
import '../../provider/weather_location_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  void changeLocation({required String locationName}) async {
    final data = await ApiHelper.apiHelper.getApi(location: locationName);

    if (data != null) {
      // ignore: use_build_context_synchronously
      Provider.of<WeatherLocationProvider>(context, listen: false)
          .addLocation(locationName);

      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, "search", arguments: data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE3F2FD),
      appBar: AppBar(
        backgroundColor: const Color(0xffE3F2FD),
        centerTitle: true,
        title: const Text(
          "Sky Scrapper",
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          // IconButton(
          //   onPressed: () {
          //     Provider.of<WeatherLocationProvider>(context, listen: false)
          //         .clearLocations;
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       const SnackBar(
          //         content: Text(
          //           "All items Deleted Succesfully...",
          //         ),
          //         duration: Durations.extralong1,
          //         backgroundColor: Colors.red,
          //       ),
          //     );
          //   },
          //   icon: const Icon(
          //     Icons.delete_forever,
          //     color: Colors.black,
          //   ),
          // ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 10,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: TextField(
              controller: searchController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Search Here...",
                hintStyle: const TextStyle(
                  color: Colors.white70,
                ),
                filled: true,
                fillColor: Colors.blueAccent.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    changeLocation(locationName: searchController.text);
                  },
                  icon: const Icon(Icons.search),
                  color: Colors.black,
                ),
              ),
              onSubmitted: (value) {
                changeLocation(locationName: value);
              },
            ),
          ),
          (Provider.of<WeatherLocationProvider>(context).recentList.isNotEmpty)
              ? const Text(
                  "Your Searched Results...",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Container(),
          const Divider(),
          Expanded(
            child: Consumer<WeatherLocationProvider>(
              builder: (context, provider, child) {
                return (provider.recentList.isEmpty)
                    ? FutureBuilder(
                        future: ApiHelper.apiHelper.getApi(location: "Rajkot"),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("ERROR: ${snapshot.error}"),
                            );
                          } else if (snapshot.hasData) {
                            var data = snapshot.data;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: const DecorationImage(
                                          image: AssetImage("assets/rec.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      alignment: Alignment.topLeft,
                                      padding: const EdgeInsets.only(left: 24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Spacer(),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    data!.locationName,
                                                    style: const TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${data.region}, ${data.country}",
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black38,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                // height: MediaQuery.of(context)
                                                //         .size
                                                //         .height /
                                                //     10,
                                                decoration: BoxDecoration(
                                                  color: Colors.amber,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      "https://${data.image.split("//")[1]}",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Wind Speed Kmph ${data.winKPH}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "Wind Speed Kmph ${data.windMPH}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        })
                    : Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: ListView.builder(
                          itemCount: provider.recentList.length,
                          itemBuilder: (context, index) {
                            String location = provider.recentList[index];
                            return Card(
                              elevation: 2,
                              color: const Color(0xFF9BBECC),
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: Text(
                                    location.characters.first.toUpperCase(),
                                  ),
                                ),
                                title: Text(
                                  location,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                onTap: () {
                                  changeLocation(locationName: location);
                                },
                                trailing: IconButton(
                                  onPressed: () {
                                    provider.removeLocation(location);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "$location Deleted Succesfully...",
                                        ),
                                        duration: Durations.extralong1,
                                        backgroundColor: Colors.red[300],
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red[300],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
