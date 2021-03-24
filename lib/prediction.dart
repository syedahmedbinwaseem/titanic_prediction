import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Prediction extends StatefulWidget {
  @override
  _PredictionState createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  bool isLoading = false;
  int result;
  Future getData() async {
    http.Response response = await http.get(
        'http://ahmedwaseem.pythonanywhere.com/price/?pclass=$pclass&gender=$gender&siblings=$siblings&embarked=$embarked');

    String abcd = json.decode(response.body)['price'].toString();

    int reponse = int.parse(abcd.replaceAll('[', '').replaceAll(']', ''));

    setState(() {
      result = reponse;
      isLoading = false;
    });
  }

  int pclass = 1;
  int gender = 1;
  int siblings = 0;
  int embarked = 1;
  Color minusColor = Colors.black;
  Color plusColor = Colors.black;

  Color minusColor1 = Colors.black;
  Color plusColor1 = Colors.black;

  Color minusColor2 = Colors.black;
  Color plusColor2 = Colors.black;

  Color minusColor3 = Colors.black;
  Color plusColor3 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff63366),
        title: Text(
          'Titanic Prediction',
          style: TextStyle(fontFamily: 'IBMPlexSans'),
        ),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 20),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Titanic Prediction using Gradient Boosting Classifier',
                  style: TextStyle(
                      fontFamily: 'IBMPlexSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Text(
                  'Enter PClass: 1, 2 or 3',
                  style: TextStyle(
                    fontFamily: 'IBMPlexSans',
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 10),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      height: 45,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '$pclass',
                          style: TextStyle(
                            fontFamily: 'IBMPlexSans',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xfff0f2f6),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 45,
                          width: 100,
                          child: Row(
                            children: [
                              FlatButton(
                                onHighlightChanged: (value) {
                                  if (value == true) {
                                    setState(() {
                                      minusColor = Colors.white;
                                    });
                                  } else {
                                    setState(() {
                                      minusColor = Colors.black;
                                    });
                                  }
                                },
                                color: Color(0xffe6eaf1),
                                highlightColor: Color(0xfff63366),
                                disabledTextColor: Colors.white,
                                splashColor: Colors.pink,
                                minWidth: 50,
                                height: 45,
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  if (pclass > 1) {
                                    setState(() {
                                      pclass--;
                                    });
                                  }
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: minusColor,
                                    size: 16,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(0),
                                        bottomRight: Radius.circular(0))),
                              ),
                              FlatButton(
                                color: Color(0xffe6eaf1),
                                highlightColor: Color(0xfff63366),
                                splashColor: Colors.pink,
                                minWidth: 50,
                                height: 45,
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  if (pclass < 3) {
                                    setState(() {
                                      pclass++;
                                    });
                                  }
                                },
                                onHighlightChanged: (value) {
                                  if (value == true) {
                                    setState(() {
                                      plusColor = Colors.white;
                                    });
                                  } else {
                                    setState(() {
                                      plusColor = Colors.black;
                                    });
                                  }
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: plusColor,
                                    size: 16,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5))),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Enter Gender: 1 = Male, 2 = Female',
                  style: TextStyle(
                    fontFamily: 'IBMPlexSans',
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 10),
                Stack(
                  children: [
                    Container(
                      height: 45,
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '$gender',
                          style: TextStyle(
                            fontFamily: 'IBMPlexSans',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xfff0f2f6),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 45,
                          width: 100,
                          child: Row(
                            children: [
                              FlatButton(
                                splashColor: Colors.pink,
                                onHighlightChanged: (value) {
                                  if (value == true) {
                                    setState(() {
                                      minusColor1 = Colors.white;
                                    });
                                  } else {
                                    setState(() {
                                      minusColor1 = Colors.black;
                                    });
                                  }
                                },
                                color: Color(0xffe6eaf1),
                                highlightColor: Color(0xfff63366),
                                disabledTextColor: Colors.white,
                                minWidth: 50,
                                height: 45,
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  if (gender > 1) {
                                    setState(() {
                                      gender--;
                                    });
                                  }
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: minusColor1,
                                    size: 16,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(0),
                                        bottomRight: Radius.circular(0))),
                              ),
                              FlatButton(
                                splashColor: Colors.pink,
                                color: Color(0xffe6eaf1),
                                highlightColor: Color(0xfff63366),
                                minWidth: 50,
                                height: 45,
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  if (gender < 2) {
                                    setState(() {
                                      gender++;
                                    });
                                  }
                                },
                                onHighlightChanged: (value) {
                                  if (value == true) {
                                    setState(() {
                                      plusColor1 = Colors.white;
                                    });
                                  } else {
                                    setState(() {
                                      plusColor1 = Colors.black;
                                    });
                                  }
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: plusColor1,
                                    size: 16,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5))),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Enter Siblings',
                  style: TextStyle(
                    fontFamily: 'IBMPlexSans',
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 10),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '$siblings',
                          style: TextStyle(
                            fontFamily: 'IBMPlexSans',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xfff0f2f6),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 45,
                          width: 100,
                          child: Row(
                            children: [
                              FlatButton(
                                splashColor: Colors.pink,
                                onHighlightChanged: (value) {
                                  if (value == true) {
                                    setState(() {
                                      minusColor2 = Colors.white;
                                    });
                                  } else {
                                    setState(() {
                                      minusColor2 = Colors.black;
                                    });
                                  }
                                },
                                color: Color(0xffe6eaf1),
                                highlightColor: Color(0xfff63366),
                                disabledTextColor: Colors.white,
                                minWidth: 50,
                                height: 45,
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  if (siblings > 0) {
                                    setState(() {
                                      siblings--;
                                    });
                                  }
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: minusColor2,
                                    size: 16,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(0),
                                        bottomRight: Radius.circular(0))),
                              ),
                              FlatButton(
                                splashColor: Colors.pink,
                                color: Color(0xffe6eaf1),
                                highlightColor: Color(0xfff63366),
                                minWidth: 50,
                                height: 45,
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  if (siblings < 10) {
                                    setState(() {
                                      siblings++;
                                    });
                                  }
                                },
                                onHighlightChanged: (value) {
                                  if (value == true) {
                                    setState(() {
                                      plusColor2 = Colors.white;
                                    });
                                  } else {
                                    setState(() {
                                      plusColor2 = Colors.black;
                                    });
                                  }
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: plusColor2,
                                    size: 16,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5))),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Enter Embarked: 1 = Southhampton, 2 = Cherbourg, 3 = Queenstown',
                  style: TextStyle(
                    fontFamily: 'IBMPlexSans',
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 10),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '$embarked',
                          style: TextStyle(
                            fontFamily: 'IBMPlexSans',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xfff0f2f6),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 45,
                          width: 100,
                          child: Row(
                            children: [
                              FlatButton(
                                splashColor: Colors.pink,
                                onHighlightChanged: (value) {
                                  if (value == true) {
                                    setState(() {
                                      minusColor3 = Colors.white;
                                    });
                                  } else {
                                    setState(() {
                                      minusColor3 = Colors.black;
                                    });
                                  }
                                },
                                color: Color(0xffe6eaf1),
                                highlightColor: Color(0xfff63366),
                                disabledTextColor: Colors.white,
                                minWidth: 50,
                                height: 45,
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  if (embarked > 1) {
                                    setState(() {
                                      embarked--;
                                    });
                                  }
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: minusColor3,
                                    size: 16,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(0),
                                        bottomRight: Radius.circular(0))),
                              ),
                              FlatButton(
                                splashColor: Colors.pink,
                                color: Color(0xffe6eaf1),
                                highlightColor: Color(0xfff63366),
                                minWidth: 50,
                                height: 45,
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  if (embarked < 3) {
                                    setState(() {
                                      embarked++;
                                    });
                                  }
                                },
                                onHighlightChanged: (value) {
                                  if (value == true) {
                                    setState(() {
                                      plusColor3 = Colors.white;
                                    });
                                  } else {
                                    setState(() {
                                      plusColor3 = Colors.black;
                                    });
                                  }
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: plusColor3,
                                    size: 16,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5))),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 35,
                    width: 100,
                    child: RaisedButton(
                        focusElevation: 5,
                        hoverElevation: 5,
                        highlightElevation: 5,
                        animationDuration: Duration(milliseconds: 500),
                        color: Colors.white,
                        highlightColor: Colors.white,
                        splashColor: Colors.pink.withOpacity(0.5),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Color(0xfff63366))),
                        onPressed: () {
                          setState(() {
                            result = 10;
                            isLoading = true;
                          });

                          getData().then((value) {
                            showDialog(
                                context: context,
                                child: Dialog(
                                  child: Container(
                                    color: Colors.pink.withOpacity(0.2),
                                    height: 60,
                                    width: 60,
                                    child: Center(
                                      child: Text(
                                        result == 1
                                            ? 'Survived!'
                                            : 'Did not Survive!',
                                        style: TextStyle(
                                            fontFamily: 'IBMPlexSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ));
                          });
                        },
                        child: Center(
                          child: Text(
                            'Predict',
                            style: TextStyle(
                              fontFamily: 'IBMPlexSans',
                              fontSize: 15,
                            ),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
