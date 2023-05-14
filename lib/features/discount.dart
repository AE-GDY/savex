
// CLASS FOR CREATING DISCOUNTS
class Discount {

  String merchant;
  String discountAmount;
  String image;

  Discount({required this.merchant, required this.discountAmount, required this.image});

}

// LIST OF SAMPLE GENERAL DISCOUNTS
List<Discount> generalDiscounts = [

  Discount(merchant: 'Starbucks', discountAmount: '25%', image: 'starbucks_logo.png'),
  Discount(merchant: 'Nike', discountAmount: '10%', image: 'nike_logo.PNG'),
  Discount(merchant: 'Adidas', discountAmount: '15%', image: 'adidas_logo.jpg'),
  Discount(merchant: 'Costa', discountAmount: '30%', image: 'costa_logo.PNG'),
  Discount(merchant: 'Chillis', discountAmount: '35%', image: 'chilis_logo.png'),

];

// LIST OF SAMPLE PERSONALIZED DISCOUNTS
List<Discount> personalDiscounts = [

  Discount(merchant: 'Starbucks', discountAmount: '45%', image: 'starbucks_logo.png'),
  Discount(merchant: 'Costa', discountAmount: '40%', image: 'costa_logo.PNG'),
  Discount(merchant: 'Nike', discountAmount: '30%', image: 'nike_logo.PNG'),

];