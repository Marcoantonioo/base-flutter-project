import 'dart:convert';

abstract class AbstractMapper<E> {
  Map<String, dynamic> toMap(E entity);
  E fromMap(Map<String, dynamic> map);

  List<E> listFromMap(List list) {
    return list.map<E>((e) => fromMap(e as Map<String, dynamic>)).toList();
  }

  E fromJson(String source) {
    return fromMap(json.decode(source));
  }

  List<E> listFromJson(String source) {
    List<dynamic> list = json.decode(source);
    return listFromMap(list);
  }

  String toJson(E entity) {
    return json.encode(toMap(entity));
  }

  String listToJson(List<E> list) {
    return json.encode(list.map(toMap).toList());
  }
}
