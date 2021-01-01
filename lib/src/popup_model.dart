import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//popup with and cover the infowindow

class Popup extends ChangeNotifier {
  bool _hidden = true;
  bool _tempHidden = false;
  Widget _widget = Container(width: 100,height: 100);
  double _leftMargin;
  double _topMargin;

  void rebuild() {
    notifyListeners();
  }

  void updateWidget(Widget widget){
    _widget = widget;
  }

  void hidePopup(bool hidden) {
    _hidden = hidden;
  }

  Future<void> updatePopup(
      BuildContext context,
      GoogleMapController controller,
      LatLng position,
      double popupWidth,
      double popupOffset,
      ) async {
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    ScreenCoordinate screenCoordinate =
    await controller.getScreenCoordinate(position);

    double left = (screenCoordinate.x.toDouble() / devicePixelRatio) -
        (popupWidth / 2);
    double top =
        (screenCoordinate.y.toDouble() / devicePixelRatio) - popupOffset;
    if (left < 0 || top < 0) {
      _tempHidden = true;
    } else {
      _tempHidden = false;
      _leftMargin = left;
      _topMargin = top;
    }
  }

  void onTap(
      {@required BuildContext context,
        @required GoogleMapController googleMapController,
        @required LatLng position,
        @required double popupWidth,
        @required double popupOffset,
        @required Widget widget,}
      ) async {
    await updatePopup(
      context,
      googleMapController,
      position,
      popupWidth,
      popupOffset,
    );
    hidePopup(false);
    _widget = widget;
    rebuild();
  }

  void handleTapAway(){
    if(!hidden){
    hidePopup(true);
    rebuild();}
  }
  void handleCameraMove(
      BuildContext context,
      GoogleMapController googleMapController,
      LatLng position,
      double popupWidth,
      double popupOffset,
      ){
    if(!hidden && widget != null){
      updatePopup(
        context,
        googleMapController,
        position,
        popupWidth,
        popupOffset,
      );
      rebuild();
    }
  }

  bool get hidden =>
      (_hidden == false && _tempHidden == false) ? true : false;

  double get leftMargin => _leftMargin;

  double get topMargin => _topMargin;

  Widget get widget => _widget;
}