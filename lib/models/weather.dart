class Weather {
  final double latitude;
  final double longitude;
  final List<dynamic> hours;
  final List<dynamic> waveHeights;

  const Weather({
    required this.latitude,
    required this.longitude,
    required this.hours,
    required this.waveHeights
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      latitude: json['latitude'],
      longitude: json['longitude'],
      hours: json['hourly']['time'].map((i)=>i.toString()).toList(),
      waveHeights: json['hourly']['wave_height'].map((i)=>i.toString()).toList()
    );
  }
}