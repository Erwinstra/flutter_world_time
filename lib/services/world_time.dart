import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  final String location;
  final String url;
  final String flag;
  late String time;
  late bool isDayTime;

  WorldTime({required this.location, required this.url, required this.flag});

  Future<void> getTime() async {
    final response = await http.get(
      Uri.parse('http://worldtimeapi.org/api/timezone/$url'),
    );

    try {
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // Then parse the JSON
        var data = jsonDecode(response.body);
        var datetime = data['datetime'];
        var utcOffset = data['utc_offset'].substring(2, 3);

        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(utcOffset)));

        isDayTime = (now.hour >= 6 && now.hour < 18) ? true : false;
        time = DateFormat.jm().format(now);
      } else {
        time = 'status code is not 200';
      }
    } catch (e) {
      time = 'could not get time data';
      // print('Failed to load data : $e');
    }
  }
}
