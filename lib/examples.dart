//Different ways to write Dart classes, constructors, and fields

class A {
  //instance fields
  int number;
  String name;

  A(this.number, this.name);
  //`this` inside the generative constructor references inst field
  //no function body needed if only setting the field values
}

class B {
  int number;
  String? name;

  B({required this.number, this.name});
  //a generative constructor is a default constructor with parameters.
  //when using named parameters, if nullable, field must be declared as such
  //if not nullable, must use `required`
  //no function body needed if only setting the field values
}

class C {
  C(int number, String name) {
    //do something with variables
    //if not fields, then include the datatype and function body
  }
}

class D {
  int number;
  String name;

  D(int nu, String na) : number = nu, name = na;
  //an initializer list can be used to update the fields
  //initializer list goes between : and { start of function body }
  //function body is not required after the initializer list
}

class E {
  int number;
  String name;
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
}

class F {
  int number;
  String name;
  String? nada;
  //the nullable fields do not need to be set in the constructor

  F({this.number = 11, required this.name});
  //instead of `required` we can provide default values for the fields
  //in the constructor
}

class G {
  double x, y;
  //declare two fields of the same type on the same line
  int _secret = 42;
  //variables whose names start with `_` are private within their class
  //class names that start with `_` are private within their library

  G(this.x, this.y);
  // The main constructor for this class setting the field values

  G.alternateNamed(double _x) : this(_x, 0);
  // only provide one of the field values, pass the value to the initializer
  // Using _x as a different name to illustrate that it is separate
  // Delegates to the main constructor by calling this(_x, 0).
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

class I {
  int? number;
  String? name;

  //without writing a constructor a default one I() is created automatically
}

class J {
  int number;
  String name;

  J(this.number, this.name);

  factory clone(J other) => J(other.number, other.name);
  //factory constructor makes a copy of an instance of J
  // Equivalent to `factory J.clone(J other)`.
  // call it like this:
  // J first = J(12, 'bob');
  // J second = J.clone(first);

  @override
  String toString() {
    return 'instance of J($number, $name)';
    //return value: `instance of J(123, "Bubba")`
  }
  //this function overrides the top-level Object.toString() method
}

class K {
  int number;
  String name;
  static double pie = 3.14;
  //static fields, like K.pie, belongs to the class, not the instance
  //the static field or method are prefixed with the class name, not `this`

  K(this.number, this.name) {
    K.pie = K.pie * 2;
    //double the value of K.pie each time an instance is created
  }

  static int someMethod() {
    //return the current value as an integer of the static pie field
    return K.pie.toInt();
    // or K.pie.truncate();
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
