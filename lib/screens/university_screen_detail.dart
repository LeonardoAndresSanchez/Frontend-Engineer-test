import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend_engineer_test/models/university.dart';
import 'package:image_picker/image_picker.dart';

class UniversityDetail extends StatefulWidget {
  const UniversityDetail({super.key, required this.u});
  final University? u;

  @override
  State<UniversityDetail> createState() => _UniversityDetailState();
}

//var photo
File? foto;
XFile? image;
String? path;
File? showImage;
String fotoBase64 = "";
TextEditingController _maxQuantityController = new TextEditingController();
int? numStudents;

class _UniversityDetailState extends State<UniversityDetail> {
  @override
  void initState() {
    foto = null;
    numStudents = 0;
    _maxQuantityController.text = numStudents.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              GestureDetector(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.15,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          image: image == null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/default.png',
                                  ))
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(File(image!.path)),
                                ),
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: CircleAvatar(
                          backgroundColor: Colors.teal[800],
                          radius: 20,
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    createAlert(context);
                    // _tomarFoto();
                  }),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.u!.name!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Pais: ' + widget.u!.country!,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    widget.u!.alphaTwoCode!,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600]),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'número de estudiantes: ',
                  ),
                  Container(
                    // width: 120,
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              numStudents = numStudents! - 1;
                              _maxQuantityController.text =
                                  numStudents.toString();
                            });
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.black,
                                size: 13,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: 25,
                          height: 35,
                          child: TextFormField(
                            controller: _maxQuantityController,
                            // focusNode: _focusNode3,
                            onFieldSubmitted: (term) {},
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {},
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Este campo es obligatorio";
                              }
                              return null;
                            },
                            onEditingComplete: () {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            numStudents = numStudents! + 1;
                            _maxQuantityController.text =
                                numStudents.toString();
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.black,
                                size: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.domain),
                  Text(
                    'Dominio: ' + widget.u!.domains![0],
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.pin_drop),
                  Text(
                    'Provincia: ' + (widget.u!.stateProvince ?? 'Sin Datos'),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.web),
                  Text(
                    'Web: ' + widget.u!.webPages![0],
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }

  getImageFile(ImageSource source) async {
    ImagePicker imagePicker = ImagePicker();

    try {
      await imagePicker
          .pickImage(
            source: source,
          )
          .then((value) => {
                setState(() {
                  image = value;
                })
              });
      if (image == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Processing Data')),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  createAlert(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Container(
                  // height: MediaQuery.of(context).size.height * 0.20,
                  padding: EdgeInsets.all(
                    16,
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: const Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // To make the card compact
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.teal[800],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 8.0),
                          child: Text(
                            'Seleccion de imagen',
                            textScaleFactor: .8,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[100]),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        '¿Deseas Capturar o seleccionar la imagen ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width / 6,
                            height: 30,
                            buttonColor: Colors.teal[800],
                            child: MaterialButton(
                              color: Colors.teal[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.camera_alt,
                                      color: Colors.grey[100]),
                                  Text(
                                    'Camara',
                                    style: TextStyle(color: Colors.grey[100]),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                getImageFile(ImageSource.camera);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width / 6,
                            height: 30,
                            buttonColor: Theme.of(context).errorColor,
                            child: MaterialButton(
                              color: Colors.teal[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.photo_library,
                                      color: Colors.grey[100]),
                                  Text(
                                    'Galería',
                                    style: TextStyle(color: Colors.grey[100]),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                getImageFile(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
