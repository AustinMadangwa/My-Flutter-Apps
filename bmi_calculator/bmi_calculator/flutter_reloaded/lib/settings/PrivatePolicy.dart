import 'package:flutter/material.dart';

class PrivatePolicy extends StatelessWidget {
  final int miles;

  PrivatePolicy({this.miles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[700],
        title: Text(
          'User Privacy Policy',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(aboutUs),
          ),
        ],
      ),
    );
  }
}

String aboutUs =
    'We believe you should be able to access and control your personal information no matter where you live. Depending on how you use Shopify, you may have the right to request access to, correct, amend, delete, port to another service provider, restrict, or object to certain uses of your personal information (for example, direct marketing). We will not charge you more or provide you with a different level of service if you exercise any of these rights.If you buy something from a Shopify-powered store and wish to exercise these rights over information about your purchase, you need to directly contact the merchant you interacted with. We are only a processor on their behalf, and cannot decide how to process their information. As such, we can only forward your request to them to allow them to respond. We will of course help our merchants to fulfill these requests by giving them the tools to do so and by answering their questions.Please note that if you send us a request relating to your personal information, we have to make sure that it is you before we can respond. In order to do so, we may ask to see documentation verifying your identity, which we will discard after verification.';
