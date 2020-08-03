class Service {

  String serviceId;
  String serviceName;
  String price;
  
  Service({this.serviceId,this.serviceName,this.price});
 
  // factory Service.fromJson(Map<String, dynamic> json) {
  //   return Service(

  //     serviceId: json["_id"] as String,
  //     serviceName: json["proserName"] as String,
  //     price: json["proserCost"] as String,
  //   );
  // }

    Service.fromJson(Map<String, dynamic> json) {
    serviceId = json['_id'];
    serviceName = json['proserName'];
    price = json['proserCost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.serviceId;
    data['proserName'] = this.serviceName;
    data['proserCost'] = this.price;
    return data;
  }
}