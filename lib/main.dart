import 'package:flutter/material.dart';
import 'package:test_flutter/provider/index.dart';
import 'package:test_flutter/provider/provider_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const providerKey = 'SIMPLE_PROVIDER';
    const providerKey2 = 'SIMPLE_PROVIDER2';
    const valueString = 'HELLO';
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProviderController(
          providers: [
            Provider<String?>(providerKey: providerKey, value: valueString),
            Provider<int>(providerKey: providerKey2, value: 0)
          ],
          builderChild: () {
            return ProviderControllerPage(title: 'Flutter Demo Home Page');
          }),
    );
  }
}

class ProviderControllerPage extends StatefulWidget {
  ProviderControllerPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  ProviderControllerPageState createState() => ProviderControllerPageState();
}

class ProviderControllerPageState extends State<ProviderControllerPage> {
  String title = "check hey";
  @override
  Widget build(BuildContext context) {
    const providerKey2 = 'SIMPLE_PROVIDER2';
    const providerKey = 'SIMPLE_PROVIDER';
    const valueString = 'HELLO';
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Consumer(
              providerKey: providerKey,
              builder: (context, value) {
                return Text(value.toString());
              },
            ),
            Consumer(providerKey: providerKey2, builder: (context,value){
              int data = value as int;
              return Text('Value key2: -> $data');
            }),
            ElevatedButton(onPressed: (){
              int count = ProviderController.of(context).getProviderByKey(key: providerKey2)!.getValue();
              ProviderController.of(context)
                  .getProviderByKey(key: providerKey)!
                  .setValue("Value key1: -> ${++ count }");
              ProviderController.of(context)
                  .getProviderByKey(key: providerKey2)!
                  .setValue(count);
            }, child: Text("change"))
          ],
        ),
      ),
    );
  }
}
