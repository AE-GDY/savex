
// CLASS FOR CREATING A TRANSACTION
class Transaction {
  String merchant;
  String amount;
  String transactionType;

  Transaction({required this.merchant, required this.amount,required this.transactionType});
}


// LIST OF SAMPLE TRANSACTIONS
List<Transaction> transactions = [

  Transaction(merchant: 'Starbucks', amount: '150',transactionType: 'Credit',),
  Transaction(merchant: 'Beverly Hills Polo Club', amount: '3000',transactionType: 'Credit',),
  Transaction(merchant: 'McDonalds', amount: '400',transactionType: 'Credit',),
  Transaction(merchant: 'Seoudi', amount: '200',transactionType: 'Credit',),
  Transaction(merchant: 'Starbucks', amount: '200',transactionType: 'Credit',),
  Transaction(merchant: 'Quick', amount: '20',transactionType: 'Credit',),
  Transaction(merchant: 'Total Gas Station', amount: '600',transactionType: 'Credit',),
  Transaction(merchant: 'Paul', amount: '350',transactionType: 'Credit',),
  Transaction(merchant: 'Nike', amount: '900',transactionType: 'Credit',),
  Transaction(merchant: 'Crave', amount: '800',transactionType: 'Credit',),
  Transaction(merchant: 'McDonalds', amount: '350',transactionType: 'Credit',),
  Transaction(merchant: 'McDonalds', amount: '200',transactionType: 'Credit',),
  Transaction(merchant: 'McDonalds', amount: '500',transactionType: 'Credit',),
  Transaction(merchant: 'Starbucks', amount: '400',transactionType: 'Credit',),
  Transaction(merchant: 'Starbucks', amount: '350',transactionType: 'Credit',),
  Transaction(merchant: 'Starbucks', amount: '80',transactionType: 'Credit',),
  Transaction(merchant: 'Starbucks', amount: '450',transactionType: 'Credit',),
  Transaction(merchant: 'Bookstore A', amount: '50',transactionType: 'Credit',),
];