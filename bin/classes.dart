import 'package:classes/classes.dart';
import 'package:classes/examples.dart' as examples show main;

void main(List<String> arguments) {
  // call on the class
  var orb1 = UFO(id: 'Orange Orb', isVisible: true);
  print('Orb1 is: ${orb1.description}');
  examples.main();
}
