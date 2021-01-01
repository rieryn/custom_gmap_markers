import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

class MarkerIcons {
  Map<String,BitmapDescriptor> bitmappedIcons;
  MarkerIcons._privateConstructor();

  static final MarkerIcons _instance = MarkerIcons._privateConstructor();

  static MarkerIcons get instance => _instance;
  init(){
  }

  void loadIcon(String path,String iconName){
    getBytesFromAsset(path,56).then((onValue) {
      bitmappedIcons[iconName] = BitmapDescriptor.fromBytes(onValue);
    }
    );
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }
  getIcon(String iconName) {
    return bitmappedIcons[iconName];
  }

}