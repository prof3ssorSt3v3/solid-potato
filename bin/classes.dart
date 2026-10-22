import 'package:classes/classes.dart';
import 'package:classes/examples.dart' as examples show main;

void main(List<String> arguments) {
  // call on the class
  var orb1 = UFO(id: 'Orange Orb', isVisible: true);
  print('Orb1 is: ${orb1.description}');
  orb1.shootLaser();
  orb1.getThatCow();
  orb1.takeoff();
  // examples.main();
  var orb2 = USO(id: 'Blue Blob', isVisible: false);
  orb2.shootLaser();
  orb2.takeoff();
  orb2.getThatCow();
}
