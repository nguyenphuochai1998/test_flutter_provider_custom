import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_flutter/provider/index.dart';
class ProviderController extends StatefulWidget {
  ProviderController({required this.builderChild,this.providers = const []});
  List<Provider> providers;
  final Function() builderChild;
  static ProviderControllerState of(BuildContext context) {
    assert(context != null);
    final ProviderControllerState? result = context.findAncestorStateOfType<ProviderControllerState>();
    if (result != null)
      return result;
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
        'Scaffold.of() called with a context that does not contain a Scaffold.',
      ),
      ErrorDescription(
        'No Scaffold ancestor could be found starting from the context that was passed to Scaffold.of(). '
            'This usually happens when the context provided is from the same StatefulWidget as that '
            'whose build function actually creates the Scaffold widget being sought.',
      ),
      ErrorHint(
        'There are several ways to avoid this problem. The simplest is to use a Builder to get a '
            'context that is "under" the Scaffold. For an example of this, please see the '
            'documentation for Scaffold.of():\n'
            '  https://api.flutter.dev/flutter/material/Scaffold/of.html',
      ),
      ErrorHint(
        'A more efficient solution is to split your build function into several widgets. This '
            'introduces a new context from which you can obtain the Scaffold. In this solution, '
            'you would have an outer widget that creates the Scaffold populated by instances of '
            'your new inner widgets, and then in these inner widgets you would use Scaffold.of().\n'
            'A less elegant but more expedient solution is assign a GlobalKey to the Scaffold, '
            'then use the key.currentState property to obtain the ScaffoldState rather than '
            'using the Scaffold.of() function.',
      ),
      context.describeElement('The context used was'),
    ]);
  }
  @override
  ProviderControllerState createState() => ProviderControllerState ();

}

class ProviderControllerState extends State<ProviderController> {

  Map<String, Provider> providers = {};
  void addProvider({required List<Provider> providersAdd}) {
    providersAdd.forEach((provider) {
      providers[provider.getKey()] = provider;
    });
  }
  Provider? getProviderByKey({required key}){
    return providers[key];
  }
  StreamController getStream({required key}){
    return providers[key]!.getStream();
  }
  @override
  void initState() {
    addProvider(providersAdd: widget.providers);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.builderChild();
  }
}

