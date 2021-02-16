import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

class HomePage extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  var totalamunt = 700;
  String doe = 'GDH';

  @override
  Widget build(BuildContext context) {
    void functionCall() async {
      String envelope =
          "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" " +
              "xmlns:tem=\"http://tempuri.org/\">" +
              "<soapenv:Header/> " +
              "<soapenv:Body>  " +
              "<tem:StartChangeRequest MachineId=\""+doe+"\"> " +
              "<tem:Id>?</tem:Id>" +
              "<tem:SequenceNumber>?</tem:SequenceNumber>" +
              "<tem:TransactionId>?</tem:TransactionId>" +
              "<tem:Reference>?</tem:Reference>" +
              "<tem:Category>?</tem:Category>" +
              "<tem:Amount>"+totalamunt.toString()+"</tem:Amount>" +
              "</tem:StartChangeRequest>" +
              "   </soapenv:Body> " +
              "</soapenv:Envelope>";

      http.Response response =
          await http.post('http://192.168.1.107:5000/BridgeService/',
              headers: {
                "Content-Type": "text/xml; charset=utf-8",
                "SOAPAction": "http://tempuri.org/IBridgeService/Reset",
              },
              body: envelope);

      var rawXmlResponse = response.body;

      // Use the xml package's 'parse' method to parse the response.
      xml.XmlDocument parsedXml = xml.parse(rawXmlResponse);

      var result = parsedXml
          .findAllElements('ResetResponse')
          .single
          .getAttribute('Result');

      print("DATAResult=" + response.body);

      print(result);
      //print(document.toXmlString(pretty: true, indent: '\t'));
      //var result = parsedXml.rootElement;
    }

    final cancelButon = Material(
      elevation: 5.0,
      color: Colors.red,
      child: MaterialButton(
        minWidth: 150,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => {},
        child: Text("ยกเลิก",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final confirmButon = Material(
      elevation: 5.0,
      color: Colors.indigo[800],
      child: MaterialButton(
        minWidth: 150,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => {functionCall()},
        child: Text("ยืนยัน",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: new Container(
        child: Column(
          children: [
            new Row(
              children: <Widget>[
                Container(
                    width: 140.0,
                    height: 140.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        image: new ExactAssetImage('assets/images/noimage.png'),
                        fit: BoxFit.cover,
                      ),
                    )),
                Spacer(),
                Container(
                    width: 140.0,
                    height: 140.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        image: new ExactAssetImage('assets/images/noimage.png'),
                        fit: BoxFit.cover,
                      ),
                    )),
              ],
            ),
            Container(
              child: new Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: 200,
                        width: 800,
                        child: GridView.count(
                          scrollDirection: Axis.vertical,
                          crossAxisCount: 4,
                          children: List.generate(4, (index) {
                            return Container(
                              // child: Card(
                              //   color: Colors.amber,
                              // ),
                              child: Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(7),
                                    child: Stack(children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Stack(
                                          children: <Widget>[
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Column(
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[],
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text('data'),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 600,
                    width: 350,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 100,
                          color: Colors.yellowAccent,
                        ),
                        Container(
                          width: 50,
                          height: 100,
                          color: Colors.blue,
                        ),
                        Container(
                          width: 50,
                          height: 100,
                          color: Colors.green,
                        ),
                        Container(
                          width: 50,
                          height: 100,
                          color: Colors.red,
                        ),
                        Container(
                          width: 50,
                          height: 100,
                          color: Colors.yellowAccent,
                        ),
                        Container(
                          width: 50,
                          height: 100,
                          color: Colors.blue,
                        ),
                        Container(
                          width: 50,
                          height: 100,
                          color: Colors.green,
                        ),
                        Container(
                          width: 50,
                          height: 100,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.height,
                  height: 60.0,
                  color: Colors.grey,
                  child: new Row(
                    children: <Widget>[
                      Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              image: new ExactAssetImage(
                                  'assets/images/noimage.png'),
                              fit: BoxFit.cover,
                            ),
                          )),
                      Text(
                        'รวมราคา',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Text(
                          '0',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                cancelButon,
                confirmButon,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
