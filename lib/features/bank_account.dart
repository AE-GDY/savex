
// CLASS FOR STORING BANK ACCOUNT INFORMATION
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

// LIST FOR STORING LINKED BANK ACCOUNTS
List<BankAccount> linkedAccounts = [];