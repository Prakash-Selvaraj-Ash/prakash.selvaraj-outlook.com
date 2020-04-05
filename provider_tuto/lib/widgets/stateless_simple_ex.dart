import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tuto/models/my_simple_model.dart';

class StatelessSimpleEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('I am a state less widget using stream'),
        ),
        body: Container(
          child: Provider(
            create: (_) => MySimpleModel(),
            dispose: (_, MySimpleModel model) => model.dispose(),
            child: Builder(
              builder: (BuildContext ctx) {
                MySimpleModel model = Provider.of<MySimpleModel>(ctx);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    StreamBuilder<String>(
                        stream: model.textStream.stream,
                        builder: (context, snapshot) {
                          return Text(model.myText);
                        }),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Enter text to stream'),
                      onChanged: (textValue) => model.setMyText = textValue,
                    ),
                    RaisedButton(
                      child: Text('Click to update the color box'),
                      onPressed: () {
                        model.setIsValid = !model.isValid;
                      },
                    ),
                    StreamBuilder<bool>(
                        stream: model.boolStream.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                                height: 100,
                                width: 100,
                                color:
                                    snapshot.data ? Colors.red : Colors.green);
                          } else {
                            return Container(
                              height: 100,
                              width: 100,
                              color: Colors.green,
                            );
                          }
                        })
                  ],
                );
              },
            ),
          ),
        ));
  }
}
