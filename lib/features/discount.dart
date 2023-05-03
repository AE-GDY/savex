

class Discount {

  String merchant;
  String discountAmount;
  String image;

  Discount({required this.merchant, required this.discountAmount, required this.image});


}

List<Discount> generalDiscounts = [

  Discount(merchant: 'Starbucks', discountAmount: '25%', image: 'starbucks_logo.png'),
  Discount(merchant: 'Nike', discountAmount: '10%', image: 'nike_logo.PNG'),
  Discount(merchant: 'Adidas', discountAmount: '15%', image: 'adidas_logo.jpg'),
  Discount(merchant: 'Costa', discountAmount: '30%', image: 'costa_logo.PNG'),
  Discount(merchant: 'Chillis', discountAmount: '35%', image: 'chilis_logo.png'),

];