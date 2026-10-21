//Different ways to write Dart classes, constructors, and fields

import 'dart:convert' show jsonDecode;
import 'dart:math';

class A {
  //instance fields
  int number;
  String name;

  A(this.number, this.name);
  //`this` inside the generative constructor references inst field
  //no function body needed if only setting the field values
  // A a = A(42, 'Bob');
  // a.number //42
  // a.name // 'Bob'
}

class Bee {
  int number; //must have a value
  String? name; //allowed to be null

  Bee({required this.number, this.name});
  //a generative constructor is a default constructor with parameters.
  //when using named parameters, if nullable, field must be declared as such
  //if not nullable, must use `required`
  //no function body needed if only setting the field values
  // Bee b = Bee(name: null, number: 42);
  // b.name; // null
  // b.number; // 42
  // Bee b = Bee(number: 42);
}

class C {
  C(int number, String name) {
    //do something with variables
    //if not fields, then include the datatype and function body
  }

  //C c = C(123, 'Bob');
}

class D {
  int number;
  String name; //if not nullable, a value MUST be provided when constructor runs
  late String id; //developer promises to give it a value before it is needed at runtime
  //without late it must be assigned a value

  D(int nu, String na) : number = nu * 2, name = na.toLowerCase() {
    //body of the constructor
    id = 'asjkdfkasjdfkjasf'; //uuid.v4()
    // Employee(id: id);
  }
  //an initializer list can be used to update the fields
  //initializer list goes between : and { start of function body }
  //function body is not required after the initializer list
}

class E {
  late int number;
  late String name;
  late String other;

  E(int nu, String na) : number = nu, name = na {
    // function body can follow the initializer list
    other = 'default value';
    //late variables can be here
  }

  E.predefined() : number = 42, name = 'Luke' {
    //named constructor as an alternative to the default constructor.
    //call it whatever you want.
    //setting non-nullable fields must be done in the initializer
    //or in the ( ).
    other = 'default value';
    //late variables can be here
  }
  E.fromJSON(String json) {
    Map decoded =
        jsonDecode(json) as Map; // same as JsonDecode decode = JsonDecode(); decode.convert(json);
    name = decoded['name']; //needed to be made late
    number = decoded['number']; //needed to be made late
    other = decoded['other'];
  }
  // E.fromJSON(json)

  void fromjson(String json) {
    //method not constructor
  }
  // E e = E();
  // e.fromjson(json);

  int makeRandom() {
    // int num = Random().nextInt(100);
    // bool headsortails = Random().nextBool();
    Random r = Random();
    int num = r.nextInt(100);
    bool headsortails = r.nextBool();
    return num;
  }

  // E e = E.predefined();
  // Data Model Class Forecast
  // Forecast forecast = Forecast(datetime: dt, range: days, temp: t, precip: p)
  // do a "fetch" call to get the json from response.body
  // Forecast forecast = Forecast.fromJSON(jsonstring);
}

class F {
  int number;
  String name;
  String? nada;
  //the nullable fields do not need to be set in the constructor

  F({this.number = 11, required this.name}) : this.nada = 'hello';
  //instead of `required` we can provide default values for the fields
  //in the constructor
}

class G {
  double x, y;
  //declare two fields of the same type on the same line
  int _secret = 42;
  //variables whose names start with `_` are private within their class
  //class names that start with `_` are private within their library
  get secret {
    //format the value of _secret
    return _secret * 2;
  }
  // int s = secret;

  set secret(int val) {
    //do validation of val first
    _secret = val;
  }
  // secret = 123;

  G(this.x, this.y) : this._secret = 69;
  // The main constructor for this class setting the field values

  G.other(this.x, this.y) {
    this._secret = 123;
  }
  G.alternateNamed(double _x) : this(_x, 0);
  // only provide one of the field values, pass the value to the initializer
  // Using _x as a different name to illustrate that it is separate
  // Delegates to the main constructor by calling this(_x, 0).

  // G g = G.other(12, 34);
  // g._secret; //not allowed because it is private
  // g._taxrate = 0;
}

class H {
  int number;
  String name;

  new(this.number, this.name);
  // concise generative constructor - equivalent to H(this.number, this.name)

  new alternateNamed() : this.number = 1, this.name = 'Bubba';
  // concise named constructor
  // equivalent to H.alternateNamed() : this.number = 1, this.name = 'Bubba';
}
// H.new(123, 'bob')
// Iterable.new()

class I {
  int? number;
  String? name;

  //without writing a constructor a default one I() is created automatically
}

class J {
  int number;
  String name;

  J(this.number, this.name);

  factory stormtrooper(J other) => J(other.number, other.name);
  //factory constructor makes a copy of an instance of J
  // Equivalent to `factory J.stormtrooper(J other)`.
  // call it like this:
  // J first = J(12, 'bob');
  // J second = J.stormtrooper(first);
  // factory student(J other) => Student(name: other.name, program: other.name);

  @override
  String toString() {
    return 'instance of J($number, $name)';
    //return value: `instance of J(123, "Bubba")`
  }
  //this function overrides the top-level Object.toString() method
  // J j = J(66, 'Yoda');
  // j.toString();
  // 'instance of J(66, 'Yoda')'
}

class Kangaroo {
  int number;
  String name;
  static double pie = 3.14;
  static int totalKangaroos = 0;
  //static fields, like K.pie, belongs to the class, not the instance
  //the static field or method are prefixed with the class name, not `this`

  Kangaroo(this.number, this.name) {
    Kangaroo.pie = Kangaroo.pie * 2;
    Kangaroo.totalKangaroos++;
    //double the value of K.pie each time an instance is created
  }

  static int someMethod() {
    //return the current value as an integer of the static pie field
    return Kangaroo.pie.toInt();
    // or Kangaroo.pie.truncate();
    // .round() .floor() .ceil() just like JS
  }
  //methods and fields can both be static
  //static methods cannot access `this` the instance
}

class L {
  final int number;
  final String name;

  const L(this.number, this.name);
  //a constant constructor produces immutable objects
  //where all instance variables are final
}

//
// EXTENDING CLASSES
//
class Person {
  String name;
  Person({required this.name});
}

class Student extends Person with Hands implements Study {
  String program;

  Student({required super.name, required this.program});
  // super.name references the name field in the Person class
  // this.program references the program field in the Student class

  @override
  void useBrain() {
    //function must be implemented because class implements interface Study
    print('Me thinking.');
  }
}

class Graduate extends Student {
  String credential;

  Graduate({required super.name, required super.program, required this.credential});
  //super.name is the name field in Person
  //super.program is the program field in Student
  //this.credential is the credential field in Graduate

  @override
  String toString() {
    return 'Graduate $name has a $credential from $program.';
  }
}

mixin class Hands {
  bool _isRaised = false;

  void raiseHand() {
    _isRaised = true;
  }

  void lowerHand() {
    _isRaised = false;
  }
}

interface class Study {
  void useBrain() {
    //if this interface were abstract then we could skip the function body
  }
}

void main() {
  Graduate g = Graduate(name: 'Gerry', program: 'MAD&D', credential: 'Diploma');
  print(g.toString());
  //output: Graduate Gerry has a Diploma from MAD&D.
  g.useBrain();
}
