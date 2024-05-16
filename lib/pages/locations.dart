import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Locations extends StatefulWidget {
  const Locations({super.key});

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  var locationList = [
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta'),
    WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Seoul', flag: 'south-korea.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Riyadh', flag: 'saudi-arabia.png', url: 'Asia/Riyadh'),
    WorldTime(location: 'Moscow', flag: 'russia.png', url: 'Europe/Moscow'),
    WorldTime(location: 'Istanbul', flag: 'turkey.png', url: 'Europe/Istanbul'),
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'London', flag: 'england.png', url: 'Europe/London'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
  ];

  void changeLocation(WorldTime data) async {
    await data.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': data.location,
      'flag': data.flag,
      'time': data.time,
      'isDayTime': data.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
        centerTitle: true,
        backgroundColor: Colors.cyan[600],
      ),
      body: ListView.builder(
        itemCount: locationList.length,
        itemBuilder: (context, index) {
          var item = locationList[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${item.flag}'),
              ),
              title: Text(item.location),
              onTap: () => changeLocation(item),
            ),
          );
        },
      ),
    );
  }
}
