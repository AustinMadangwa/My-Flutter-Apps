import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_reloaded/Widgets/Dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeTab extends StatelessWidget {
  final Function(int) navUpdate;
  HomeTab({
    @required this.navUpdate,
});
  @override
  Widget build(BuildContext context) {
    final phoneData = MediaQuery.of(context);
    final deviceWidth = phoneData.size.width;
    final deviceHeight = phoneData.size.height;
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            height: deviceHeight/4,
            child: Carousel(
              images: [
                AssetImage('assets/austin.jpg'),
                AssetImage('assets/miles8.jpg'),
                AssetImage('assets/mm2.jpg'),
                AssetImage('assets/moon.jpg'),
                AssetImage('assets/m.png'),
                AssetImage('assets/m1.png'),
              ],
              dotSize: 0,
              dotSpacing: 15.0,
              dotColor: Colors.transparent,
              indicatorBgPadding: 5.0,
              dotBgColor: Colors.transparent,
              borderRadius: false,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
              height: deviceHeight*0.12,
              width: deviceWidth*0.95,
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(10),
                  right: ScreenUtil().setWidth(10),
              bottom: ScreenUtil().setWidth(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: InkWell(
                          onTap: ()=>navUpdate(1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.orange[200],
                                maxRadius: deviceHeight*0.035,
                                child: Icon(
                                  Icons.search,
                                  color: Colors.orange,
                                  size: deviceHeight*0.05,
                                ),
                              ),
                              Text(
                                'Transit Information',
                              )
                            ],
                          )
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
//                    width: deviceWidth*0.5,
                      child: InkWell(
                          onTap: ()=>navUpdate(2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.lightBlue[200],
                                maxRadius: deviceHeight*0.035,
                                child: Icon(
                                  Icons.train,
                                  color: Colors.lightBlue,
                                  size: deviceHeight*0.05,
                                ),
                              ),
                              Text(
                                'Transit Information',
                              )
                            ],
                          )
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(10),
                right: ScreenUtil().setWidth(10),
            bottom:  ScreenUtil().setWidth(10)),
            width: deviceWidth*0.95,
            height: deviceHeight*0.12,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/mm2.jpg'),
                fit: BoxFit.cover
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context){
                          return Dialog(
                            child: AddDialog(
                              newPage: (){},
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(12)))
                            ),
                          );
                        }
                    );
                  },
                  child: Text(
                    'Testing Text',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(15)
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context){
                          return Dialog(
                            child: AddDialog(
                              newPage: (){},
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(12)))
                            ),
                          );
                        }
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(width: 1.0, color: Colors.white),
                      ),
                      child: Text(
                        'Testing Text 3',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(15)
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            width: deviceWidth*0.95,
            height: deviceHeight*0.06,
            color: Colors.white,
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(10),
                right: ScreenUtil().setWidth(10),
                bottom:  ScreenUtil().setWidth(10)),
            child: Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(10),
                right: ScreenUtil().setWidth(10),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: ()=>navUpdate(1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: deviceHeight*0.035,
                          width: 5,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Worksheet Information',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(15)
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: ()=>navUpdate(1),
                    child: Text(
                      'view more',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: ScreenUtil().setSp(12)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            width: deviceWidth*0.95,
            height: deviceHeight*0.06,
            color: Colors.white,
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(10),
                right: ScreenUtil().setWidth(10),
                bottom:  ScreenUtil().setWidth(10)),
            child: Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(10),
                right: ScreenUtil().setWidth(10),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: ()=>navUpdate(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: deviceHeight*0.035,
                          width: 5,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Service provider info',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(15)
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: ()=>navUpdate(2),
                    child: Text(
                      'view more',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: ScreenUtil().setSp(12)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
