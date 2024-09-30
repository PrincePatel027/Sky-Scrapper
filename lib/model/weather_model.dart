class WeatherModel {
  final String locationName;
  final String region;
  final String country;
  final double temperatureC;
  final double temperatureF;
  final String conditionText;
  final String conditionIcon;
  final String lastUpdated;
  final String image;
  final double windMPH;
  final double winKPH;
  final String id;

  WeatherModel({
    required this.locationName,
    required this.region,
    required this.country,
    required this.temperatureC,
    required this.temperatureF,
    required this.conditionText,
    required this.conditionIcon,
    required this.lastUpdated,
    required this.image,
    required this.windMPH,
    required this.winKPH,
    required this.id,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    return WeatherModel(
      locationName: data['location']['name'],
      id: data['location']['tz_id'],
      region: data['location']['region'],
      country: data['location']['country'],
      temperatureC: data['current']['temp_c'],
      temperatureF: data['current']['temp_f'],
      conditionText: data['current']['condition']['text'],
      conditionIcon: data['current']['condition']['icon'],
      lastUpdated: data['current']['last_updated'],
      image: data['current']['condition']['icon'],
      windMPH: data['current']['wind_mph'],
      winKPH: data['current']['wind_kph'],
    );
  }
}
