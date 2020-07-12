//import 'package:flutter/material.dart';
//
//int _onTapInt = 0;
//List <Color> _black = [
//  Colors.orange,
//  Colors.white,
//  Colors.white,
//  Colors.white,
//  Colors.white
//];
//Color _orange = Colors.orange;
//Color _blacks = Colors.white;
//
//drawer: Drawer(
//        child: ListView(
//          children: <Widget>[
//            DrawerHeader(
//              decoration: BoxDecoration(
//                gradient: LinearGradient(
//                    colors: <Color>[
//                      Colors.deepOrange,
//                      Colors.orangeAccent
//                    ]
//                )
//              ),
//                child: Avatar(assetImage: AssetImage('assets/moon.jpg'), name: 'Moon Wang')
//            ),
//            Drawers(
//                icon: Icons.home,
//                text: 'Home',
//                onTapping: () {
//                  setState(() {
//                    _onTapInt = 0;
//                    _black[0] = _blacks;
//                    _black[1] = _blacks;
//                    _black[2] = _blacks;
//                    _black[3] = _blacks;
//                    _black[_onTapInt] = _orange;
//                  });Navigator.of(context).pop();
//            }),
//            Drawers(icon: Icons.camera, text: 'Camera', onTapping: () {
//              setState(() {
//                _onTapInt = 1;
//                _black[0] = _blacks;
//                _black[1] = _blacks;
//                _black[2] = _blacks;
//                _black[3] = _blacks;
//                _black[_onTapInt] = _orange;
//              });Navigator.of(context).pop();
//            }),
//            Drawers(icon: Icons.search, text: 'Search', onTapping: () {
//              setState(() {
//                _onTapInt = 2;
//                _black[0] = _blacks;
//                _black[1] = _blacks;
//                _black[2] = _blacks;
//                _black[3] = _blacks;
//                _black[_onTapInt] = _orange;
//              });Navigator.of(context).pop();
//            }),
//            Drawers(icon: Icons.person, text: 'Profile', onTapping: () {
//              setState(() {
//                _onTapInt = 3;
//                _black[0] = _blacks;
//                _black[1] = _blacks;
//                _black[2] = _blacks;
//                _black[3] = _blacks;
//                _black[_onTapInt] = _orange;
//              });Navigator.of(context).pop();
//            })
//          ],
//        ),
//      ),
//      bottomNavigationBar: BottomNavigationBar(
//        backgroundColor: Colors.grey[700],
//        fixedColor: Colors.grey[700],
//        elevation: 20.0,
//        currentIndex: _onTapInt,
//        type: BottomNavigationBarType.fixed,
//        selectedFontSize: ScreenUtil().setSp(15),
//        onTap: (int index)
//          {
//            setState(() {
//              _onTapInt = index;
//              _black[0] = _blacks;
//              _black[1] = _blacks;
//              _black[2] = _blacks;
//              _black[3] = _blacks;
//              _black[4] = _blacks;
//              _black[_onTapInt] = _orange;
//            });
//          },
//          items:[
//            new BottomNavigationBarItem(
//                icon: Icon(
//                  Icons.home,
//                  color: _black[0],
//                ),
//                title: Text(
//                  'Home',
//                  style: TextStyle(
//                    color: _black[0]
//                  ),
//
//                ),
//            ),
//           new BottomNavigationBarItem(
//                icon: Icon(
//                  Icons.camera,
//                  color: _black[1],
//                ),
//                title: Text(
//                  'Camera',
//                  style: TextStyle(
//                    color: _black[1]
//                  ),
//                ),
//            ),
//            new BottomNavigationBarItem(
//                icon: Icon(
//                  Icons.camera,
//                  color: _black[2],
//                ),
//                title: Text(
//                  'Camera',
//                  style: TextStyle(
//                    color: _black[2]
//                  ),
//                ),
//            ),
//            new BottomNavigationBarItem(
//                icon: Icon(
//                  Icons.search,
//                  color: _black[3],
//                ),
//                title: Text(
//                  'Search',
//                  style: TextStyle(
//                    color: _black[3]
//                  ),
//
//                ),
//            ),
//            new BottomNavigationBarItem(
//                icon: Icon(
//                  Icons.person,
//                  color: _black[4],
//                ),
//                title: Text(
//                  'Profile',
//                  style: TextStyle(
//                    color: _black[4]
//                  ),
//                ),
//            ),
//          ]
//      ),