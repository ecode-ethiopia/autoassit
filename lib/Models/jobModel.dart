class Job {
  String jobId;
  String date;
  String vNumber;
  String vName;
  String cusId;
  String cusName;
  String total;
  String status;
  String jobno;
  List<ServiceData> serviceData;
  List<ProductData> productData;

  Job({this.jobId, this.date, this.vNumber,this.vName,this.cusId,this.cusName,this.status,this.total,this.jobno,this.serviceData,this.productData});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      jobId: json["_id"] as String,
      date: json["date"] as String,
      vNumber: json["vnumber"] as String,
      vName: json["vName"] as String,
      cusId: json["cusId"] as String,
      cusName: json["cusName"] as String,
      total: json["total"] as String,
      status: json["status"] as String,
      jobno: json["jobNo"] as String,
      serviceData: (json['services'] as List)?.map((i) => ServiceData.fromJson(i))?.toList(),
      productData: (json['products'] as List)?.map((i) => ProductData.fromJson(i))?.toList(),
    );
  }
}

class ServiceData {
  String serviceName;
  String serviceId;
  String cost;

  ServiceData({this.serviceName, this.serviceId,this.cost});

  ServiceData.fromJson(Map<String, dynamic> json) {
    serviceName = json['serviceName'];
    serviceId = json['_id'];
    cost = json['serviceCost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceName'] = this.serviceName;
    data['_id'] = this.serviceId;
    data['serviceCost'] = this.cost;
    return data;
  }
}

class ProductData {
  String productName;
  String productId;
  String productAmount;
  String productCost;

  ProductData({this.productName, this.productId,this.productAmount,this.productCost});

  ProductData.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    productId = json['_id'];
    productAmount = json['productAmount'];
    productCost = json['productCost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['_id'] = this.productId;
    data['productAmount'] = this.productAmount;
    data['productCost'] = this.productCost;
    return data;
  }
}

