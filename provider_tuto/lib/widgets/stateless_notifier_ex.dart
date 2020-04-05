import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tuto/models/my_notifier_model.dart';

class StateLessNotifierEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I am a stateless widget using notifier'),
      ),
      body: Container(
        child: ChangeNotifierProvider(
          create: (_) => MyNotifierModel(),
          child: Consumer<MyNotifierModel>(
            builder: (_, model, __) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(model.myText),
                  TextField(
                    onChanged: (textValue) {
                      model.setMyText = textValue;
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
