import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/providers/providers.dart';
import '../widgets/route_pick_form.dart';

class RoutePickScreen extends HookWidget {
  const RoutePickScreen({Key key}) : super(key: key);

  static const routeName = '/route-pick-screen';

  @override
  Widget build(BuildContext context) {
    final userDetailsProvider = useProvider(globalUserDetailsProvider);

    return (userDetailsProvider.currentLocation == null)
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  mapType: MapType.normal,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      userDetailsProvider.currentLocation.latitude,
                      userDetailsProvider.currentLocation.longitude,
                    ),
                    zoom: 14,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 250,
                    margin: const EdgeInsets.all(30),
                    child: Card(
                      elevation: 12,
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                'Pick A Route',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            RoutePickForm(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
