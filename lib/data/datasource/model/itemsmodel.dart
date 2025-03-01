class ItemsModel {
  String? itemsId;
  String? itemsNameEn;
  String? itemsNameAr;
  String? itemsDescEn;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDiscountPrice; // تصحيح الحقل هنا
  String? itemsDate;
  String? itemsCat;
  String? categoriesId;
  String? categoriesNameEn;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? favorite;

  ItemsModel({
    this.itemsId,
    this.itemsNameEn,
    this.itemsNameAr,
    this.itemsDescEn,
    this.itemsDescAr,
    this.itemsDiscountPrice, // تعديل الحقل هنا
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsDate,
    this.itemsCat,
    this.categoriesId,
    this.categoriesNameEn,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesDatetime,
    this.favorite,
  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsNameEn = json['items_name_en'];
    itemsNameAr = json['items_name_ar'];
    itemsDescEn = json['items_desc_en'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDiscountPrice =
        json['items_discount_price']; // التأكد من صحة الحقل هنا
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    categoriesId = json['categories_id'];
    categoriesNameEn = json['categories_name_en'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
  }

  double get itemsPriceDiscount {
    double price = double.tryParse(itemsPrice ?? '0') ?? 0;
    double discount = double.tryParse(itemsDiscount ?? '0') ?? 0;
    return price - (price * (discount / 100));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id'] = itemsId;
    data['items_name_en'] = itemsNameEn;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc_en'] = itemsDescEn;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_discount_price'] = itemsDiscountPrice; // تعديل هنا أيضاً
    data['items_date'] = itemsDate;
    data['items_cat'] = itemsCat;
    data['categories_id'] = categoriesId;
    data['categories_name_en'] = categoriesNameEn;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    return data;
  }
}
