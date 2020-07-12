import 'package:flutter/material.dart';
import 'SplashScreen.dart';
class CitySelection extends StatefulWidget {
  @override
  State<CitySelection> createState() => _CitySelectionState();
}

class _CitySelectionState extends State<CitySelection> {
  final TextEditingController _textController = TextEditingController();
  String temp;
  final keys = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[600],
        title: Text('Enter Your City Name'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Form(
              key: keys,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: 'City',
                          hintText: 'Chicago',
                        ),
                        onSaved: (input) => temp = input,
                        validator: (input) {
                          if(input.isEmpty)
                            return 'Please enter your city name!';
                          return null;
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),

                    onPressed: () {
                      setState(() {
                        keys.currentState.save();
                        city = temp;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WeatherApp()),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}