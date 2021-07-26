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
    const valueString = 'HELLO';
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProviderController(
          providers: [
            Provider<String?>(providerKey: providerKey, value: valueString)
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
  int count =0;
  @override
  Widget build(BuildContext context) {
    const providerKey = 'SIMPLE_PROVIDER';
    const valueString = 'HELLO';
    return Scaffold(
      body: SafeArea(
        child: Consumer(
          providerKey: providerKey,
          builder: (context, value) {
            return Column(
              children: [
                Text(value.toString()),
                ElevatedButton(
                  onPressed: () {
                    ProviderController.of(context)
                        .getProviderByKey(key: providerKey)!
                        .setValue("newValue ${count ++}");
                  },
                  child: Text("text"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
