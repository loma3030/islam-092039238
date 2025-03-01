class MyFavoriteModel {
  String? favoriteId;
  String? favoriteUsersid;
  String? favoriteItemsid;
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
  String? itemsDate;
  String? itemsCat;
  String? usersId;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUsersid,
      this.favoriteItemsid,
      this.itemsId,
      this.itemsNameEn,
      this.itemsNameAr,
      this.itemsDescEn,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCat,
      this.usersId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteItemsid = json['favorite_itemsid'];
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
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorite_id'] = favoriteId;
    data['favorite_usersid'] = favoriteUsersid;
    data['favorite_itemsid'] = favoriteItemsid;
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
    data['items_date'] = itemsDate;
    data['items_cat'] = itemsCat;
    data['users_id'] = usersId;
    return data;
  }
}
