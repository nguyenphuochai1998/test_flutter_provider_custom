
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_flutter/provider/provider_controller.dart';


class Consumer<TValue> extends StatefulWidget {
  Consumer({required this.providerKey, required this.builder});

  final String providerKey;
  final Function(BuildContext context, TValue child) builder;

  @override
  _ConsumerState<TValue> createState() => _ConsumerState<TValue>();
}

class _ConsumerState<TValue> extends State<Consumer<TValue>> {

  @override
  Widget build(BuildContext context) {
    ProviderControllerState providerController = context.findAncestorStateOfType<ProviderControllerState>()!;
    print("provider ${providerController.providers}");
    return StreamBuilder(
      stream: providerController.getStream(key: widget.providerKey).stream,
      builder: (context, snapshot) => widget.builder(context, providerController.getProviderByKey(key:widget.providerKey)!.getValue()),
    );

  }
}