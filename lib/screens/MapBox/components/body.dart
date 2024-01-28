import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:movil_denuncias/Services/shared_preferences.dart';
import 'package:movil_denuncias/components/widget_btn.dart';
import 'package:movil_denuncias/constants.dart';
import 'package:movil_denuncias/size_config.dart';
import 'package:flutter/material.dart';
import '../../../components/botones.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;

class BodyMapa extends StatefulWidget {
  @override
  _BodyMapaState createState() => _BodyMapaState();
}

class _BodyMapaState extends State<BodyMapa> {
  GoogleMapController? mapController;
  double? latitud, longitud, markerLatitud, markerLongitud;
  //String? referencias, calles;
  bool gpsActivado = false;
  String marker = 'assets/images/ubi2.png';
  loc.Location location = loc.Location();

  // agregar este controlador para google maps  
  TextEditingController callesController = TextEditingController();
  TextEditingController referenciasController = TextEditingController();
  
  // metodo on map 

  onTapMap(LatLng coordinates) async {
    addSymbolMap(coordinates);
    setState(() {
      markerLatitud = coordinates.latitude;
      markerLongitud = coordinates.longitude;
    });

    // Obtener dirección desde las coordenadas
    List<Placemark> placemarks = await placemarkFromCoordinates(coordinates.latitude, coordinates.longitude);

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      setState(() {
        callesController.text = "${place.street}, ${place.subLocality}, ${place.locality}";
      });
    } else {
    // limpiar el campo de texto o mostrar un mensaje.
    callesController.text = "";
    }
  }

  position() {
    try {
      location.onLocationChanged.listen((loc.LocationData currentLocation) {
        if (mounted) {
          setState(() {
            latitud = currentLocation.latitude!;
            longitud = currentLocation.longitude!;
          });
        }
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  Future checkGps() async {
    try {
      if (!await location.serviceEnabled()) {
        await location.requestService();
        if (await location.serviceEnabled()) {
          setState(() {
            gpsActivado = true;
            position();
          });
        }
      } else {
        setState(() {
          gpsActivado = true;
          return position();
        });
      }
    } on Exception catch (e) {
      print('ERROR $e');
    }
  }



  @override
  void initState() {
    checkGps();
    super.initState();
  }

  @override
  void dispose() {
    if (latitud != null) {
      mapController?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return latitud == null
        ? Padding(
            padding: EdgeInsets.all(20),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                gpsActivado == false
                    ? BtnC(
                        title: 'Activar ubicación',
                        onTap: () async {
                          await checkGps();
                        },
                      )
                    : Center(child: CircularProgressIndicator(strokeWidth: 1))
              ],
            )),
          )
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: viewMap(),
                  height: getProportionateScreenHeight(500),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                escribirUbicacion()
              ],
            ),
          );
  }

  addSymbolMap([coordinates]) async {
    // mapController?.addSymbol(SymbolOptions(
    //     zIndex: 1,
    //     geometry: LatLng(
    //         coordinates.latitude,
    //         coordinates
    //             .longitude), // location is 0.0 on purpose for this example
    //     iconImage: marker,
    //     iconSize: 0.25));
    // await mapController?.clearSymbols();
  }
// Modificado este fue modificado  
  viewMap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(latitud!, longitud!), zoom: 16.5),
      mapType: MapType.normal,
      compassEnabled: false,
      rotateGesturesEnabled: false,
      onTap: onTapMap, // Usa la función onTapMap
      onMapCreated: onMapCreated,
    );
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  escribirUbicacion() {
  return Padding(
    padding: EdgeInsets.only(bottom: 20, left: 8, right: 8),
    child: Column(
      children: [
        TextFormField(
          controller: callesController, // Asignar el controlador aquí
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
            hintText: "Calles",
            focusColor: kPrimaryColor
          ), 
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        TextFormField(
          controller: referenciasController, // Asignar el controlador aquí
          maxLines: 1,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
            hintText: "Referencia",
            focusColor: kPrimaryColor
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        ElevatedButton(
          onPressed: () {
            // Acción a realizar cuando se presiona el botón
            obtenerDatosUbicacion();
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: kPrimaryColor, // Color del texto del botón
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
            ),
          ),
          child: Text('Continuar'), // Texto del botón
        )
      ],
    ),
  );
}

  obtenerDatosUbicacion() async {
  String callesValor = callesController.text;
  String referenciasValor = referenciasController.text;


  if (latitud != null && longitud != null && callesValor.isNotEmpty && referenciasValor.isNotEmpty) {
    Map ubicacion = {
      'latitud': markerLatitud ?? latitud,
      'longitud': markerLongitud ?? longitud,
      'referencia': referenciasValor,
      'calles': callesValor
      
    };
     await guardarUbicacionDenuncia(ubicacion);
      if (markerLatitud != null) {
        mostrarMensaje('Se tomó la posición marcada en el mapa', context, 3);
        print(ubicacion);
      }
      Navigator.pop(context);
  } else {
    mostrarMensaje('Llena los campos', context, 3);
  }
  }
}
