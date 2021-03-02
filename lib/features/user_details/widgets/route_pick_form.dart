import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RoutePickForm extends HookWidget {
  const RoutePickForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Destination',
                ),
                onChanged: (destinationAddress) {
                  // TODO: Add autocomplete search with google maps
                },
                onFieldSubmitted: (destinationAddress) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Home',
                ),
                onChanged: (homeAddress) {
                  // TODO: Add autocomplete search with google maps
                },
                onFieldSubmitted: (homeAddress) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
