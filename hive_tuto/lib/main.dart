import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_tuto/base_model.dart';
import 'package:hive_tuto/model1_adapter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'model1.dart';
import 'model2.dart';
import 'model2_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(Model1Adapter());
  Hive.registerAdapter(Model2Adapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: Hive.openBox('models'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError)
                return Text(snapshot.error.toString());
              else
                return ModelView();
            }
            // Although opening a Box takes a very short time,
            // we still need to return something before the Future completes.
            else
              return Scaffold();
          },
        ),
      ),
    );
  }
}

class ModelView extends StatelessWidget {
  const ModelView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: Text('Add Model 1'),
          onPressed: () => Hive.box('models').add(Model1('type1', 'name', 10)),
        ),
        RaisedButton(
          child: Text('Add Model 2'),
          onPressed: () =>
              Hive.box('models').add(Model2('type2', 'name', 'idu oru string')),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: Hive.box('models').length,
            itemBuilder: (context, index) {
              var model = Hive.box('models').getAt(index);
              if ((model as BaseModel).type == 'type1') {
                var model1 = model as Model1;
                return ListTile(
                  title: Text(
                      '${model1.fullName}-${model1.chummaInt}-${model1.type}'),
                );
              } else {
                var model2 = model as Model2;
                return ListTile(
                  title: Text(
                      '${model2.fullName}-${model2.chummaStr}-${model2.type}'),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
