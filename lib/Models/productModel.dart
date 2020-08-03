class Product {

  String productId;
  String productName;
  String price;
  
  Product({this.productId,this.productName,this.price});
 
  // factory Product.fromJson(Map<String, dynamic> json) {
  //   return Product(

  //     productId: json["_id"] as String,
  //     productName: json["proserName"] as String,
  //     price: json["proserCost"] as String,
  //   );
  // }
  Product.fromJson(Map<String, dynamic> json) {
    productId = json['_id'];
    productName = json['proserName'];
    price = json['proserCost'];
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.productId;
    data['proserName'] = this.productName;
    data['proserCost'] = this.price;
    return data;
  }
}