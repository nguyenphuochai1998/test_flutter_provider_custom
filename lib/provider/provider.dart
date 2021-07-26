import 'dart:async';

import 'package:flutter/cupertino.dart';

class Provider<TValue> {
  Provider({required this.providerKey, this.value}){
    providerController.sink.add(this.providerKey);
  }
  StreamController providerController = new StreamController<String>();
  final String providerKey;
  TValue? value;

  setValue(TValue nextValue)  {
    this.value = nextValue;
    providerController.sink.add(this.providerKey);
  }
  getKey(){
    return this.providerKey;
  }
  TValue getValue(){
    return this.value as TValue;
  }
  StreamController getStream(){
    return providerController;
  }
  void dispose() {
    providerController.close();
  }
}