import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:night_gschallenge/providers/location_provider.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  static String routeName = '/maps';
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  final places = GoogleMapsPlaces(apiKey: "Your-key");
  Future getLocation(BuildContext context)async{
    await Provider.of<LocationProvider>(context,listen: false).initPlatformState();
    final response = await places.searchNearbyWithRankBy(Location(lat: 30.369810,lng: 75.546219),"distance",keyword: "hotels");
    print(response.errorMessage);
    print(response.isOkay);
  }
  @override
  Widget build(BuildContext context) {
  getLocation(context);
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          HomeScreenText(
            text: "Maps",
          ),
          Container(
            width: 200,
            height: 500,
            decoration: BoxDecoration(color: Colors.black),
            child: GoogleMap(
              // markers: _createMarkers(),
              initialCameraPosition: CameraPosition(
                target: LatLng(37.7749, -122.4194), // Initial map location
                zoom: 12.0, // Initial zoom level
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
          ),
        ],
      ),
    );
  }
}
