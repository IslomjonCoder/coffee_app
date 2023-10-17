import 'package:flutter/material.dart';

class LocationPhoneNumberDialog extends StatefulWidget {
  @override
  _LocationPhoneNumberDialogState createState() => _LocationPhoneNumberDialogState();
}

class _LocationPhoneNumberDialogState extends State<LocationPhoneNumberDialog> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final FocusNode phoneNumberFocusNode = FocusNode();

  @override
  void dispose() {
    locationController.dispose();
    phoneNumberController.dispose();
    phoneNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Location and Phone Number'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: locationController,
            decoration: InputDecoration(labelText: 'Location'),
          ),
          TextField(
            controller: phoneNumberController,
            focusNode: phoneNumberFocusNode,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Phone Number (##-###-##-##)'),
            onChanged: (value) {
              if (value.length == 12) {
                FocusScope.of(context).requestFocus(FocusNode()); // Hide keyboard
              }
            },
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Submit'),
          onPressed: () {
            String location = locationController.text;
            String phoneNumber = phoneNumberController.text;
            // Handle the location and phone number as needed
            print('Location: $location');
            print('Phone Number: $phoneNumber');
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

void showLocationPhoneNumberDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return LocationPhoneNumberDialog();
    },
  );
}
