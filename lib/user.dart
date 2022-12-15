class User{
  final int id;
  final String username;
  final String email;
  final String password;

  User (
    {
      required this.id,
      required this.username,
      required this.email,
      required this.password
    }
  );

  factory User.fromJson(Map map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      password: map['password']
      );
  }
}