class UAP implements NonHumanCraft {
  String description = 'Unidentified Anomolous Phenomenon';
  final String id;
  bool isVisible;
  double horizontalAngle = 0;
  double verticalAngle = 0;

  UAP({required this.id, this.isVisible = true});
  //default values with = but only for optional params

  //UAP methods
  void appear() {}
  void disappear() {}

  // NonHumanCraft interface methods
  void takeoff() {}
  void land() {}
  void accelerate() {}
  void decelerate() {}
  void changeDirection() {}
}

class UFO extends UAP with WeaponSystems, AbductionSystems {
  @override
  String description = 'Unidentified Flying Object';
  //gets all the UAP methods and properties

  UFO({required super.id, super.isVisible});

  //we can use the WeaponSystems shootLaser() method from and instance
  //or override it
  //same with the AbductionSystems getThatCow() method
}

class USO extends UAP with WeaponSystems {
  @override
  String description = 'Unidentified Submerged Object';
  //gets all the UAP methods and properties
  USO({required super.id, super.isVisible});

  //we can use the WeaponSystems shootLaser() method from and instance
  //or override it
}

abstract interface class NonHumanCraft {
  void takeoff();
  void land();
  void accelerate();
  void decelerate();
  //as an abstract interface the function body is optional
  void changeDirection() {}
}

mixin WeaponSystems {
  void shootLaser() {
    print('pew pew');
  }
}

mixin AbductionSystems {
  void getThatCow() {
    print('moooooooooo!');
  }
}
