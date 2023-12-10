import 'dart:convert';

import 'package:comments_app/src/utils/types.dart';
import 'package:http/http.dart';

extension HTTPResponseExtension on Response {

  T parseAsObject<T>(T Function(JsonMap map) mapper) {
    final dynamic map = jsonDecode(body);
    return mapper(map);
  }

  List<T> parseAsList<T> (T Function(JsonMap map) mapper) {
    final List<dynamic> list = jsonDecode(body);
    return list.map((el) => mapper(el)).toList(growable: false);
  }
}

extension ListExtensions<T> on List<T> {
  List<T> filter(bool Function(T item) filterFunction) {
    final List<T> list = [];
    for(var value in this) {
      if(filterFunction(value)) {
        list.add(value);
      }
    }
    return list;
  }

  List<T> filterNot(bool Function(T item) filterFunction) {
    final List<T> list = [];
    for(var value in this) {
      if(!filterFunction(value)) {
        list.add(value);
      }
    }
    return list;
  }

  List<T> replaceBy(bool Function(T item) findFunction, T newElement) {
    final List<T> list = [];
    for(var value in this) {
      if(findFunction(value)) {
        list.add(newElement);
      } else {
        list.add(value);
      }
    }
    return list;
  }

  List<R> fixedListMap<R>(R Function(T item) mapper) => map(mapper).toList(growable: false);

  T? find(bool Function(T element) filter) {
    for(var element in this) {
      if(filter(element)) {
        return element;
      }
    }
    return null;
  }

}

extension IntegerExtensions on int {
  List<R> mapUntil<R>(R Function(int index) mapper, [int start = 0]) {
    final List<R> list = [];
    for(var i = start; i < this; ++i) {
      list.add(mapper(i));
    }
    return list;
  }
}

extension GenericExtensions<T> on T {
  R let<R>(R Function(T value) mapper) => mapper(this);
}