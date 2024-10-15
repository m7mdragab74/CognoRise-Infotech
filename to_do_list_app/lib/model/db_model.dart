class Task {
  int? _id;
  int? _done;
  String? _name;
  String? _numberDays;

  Task(dynamic obj) {
    _id = obj['id'];
    _done = obj['done'];
    _name = obj['name'];
    _numberDays = obj['numberDays'];
  }

  toMap() {
    var map = {
      'id': _id,
      'done': _done,
      'name': _name,
      'numberDays': _numberDays,
    };
    return map;
  }

  Task.fromMap(Map map) {
    _id = map['id'];
    _done = map['done'];
    _name = map['name'];
    _numberDays = map['numberDays'];
  }

  get id => _id;
  get done => _done;
  get name => _name;
  get numberDays => _numberDays;
}
