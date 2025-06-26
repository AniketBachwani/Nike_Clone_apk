import 'Shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  double clean(String priceString) {
  String cleanedString = priceString.replaceAll(RegExp(r'[^\d]'), '');
  double price = (double.parse(cleanedString))/100.00; // Divide by 100 to remove decimal part
    return price;
  }

  double total = 0.0;

  List<Shoe> shoeShop = [
    Shoe(
      name: "Air Jordan 1 Mid",
      price: "₹ 11,495.00",
      description:
          "Inspired by the original AJ1, this mid-top edition maintains the iconic look you love while choice colours and crisp leather give it a distinct identity",
      imagepath: "assets/Shoes_1.png",
    ),
    Shoe(
      name: "Air Jordan 1 School",
      price: "₹ 13,393.00",
      description:
          "To help MJ become the best, his mentors and coaches encouraged him to meditate for mental focus. This edition of the Sneaker School series honours the many paths to calmness with a leather upper inspired by Japanese sand gardens and an outsole that channels the peacefulness of water. Yoga poses on the collar and \"zen\" on the tongue label tie it all together.",
      imagepath: "assets/Shoes_2.jpg",
    ),
    Shoe(
      name: "Air Jordan 4 RM",
      price: "₹ 13,500.00",
      description:
          "These sneakers reimagine the instantly recognisable AJ4 for life on the go. We centred comfort and durability while keeping the heritage look you love. Max Air in the heel cushions your every step, and elements of the upper—the wing, eyestay and heel—are blended into a strong, flexible cage that wraps the shoe to add a toughness to your everyday commute.",
      imagepath: "assets/Shoes_3.png",
    ),
    Shoe(
      name: "Air Jordan Legacy",
      price: "₹ 8,500.00",
      description:
          "Celebrate MJ's legacy with this shout-out to Chicago's 312 area code. With elements from three iconic Jordans (the AJ3, AJ1 and Air Alpha Force), it's a modern mash-up that reps the best.",
      imagepath: "assets/Shoes_4.png",
    ),
    Shoe(
      name: "Jordan Blue",
      price: "₹ 6,900.00",
      description:
          "Designed to be soft and flexible, this Luka 3 puts a little magic in your steps. Springy foam underfoot helps you create space on the court while the lightweight design is made to move. Plus, Luka's love of cars inspired us to infuse the design with high-speed style, helping you look 100 as you blow past defenders.",
      imagepath: "assets/Shoes_5.png",
    ),
    Shoe(
      name: "Jordan Stadium 90",
      price: "₹ 10,000.00",
      description:
          "Comfort is king, but that doesn't mean you have to sacrifice style. Taking design inspiration from the AJ1 and AJ5, the Stadium 90 is ready for everyday wear. The leather upper delivers on durability while Nike Air technology cushions your every step.",
      imagepath: "assets/Shoes_6.png",
    ),
    Shoe(
      name: "Jordan Stay Loyal 3",
      price: " ₹ 10,295.00",
      description:
          "You gotta know where you've been to know where you're going. We took that to heart when creating the Stay Loyal 3, a modern shoe built on the Air Jordan legacy. Inside and out, they're made for versatility, with minimalist looks, cloud-like cushioning and design elements that echo the AJ4. In other words, style with proven lasting power.",
      imagepath: "assets/Shoes_7.png",
    ),
    Shoe(
      name: "Air Force 3 Low",
      price: " ₹ 14,995.00",
      description:
          "The Nike x Nigo journey continues. This time, Nigo puts another artistic spin on the legendary Air Force 3, drawing inspiration from Nike DNA and his own personal collections and pop culture nostalgia.",
      imagepath: "assets/Shoes_8.png",
    ),
    Shoe(
      name: "Air Jordan 1 High OG",
      price: "₹ 16,995.00",
      description:
          "This 'First in Flight' edition of the AJ1 honours the home of the high flyers. It celebrates the historic moments in flight, as well as the pioneers that first set our gaze on the skies.",
      imagepath: "assets/Shoes_9.png",
    ),
    Shoe(
      name: "Nike Air Max 1",
      price: "₹ 6,167.00",
      description:
          "Made for kids (and their squirmy feet), these Air Max Shoes have a Nike EasyOn system that makes putting them on a breeze. The laces are just for show—the top loop is combined with a hook-and-loop strap to create a wide opening while still looking like traditional laces.",
      imagepath: "assets/Shoes_10.png",
    ),
  ];

  List<Shoe> userCart = [];

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    total = total + clean(shoe.price);
    notifyListeners();
  }

  double returnTotal() {
    return total;
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    total = total - clean(shoe.price);
    notifyListeners();
  }
}
