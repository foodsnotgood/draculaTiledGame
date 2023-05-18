import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  double positionY;
  double positionX;

  User({required this.name, required this.positionY, required this.positionX});

  factory User.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return User(
        name: data?['name'],
        positionY: data?['positionY'],
        positionX: data?['positionX']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (positionX != null) "positionX": positionX,
      if (positionY != null) "positionY": positionY
    };
  }
}