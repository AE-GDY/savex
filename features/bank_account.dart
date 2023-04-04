

class BankAccount{

  late String accountNumber;
  late String expiryDate;
  late String cvc;
  late String nickName;

  BankAccount({
    required this.accountNumber,
    required this.expiryDate,
    required this.cvc,
    required this.nickName,
  });


}


List<BankAccount> linkedAccounts = [];