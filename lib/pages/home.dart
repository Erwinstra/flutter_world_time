import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic data = {};
  late String imagePath;
  @override
  Widget build(BuildContext context) {
    data = data.length == 0 ? ModalRoute.of(context)?.settings.arguments : data;
    var isDayTime = data['isDayTime'];
    imagePath = isDayTime ? 'day.jpg' : 'night2.jpg';
    print('testing : $data');
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$imagePath'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                // choose location button
                TextButton.icon(
                  onPressed: () async {
                    var result =
                        await Navigator.pushNamed(context, '/locations');
                    setState(() {
                      data = result;
                    });
                  },
                  icon: Icon(
                    Icons.location_on,
                    color: (isDayTime ? Colors.black45 : Colors.white54),
                  ),
                  label: Text(
                    'Choose location',
                    style: TextStyle(
                      color: (isDayTime ? Colors.black45 : Colors.white54),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 24,
                        letterSpacing: 2,
                        color: (isDayTime ? Colors.black54 : Colors.white70),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 42,
                    color: (isDayTime ? Colors.black54 : Colors.white70),
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
