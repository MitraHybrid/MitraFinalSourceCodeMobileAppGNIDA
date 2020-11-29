import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigationdrawer/Utility/AppButton.dart';
import 'package:navigationdrawer/Utility/MyConstants.dart';
import 'package:navigationdrawer/Utility/shared_preferences_util.dart';
import 'package:navigationdrawer/fragments/CitizenService/CitizenServiceType/CitizenServiceTypeModel.dart';

// ignore: must_be_immutable
class SmogandpollLanding extends StatefulWidget {

  CitizenServiceTypeModel availablelist;

  String id;

  SmogandpollLanding({Key key, this.availablelist, this.id})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SmogandpollLandingState();
  }
}

class SmogandpollLandingState extends State<SmogandpollLanding> {
  bool isButtonPressed = false;
  bool viewVisible = true;
  String citizenType;
  String serviceArea;
  String ruralmatGroup;
   String urbanmatGroup;
   //"MainServID":"SMOG_POL","ServiceArea":"URBAN","MatGroup":"SER_SPRUR"
  // "MainServID":"SMOG_POL","ServiceArea":"RURAL","MatGroup":"SER_SPRRR"

  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    smogandpollutionValue(widget.availablelist);
        PreferenceUtils.init();
      }
    
      @override
      Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;
        return Scaffold(
            appBar: AppBar(
              title: Text("Smog and pollution"),
            ),
            body: Center(
                child: Container(
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                  AppButton(
                    id: 'RURAL',
                    width: size.width * 0.7,
                    height: size.height * 0.08,
                    title: HOME.smogPollutionRural,
                    onPressed: (route, count, id) =>
                        this._clicked(route, context, id),
                    route: '/Smollandpollutiondetail',
                  ),
                  AppButton(
                    id: 'URBAN',
                    width: size.width * 0.7,
                    height: size.height * 0.08,
                    title: HOME.smogPollutionUrban,
                    onPressed: (route, count, id) =>
                        this._clicked(route, context, id),
                    route: '/Smollandpollutiondetail',
                  ),
                ]))));
      }
    
      _clicked(route, BuildContext context, id) {
        if (id == 'SER_SPRRR') {
          id = '%27SER_UBSAN%27';
        } else {
          id = '%27SER_SPRUR%27';
        }
        //  Navigator.of(context).push(MaterialPageRoute(
        //    builder: (context) =>
        //     Smollandpollutiondetail(id)));
      }
    
      void smogandpollutionValue(availablelist) {
        if (availablelist!=null){
          for (int i=0;i<widget.availablelist.d.results.length;i++){
            String mainservId = widget.availablelist.d.results[i].mainServID.toString();
            if (mainservId == "SMOG_POL"){
               String serviceAreafirst = widget.availablelist.d.results[i].serviceArea.toString();
             //  String serviceAreasecond = widget.availablelist.d.results[1].serviceArea.toString();
                print("firstServiceArea"+serviceAreafirst);
               // print("secondServiceArea"+serviceAreasecond);
            }
          }
 

        }

      }
}