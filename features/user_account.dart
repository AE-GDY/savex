

class UserAccount{

  static UserAccount currentUser = UserAccount(fullName: '', email: '', password: '');
  late String fullName;
  late String email;
  late String password;

  UserAccount({required this.fullName, required this.email, required this.password});

}


List<UserAccount> registeredUsers = [];