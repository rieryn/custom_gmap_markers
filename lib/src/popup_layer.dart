import 'package:custom_map_markers/src/popup_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PopupLayer extends StatefulWidget {
  GoogleMapController _mapController;
  Popup _popup;
  PopupLayer({Key key, @required GoogleMapController mapController, @required Popup popup}) : super(key: key){
    _mapController = mapController;
    _popup = popup;
  }

  @override
  _PopupLayerState createState() => _PopupLayerState();
}

class _PopupLayerState extends State<PopupLayer> {

  @override
  void initState() {
    widget._popup.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Positioned(
        left: 0,
        top: 0,
        child: Visibility(
        visible: widget._popup.hidden,
        child: !widget._popup.hidden ? Container() : widget._popup.widget,
    ));
  }
}