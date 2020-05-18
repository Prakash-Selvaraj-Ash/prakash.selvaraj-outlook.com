class UserRepository {
  final List<String> users = ["Alice", "Bob", "Foo", "Bar"];

  Future<bool> isUserAvailable(String user) async {
    await Future.delayed(Duration(milliseconds: 200));
    return users.indexOf(user) == -1;
  }
}
