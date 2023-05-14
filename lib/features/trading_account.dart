
// CLASS FOR CREATING TRADING ACCOUNT STRUCTURE
class TradingAccount {

  String email;
  String tradingPlatform;

  TradingAccount({required this.email, required this.tradingPlatform});

}

// LIST FOR STORING LINKED TRADING ACCOUNTS
List<TradingAccount> linkedTradingAccounts = [];