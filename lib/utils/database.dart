import 'package:bonfire/bonfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dracula_game/dracula_game.dart';

mixin DatabaseConnecting {
  var db = FirebaseFirestore.instance;
  var defaultUser = <String, dynamic>{
    "name": "Johannes",
    "positionX": 2 * tileSize,
    "positionY": 240 * tileSize,
  };

  Future<void> save(Vector2 position, bool saved) async {
    db.collection("users")
        .where("name", isEqualTo: "${defaultUser["name"]}")
        .get()
        .then(
            (snapshot) {
          if (snapshot.size == 0) {
            db.collection("users").add(defaultUser).then((
                DocumentReference doc) =>
                print('DocumentSnapshot added with ID: ${doc.id}'));
          } else {
            print('user already exists. Updating position');
            db.collection("users").doc(snapshot.docs.first.id).update(
                {"positionY": position.y, "positionX": position.x});
          }
        }
    );
  }

  Future<Vector2> loadPosition(String name) async {
    Vector2 defaultPosition = Vector2(defaultUser["positionX"], defaultUser["positionY"]);
    // final ref = db.collection("users").where("name", isEqualTo: name).withConverter(fromFirestore: User.fromFirestore, toFirestore: (User user, _) => user.toFirestore());
    final ref = db.collection("users")
        .where("name", isEqualTo: name)
        .withConverter(fromFirestore: User.fromFirestore, toFirestore: (User user, _) => user.toFirestore());
    final docsSnap = await ref.get();
    User user = docsSnap.docs.first.data();
    return Vector2(user.positionX, user.positionY);
    // return defaultPosition;
  }
}

class User {
  final String name;
  final double positionY;
  final double positionX;

  User({
    required this.name,
    required this.positionY,
    required this.positionX
  });

  factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
    final data = snapshot.data();
    return User(
        name: data?['name'],
        positionY: data?['positionY'],
        positionX: data?['positionX']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (positionX != null) "positionX": positionX,
      if(positionY != null) "positionY": positionY
    };
  }

}
