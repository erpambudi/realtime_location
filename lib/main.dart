import 'package:flutter/material.dart';
import 'package:realtime_location/location_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Realtime Update Location User'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LocationService locationService = LocationService();
  double latitude = 0;
  double longitude = 0;

  @override
  void initState() {
    super.initState();
    locationService.locationStream.listen((userLocation) {
      setState(() {
        latitude = userLocation.latitude;
        longitude = userLocation.longitude;
      });
    });
  }

  @override
  void dispose() {
    locationService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            // Text(
            //   "Stream Builder",
            //   style: TextStyle(
            //       fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            // ),
            // SizedBox(
            //   height: 6,
            // ),
            // Container(
            //   child: StreamBuilder<UserLocation>(
            //     stream: locationService.locationStream,
            //     builder: (_, snapshot) => (snapshot.hasData)
            //         ? Container(
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: <Widget>[
            //                 Text("Latitude :"),
            //                 Text(
            //                   "${snapshot.data.latitude}",
            //                   style: TextStyle(
            //                       fontSize: 18, fontWeight: FontWeight.bold),
            //                 ),
            //                 SizedBox(
            //                   height: 15,
            //                 ),
            //                 Text("Longitude :"),
            //                 Text(
            //                   "${snapshot.data.longitude}",
            //                   style: TextStyle(
            //                       fontSize: 18, fontWeight: FontWeight.bold),
            //                 ),
            //               ],
            //             ),
            //           )
            //         : SizedBox(),
            //   ),
            // ),
            // SizedBox(
            //   height: 16,
            // ),
            Text(
              "Stream Listener",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Latitude :"),
                  Text(
                    "$latitude",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Longitude :"),
                  Text(
                    "$longitude",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
