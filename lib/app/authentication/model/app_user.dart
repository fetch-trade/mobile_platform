class AppUser {
  final String? email;
  final String? uid;
  final String? name;
  final int userColorOne;
  final int userColorTwo;

  AppUser(
      {required this.email,
      required this.uid,
      required this.name,
      required this.userColorOne,
      required this.userColorTwo});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uid': uid,
      'name': name,
      'user_color_one': userColorOne,
      'user_color_two': userColorTwo
    };
  }
}