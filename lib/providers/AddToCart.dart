import 'package:ecommerce/model/AddToCartModel.dart';
import 'package:flutter/material.dart';
class AddToCartProvider with ChangeNotifier {
  int _items = 0;
  int _totalPrice=0;
  int _count=1;
  int  _totalNumberOfProductCount=0;
  List<Map<String,dynamic>> _orderDetails=List<Map<String,dynamic>>();

    List<Map<String,dynamic>> _cartList = new List<Map<String,dynamic>>();

  int get items => _totalNumberOfProductCount;
  int get totalPrice=> _totalPrice;
  int get count=> _count;
  List get cartList => _cartList;
  List get orderDetails => _orderDetails;

  void addItemsToCart(Map product)
  {
     var indexNo = _cartList.indexWhere((f) => f['id'] ==product['id']);
     print(indexNo);
     if(indexNo== -1){
       product['product_qty']=count;
       _cartList.add(product);
     }
     else{
    //var productQty= _cartList[indexNo]['product_qty']+count;
       _cartList[indexNo].update('product_qty', (v)=>v+count);
       notifyListeners();
     }
     countTotalNumberOfProduct();
     totalProductsPrice();
    notifyListeners();

  }

  void deleteItemFromCart(int id)
  {
    for(int i=0; i< _cartList.length; i++)
      if(_cartList[i]['id'] == id)
        _cartList.removeAt(i);
    countTotalNumberOfProduct();
    totalProductsPrice();
    notifyListeners();
  }

  void totalProductsPrice()
  {
    _totalPrice=0;
    for(int i=0;i<_cartList.length;i++){
     int perProductTotalPrice=  _cartList[i]['product_qty']*_cartList[i]['sale_price'];
     _totalPrice=_totalPrice + perProductTotalPrice;
     print(_totalPrice);

    }
    notifyListeners();

  }

  set items(int val) {
    _items = val;
    notifyListeners();
  }
  set count(int val) {
    _count= val;
    notifyListeners();
  }
  set totalPrice(int val){
    _totalPrice=val;
    notifyListeners();
  }
//  void increment() {
//    items = items + count;
//    notifyListeners();
//  }
//
//  void decrement() {
//    items = items - count;
//    notifyListeners();
//  }

  void incrementCount() {
    count = count + 1;
    notifyListeners();
  }

  void decrementCount() {
    count = count - 1;
    notifyListeners();
  }

  void cartPageIncremnet(int id){
    var indexNo = _cartList.indexWhere((f) => f['id'] ==id);
    _cartList[indexNo].update('product_qty', (v)=>v+1);
    countTotalNumberOfProduct();
    totalProductsPrice();
    notifyListeners();
  }
  void cartPageDecremnet(int id){
    var indexNo = _cartList.indexWhere((f) => f['id'] ==id);
    _cartList[indexNo].update('product_qty', (v)=>v-1);
    countTotalNumberOfProduct();
    totalProductsPrice();
     notifyListeners();
  }

  void countTotalNumberOfProduct(){
      _totalNumberOfProductCount=0;
       for(int i=0;i<_cartList.length;i++){
         _totalNumberOfProductCount+= _cartList[i]['product_qty'];
       }
  }


  void removeAllItem(){
    _cartList.clear();
    countTotalNumberOfProduct();
    totalProductsPrice();
    notifyListeners();
  }

  void orderDetaisList(){
    _orderDetails.clear();
    for(int i=0;i<_cartList.length;i++){
      _orderDetails.add({
        "product_id":_cartList[i]['id'],
        "product_qty":_cartList[i]['product_qty'],
        "product_price":_cartList[i]['sale_price']
      });
   //   print("++++++++++++");

    }
//    _orderDetails.forEach((element) {
//      print(element['product_id']);
//      print(element['product_qty']);
//      print(element['product_price']);
//    });


  }


}