import 'dart:async';

import 'package:location/location.dart';
import 'package:realtime_location/user_location.dart';

class LocationService {
  Location location = Location();
  //Controller location stream
  StreamController<UserLocation> _locationStreamController =
      StreamController<UserLocation>();

  //memantau perubahan controller
  Stream<UserLocation> get locationStream => _locationStreamController.stream;

  //In Constructor
  LocationService() {
    //request permission
    location.requestPermission().then((permissionStatus) {
      if (permissionStatus == PermissionStatus.granted) {
        //memantau jika ada perubahan lokasi user
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            _locationStreamController.add(UserLocation(
                latitude: locationData.latitude,
                longitude: locationData.longitude));
          }
        });
      }
    });
  }

  void dispose() => _locationStreamController.close();
}
