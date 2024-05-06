import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier{
  //List for shop cart
  List<Shoe> shoeShop = [
    Shoe(
      name: 'AirJorden 1',
      price: '21000',
      description: 'Cool Shoe',
      imagePath: 'lib/images/shoe1.png',
    ),
    Shoe(
      name: 'AirJorden 2',
      price: '22000',
      description: 'Cool Shoe',
      imagePath: 'lib/images/shoe2.png',
    ),
    Shoe(
      name: 'AirJorden 3',
      price: '23000',
      description: 'Cool Shoe',
      imagePath: 'lib/images/shoe3.png',
    ),
    Shoe(
      name: 'AirJorden 4',
      price: '24000',
      description: 'Cool Shoe',
      imagePath: 'lib/images/shoe4.png',
    ),
  ];
  //Listv for user cart
  List<Shoe> userCart=[];
  //get list of shoes for sale
  List<Shoe> getShoeList(){
    return shoeShop;
  }
  //get cart
  List<Shoe> getUserCart(){
    return userCart;
  }
  void addItemCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }
  void removeItemCart(Shoe shoe)
  {
    userCart.remove(shoe);
    notifyListeners();
  }
}
