import 'dart:ui';
import 'package:custom_map_markers/src/popup_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarker extends Marker {
  CustomMarker(
      {@required MarkerId markerId,
        @required Popup popup,
      double alpha: 1.0,
      Offset anchor: const Offset(0.5, 1.0),
      bool consumeTapEvents: false,
      bool draggable: false,
      bool flat: false,
      BitmapDescriptor icon: BitmapDescriptor.defaultMarker,
      InfoWindow infoWindow: InfoWindow.noText,
      LatLng position: const LatLng(0.0, 0.0),
      double rotation: 0.0,
      bool visible: true,
      double zIndex: 0.0,
      VoidCallback onTap,
      ValueChanged<LatLng> onDragEnd});

  void updatePopup(){

  }
}
