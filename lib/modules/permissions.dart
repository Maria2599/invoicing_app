import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:invoicing_app/modules/products.dart';
import 'package:location/location.dart' as location;

class Permissions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PermissionState();
}

class PermissionState extends State<Permissions> {
  String Address = "";

  Future<void> GetAddressFromLatLong(
      location.LocationData _locationData) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        _locationData.latitude!, _locationData.longitude!);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    print(Address);
    setState(() {});
  }

  location.Location locationn = new location.Location();
  late bool _isServiceEnabled;
  late location.PermissionStatus _permissionGranted;
  late location.LocationData _locationData;
  bool _isGetLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Location",
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text(
              "  Please access your location \n to deliver your products to you ",
              style: TextStyle(
                  color: Colors.black.withBlue(70),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                              onPressed: () async {
                                _isServiceEnabled =
                                    await locationn.serviceEnabled();
                                if (!_isServiceEnabled) {
                                  _isServiceEnabled =
                                      await locationn.requestService();
                                  if (_isServiceEnabled) return;
                                }
                                _permissionGranted =
                                    await locationn.hasPermission();
                                if (_permissionGranted ==
                                    location.PermissionStatus.denied) {
                                  _permissionGranted =
                                      await locationn.requestPermission();
                                  if (_permissionGranted !=
                                      location.PermissionStatus.granted) return;
                                }
                                _locationData = await locationn.getLocation();
                                GetAddressFromLatLong(_locationData);

                                setState(() {
                                  _isGetLocation = true;
                                });
                              },
                              child: Text("GET LOCATION")),
                          _isGetLocation
                              ? Text(
                                  "Location ${_locationData.longitude}, ${_locationData.latitude}")
                              : Text("Null"),
                          Text(
                            "Address: ${Address}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Address != ""
                      ? Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Products()));
                            },
                            child: Text(
                              "    Go to Products    ",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                          ),
                        )
                      : Text("Must get Location",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
