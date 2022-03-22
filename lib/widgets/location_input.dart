import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocaitonInput extends StatefulWidget {
  const LocaitonInput({Key? key}) : super(key: key);

  @override
  State<LocaitonInput> createState() => _LocaitonInputState();
}

class _LocaitonInputState extends State<LocaitonInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentLocation() async {
    final LocationData locationData = await Location().getLocation();
    print(locationData.latitude);
    print(locationData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? const Text(
                  "No location",
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl as String,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {
                _getCurrentLocation();
              },
              icon: const Icon(Icons.location_on),
              label: const Text("Current Location"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text("Select on Map"),
            )
          ],
        )
      ],
    );
  }
}
