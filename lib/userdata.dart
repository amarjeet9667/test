class User{
  final String avatar;
  final String email;
  final String first_name;
  final String last_name;

  User({required this.avatar, required this.email,
    required this.first_name,required this.last_name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      avatar: json['avatar'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name']
    );
  }


}

