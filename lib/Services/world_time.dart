import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for UI
  late String time;
  String flag;
  String url;
   late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url });

  Future<void> getTime() async {

    try {
      //make the request
      Response response = await get(
          Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties of data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //create Datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      isDaytime = now.hour> 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error: $e');
      time = " could not get time data";
      isDaytime = true;

    }

  }

}