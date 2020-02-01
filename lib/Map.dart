import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Map extends StatefulWidget {
  Map({Key key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: (){},
        ),
        title: Text("Map"), centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.search),
            onPressed: (){},
          )
        ],
      ),

      body: Stack(
        children: <Widget>[
          _googlemap(context),
        ],
      )
    );
  }

  Widget _googlemap(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
          //definir o tipo de mapa
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 14),
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
         
      ),
    );
  }
}
