import 'package:flutter/material.dart';
import 'package:my_flutter_app/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
    WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'Sydney', flag: 'australia.png', url: 'Australia/Sydney'),
  ];

  void updateTime(index) async {
   WorldTime instance = locations[index];
   await instance.getTime();
   Navigator.pop(context, {
     'location': instance.location,
     'flag': instance.flag,
     'time': instance.time,
     'isDaytime': instance.isDaytime,
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount : locations.length,
          itemBuilder: (context, index){
             return Card(
               child: ListTile(
                 onTap: () {
                  updateTime(index);
                 },
                 title: Text(locations[index].location),
                 leading: CircleAvatar(
                   backgroundImage: AssetImage('assets/${locations[index].flag}'),
                 ),
               ),
             );
          })
    );
  }
}
