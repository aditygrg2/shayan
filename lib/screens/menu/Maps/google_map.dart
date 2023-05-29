import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:night_gschallenge/providers/location_provider.dart';
import 'package:night_gschallenge/widgets/UI/home_screen_heading.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  static String routeName = '/maps';
  String place = "Meditation Centers";
  Set<Marker> set = {};
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  final places =
      GoogleMapsPlaces(apiKey: "Your-key");

  Future getLocation(BuildContext context, LocationProvider location) async {
    await Provider.of<LocationProvider>(context, listen: false)
        .initPlatformState();
    final response = await places.searchNearbyWithRankBy(
        Location(lat: location.latitude, lng: location.longitude), "distance",
        keyword: widget.place);

    for (PlacesSearchResult place in response.results) {
      widget.set.add(Marker(
        position:
            LatLng(place.geometry!.location.lat, place.geometry!.location.lng),
        markerId: MarkerId(place.placeId),
        infoWindow: InfoWindow(
          title: place.name,
          snippet: place.formattedAddress,
        ),
      ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    return Scaffold(
      body: ListView(
        children: [
          TopRow(
            back: true,
          ),
          HomeScreenText(
            text: "Maps",
          ),
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Text(
                            "Search Near by",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        DropdownButton(
                          items: [
                            "Meditation Centers",
                            "Yoga Centers",
                            "Doctors"
                          ].map((e) {
                            return DropdownMenuItem(
                              value: e,
                              key: Key(e),
                              child: Container(child: Text(e)),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              widget.place = value!;
                              getLocation(context, locationProvider);
                            });
                          },
                          value: widget.place,
                          hint: const Text("Select Place"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 500,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: GoogleMap(
                      compassEnabled: true,
                      // gestureRecognizers: 5,
                      mapToolbarEnabled: true,
                      myLocationEnabled: true,
                      rotateGesturesEnabled: true,
                      markers: widget.set,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(locationProvider.latitude,
                            locationProvider.longitude),
                        zoom: 12.0,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                      },
                    ),
                  ),
                ],
              );
            },
            future: locationProvider.initialize(),
          ),
        ],
      ),
    );
  }
}
