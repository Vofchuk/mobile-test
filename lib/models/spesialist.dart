import 'dart:convert';

///Model of the specialist with all needed funcion for fetching data from the api
class Specialist {
  String? name;
  String? description;
  Actions? actions;

  Specialist({
    this.name,
    this.description,
    this.actions,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'actions': actions?.toMap(),
    };
  }

//For casting the json into a local obj
  factory Specialist.fromMap(Map<String, dynamic> map) {
    return Specialist(
      name: map['name'],
      description: map['description'],
      actions: Actions.fromMap(map['actions']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Specialist.fromJson(String source) =>
      Specialist.fromMap(json.decode(source));
}

class Actions {
  String? chat;
  String? call;

  Actions({
    this.chat,
    this.call,
  });

  Map<String, dynamic> toMap() {
    return {
      'chat': chat,
      'call': call,
    };
  }

  factory Actions.fromMap(Map<String, dynamic> map) {
    return Actions(
      chat: map['chat'],
      call: map['call'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Actions.fromJson(String source) =>
      Actions.fromMap(json.decode(source));
}
