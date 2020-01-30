class User {
  String disasterid;
  String time;
  String firstName;

  String lastName;

  User({this.disasterid, this.time, this.firstName, this.lastName});

  static List<User> getUsers() {
    return <User>[
      User(
          disasterid: "0001",
          time: "11:04",
          firstName: "Fire",
          lastName: "Mathais"),
      User(
          disasterid: "0004",
          time: "11:04",
          firstName: "Accident",
          lastName: "Maragua"),
      User(
          disasterid: "0007",
          time: "11:04",
          firstName: "Fire",
          lastName: "Kiharu"),
      User(
          disasterid: "0034",
          time: "11:04",
          firstName: "Land Slide",
          lastName: "Kandara"),
      User(
          disasterid: "0035",
          time: "11:04",
          firstName: "Need Ambulance",
          lastName: "St Marys"),
      User(
          disasterid: "0034",
          time: "11:04",
          firstName: "Land Slide",
          lastName: "Kandara"),
    ];
  }
}
