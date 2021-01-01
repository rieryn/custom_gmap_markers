# custom_map_markers

custom marker infowindow and icons, tested on android only right now

you want to load icons somewhere before the widget draws
```
MarkerIcons.instance.loadIcon(assetPath, assetName)
 ```
Popup takes a widget, recommended constraints (100,150)
usually you want to reuse the same popup
 ```    
        Popup popup = Popup();
        Marker(
          markerId: id,
          position: latlng,
          icon: MarkerIcons.instance.[assetName],
          onTap: popup.onTap(
                       {@required BuildContext context,
                         @required GoogleMapController googleMapController,
                         @required LatLng position,
                         @required double popupWidth,
                         @required double popupOffset,
                         @required Widget widget,}
                       )
        );
```

put PopupLayer in a Stack widget on top of the map like so
```
Stack(children: <Widget>[
                      PopupLayer(popup, mapcontroller)
                      googleMap]
                      )
 ```
 put this on the google map
```
 GoogleMap(
              onTap: popup.tapAway(),
              onCameraMove: popup.handleCameraMove(),
              )
 ```

todo: example, docs, tests
