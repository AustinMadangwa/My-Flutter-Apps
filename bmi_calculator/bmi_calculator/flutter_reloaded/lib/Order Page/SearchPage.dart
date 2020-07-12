import 'package:flutter/material.dart';
import 'package:flutter_reloaded/Order%20Page/CitySelection.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class Insurance
{
  int id;
  String name;
  Insurance(this.id,this.name);
  static List<Insurance> getInsurance()
  {
    return<Insurance>[
      Insurance(1,'Sort'),
      Insurance(2,'Basic'),
      Insurance(3,'Standard'),
      Insurance(4,'Premiun'),
      Insurance(5,'Highest'),
    ];
  }
}

class _SearchPageState extends State<SearchPage> {
  List<Insurance> _insurances = Insurance.getInsurance();
  List<DropdownMenuItem<Insurance>> _dropdownMenuItems;
  Insurance _selectedInsurance;
  @override
  void initState() {
    _dropdownMenuItems = buildDropDownMenuItems(_insurances);
    _selectedInsurance = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Insurance>> buildDropDownMenuItems(List insurances)
  {
    List<DropdownMenuItem<Insurance>> items = List();
    for(Insurance insurance in insurances)
      {
        items.add(
          DropdownMenuItem(
            value: insurance,
            child: Text(insurance.name),
          ),
        );
      }
    return items;
  }

  onChangeDropdownItem(Insurance selectedInsurance)
  {
    setState(() {
      _selectedInsurance = selectedInsurance;
    });
  }

  @override
  Widget build(BuildContext context) {
    final phoneData = MediaQuery.of(context);
    final deviceWidth = phoneData.size.width;
    final deviceHeight = phoneData.size.height;
    return Container(
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CitySelection(titles: 'Select City',)));
            },
            child: Container(
              width: deviceWidth*0.333,
              height: deviceHeight*0.05,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey,width: 1),right: BorderSide(color: Colors.grey,width: 1))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Qingdao'),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CitySelection(titles: 'Select Industry')));
            },
            child: Container(
              width: deviceWidth*0.333,
              height: deviceHeight*0.05,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey,width: 1),right: BorderSide(color: Colors.grey,width: 1))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Industry'),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){

            },
            child: Container(
              width: deviceWidth*0.333,
              height: deviceHeight*0.05,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.grey,width: 1),right: BorderSide(color: Colors.grey,width: 1))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  DropdownButton(
                    value: _selectedInsurance,
                    items: _dropdownMenuItems,
                    onChanged: onChangeDropdownItem,
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
