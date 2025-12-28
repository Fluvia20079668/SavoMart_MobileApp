import 'package:savomart/domain/entities/app_error.dart';
import 'package:savomart/utils/debug_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'components/variant_bottom_shhet.dart';

class TestProductDetailsController extends ChangeNotifier {
  Map<String, dynamic>? productDetails;

  ProductDetailsChangeField? productDetailsChangeField;

  List initialState = [];
  String? choosenSku;
  String combinationErrorText = "";

  List optionDataDummy = [
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false]
  ];
  List optionData = [
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false]
  ];

  AppError? appError;
  bool isLoading = true;
  makeLoading() {
    isLoading = true;
    notifyListeners();
  }

  makeNotLoading() {
    isLoading = false;
    notifyListeners();
  }

  retry() async {
    makeLoading();
    getData();
  }

  getData() async {
    await Future.delayed(const Duration(seconds: 1));
    productDetails = {
      "success": 1,
      "error": "",
      "data": {
        "product_options": [
          {
            "label": "Color",
            "option_data": ["Red", "Blue", "Black"],
            "value": [
              {"default_title": "Red", "sku": "sku_4gb_64gb_red"},
              {"default_title": "Red", "sku": "sku_4gb_128gb_red"},
              {"default_title": "Red", "sku": "sku_8gb_64gb_red"},
              {"default_title": "Red", "sku": "sku_8gb_128gb_red"},
              {"default_title": "Blue", "sku": "sku_4gb_64gb_blue"},
              {"default_title": "Blue", "sku": "sku_4gb_128gb_blue"},
              {"default_title": "Blue", "sku": "sku_8gb_64gb_blue"},
              {"default_title": "Blue", "sku": "sku_8gb_128gb_blue"}
            ]
          },
          {
            "label": "Storage",
            "option_data": ["64GB", "128GB"],
            "value": [
              {"default_title": "64GB", "sku": "sku_4gb_64gb_red"},
              {"default_title": "128GB", "sku": "sku_4gb_128gb_red"},
              {"default_title": "64GB", "sku": "sku_8gb_64gb_red"},
              {"default_title": "128GB", "sku": "sku_8gb_128gb_red"},
              {"default_title": "64GB", "sku": "sku_4gb_64gb_blue"},
              {"default_title": "128GB", "sku": "sku_4gb_128gb_blue"},
              {"default_title": "64GB", "sku": "sku_8gb_64gb_blue"},
              {"default_title": "128GB", "sku": "sku_8gb_128gb_blue"}
            ]
          },
          {
            "label": "Ram",
            "option_data": ["4GB", "8GB"],
            "value": [
              {"default_title": "4GB", "sku": "sku_4gb_64gb_red"},
              {"default_title": "4GB", "sku": "sku_4gb_128gb_red"},
              {"default_title": "4GB", "sku": "sku_4gb_64gb_blue"},
              {"default_title": "4GB", "sku": "sku_4gb_128gb_blue"},
              {"default_title": "8GB", "sku": "sku_8gb_64gb_blue"},
              {"default_title": "8GB", "sku": "sku_8gb_128gb_blue"},
              {"default_title": "8GB", "sku": "sku_8gb_64gb_red"},
              {"default_title": "8GB", "sku": "sku_8gb_128gb_red"}
            ]
          }
        ],
        "Child_product": [
          {
            "product_sku": "sku_4gb_64gb_red",
            "product_id": "12345",
            "product_name": "iphone 13 pro max Red 4GB 64GB",
            "product_price": "₹67,254.00",
            "product_image": [
              "https://m.media-amazon.com/images/I/81THMIbaErL._SL1500_.jpg"
            ]
          },
          {
            "product_sku": "sku_4gb_128gb_red",
            "product_id": "12458",
            "product_name": "iphone 13 pro max Red 4GB 128GB",
            "product_price": "₹112,254.00",
            "product_image": [
              "https://www.onmartindia.com/wp-content/uploads/2021/09/61Krpl7FGyL._SL1500_.jpg"
            ]
          },
          {
            "product_sku": "sku_8gb_64gb_red",
            "product_id": "12589",
            "product_name": "iphone 13 pro max Red 8GB 64GB",
            "product_price": "₹70,254.00",
            "product_image": [
              "https://m.media-amazon.com/images/I/81THMIbaErL._SL1500_.jpg"
            ]
          },
          {
            "product_sku": "sku_8gb_128gb_red",
            "product_id": "78545",
            "product_name": "iphone 13 pro max Red 8GB 128GB",
            "product_price": "₹130,254.00",
            "product_image": [
              "https://www.onmartindia.com/wp-content/uploads/2021/09/61Krpl7FGyL._SL1500_.jpg"
            ]
          },
          {
            "product_sku": "sku_4gb_64gb_blue",
            "product_id": "12458",
            "product_name": "iphone 13 pro max Blue 4GB 64GB",
            "product_price": "₹68,000.00",
            "product_image": [
              "https://www.onmartindia.com/wp-content/uploads/2021/09/61Krpl7FGyL._SL1500_.jpg"
            ]
          },
          {
            "product_sku": "sku_4gb_128gb_blue",
            "product_id": "12458",
            "product_name": "iphone 13 pro max Blue 4GB 128GB",
            "product_price": "₹112,000.00",
            "product_image": [
              "https://www.onmartindia.com/wp-content/uploads/2021/09/61Krpl7FGyL._SL1500_.jpg"
            ]
          },
          {
            "product_sku": "sku_8gb_64gb_blue",
            "product_id": "12458",
            "product_name": "iphone 13 pro max Blue 8GB 64GB",
            "product_price": "₹70,000.00",
            "product_image": [
              "https://www.onmartindia.com/wp-content/uploads/2021/09/61Krpl7FGyL._SL1500_.jpg"
            ]
          },
          {
            "product_sku": "sku_8gb_128gb_blue",
            "product_id": "12458",
            "product_name": "iphone 13 pro max Blue 8GB 128GB",
            "product_price": "₹130,000.00",
            "product_image": [
              "https://www.onmartindia.com/wp-content/uploads/2021/09/61Krpl7FGyL._SL1500_.jpg"
            ]
          }
        ],
        "product_wishlisted": false,
        "product_cart": false,
        "product_id": "2419",
        "product_name": "iphone 13 pro max",
        "product_short_description":
            "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
        "product_description":
            "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
        "product_price": "₹66,254.00",
        "product_sku": "iphone 13 pro max",
        "Stock_qty": 4,
        "Stock_status": true,
        "product_image": [
          "https://expertphotography.b-cdn.net/wp-content/uploads/2018/09/product-photography-types-water-bottle.jpg"
        ],
        "product_url": "gjffjgfgffjjfj"
      }
    };

    setInitialData(productDetails);
    makeNotLoading();
  }

  setInitialData(Map<String, dynamic>? productDetails) {
    productDetailsChangeField = ProductDetailsChangeField(
        productId: productDetails!["data"]["product_id"],
        productName: productDetails["data"]["product_name"],
        productPrice: productDetails["data"]["product_price"],
        productSku: productDetails["data"]["product_sku"],
        productDescription: productDetails["data"]["product_description"],
        productQty: productDetails["data"]["Stock_qty"],
        productImage: productDetails["data"]["product_image"]);

    initialState = [];

    if (productDetails["data"]["product_options"] != null) {
      if (productDetails["data"]["product_options"].length > 0) {
        for (var i = 0;
            i < productDetails["data"]["product_options"].length;
            i++) {
          initialState.add(
              productDetails["data"]["product_options"][i]["option_data"][0]);

          for (var j = 0;
              j <
                  productDetails["data"]["product_options"][i]["option_data"]
                      .length;
              j++) {
            if (j == 0) {
              optionDataDummy[i][j] = true;
            } else {
              optionDataDummy[i][j] = false;
            }
          }
        }
      }
      optionData = optionDataDummy;
      productChange();
      notifyListeners();
    }

    consoleLog("optionData  : ");
    consoleLog(optionData);
    consoleLog("initialState  : ");
    consoleLog(initialState);
    notifyListeners();
  }

  attributeClick(String data, int index, int pos) {
    consoleLog("option_data  :  $index");
    consoleLog("product_option  :  $pos");
    choosenSku = null;
    if (index == 0) {
      initialState[0] = data;

      productDetails!["data"]["product_options"][index]["option_data"]
          .asMap()
          .forEach((position, option) {
        if (pos == position) {
          optionDataDummy[index][position] = true;
        } else {
          optionDataDummy[index][position] = false;
        }
      });

      optionData = optionDataDummy;
      notifyListeners();
    } else if (index == 1) {
      initialState[1] = data;

      productDetails!["data"]["product_options"][index]["option_data"]
          .asMap()
          .forEach((position, option) {
        if (pos == position) {
          optionDataDummy[index][position] = true;
        } else {
          optionDataDummy[index][position] = false;
        }
      });

      optionData = optionDataDummy;
      notifyListeners();
    } else if (index == 2) {
      initialState[2] = data;

      productDetails!["data"]["product_options"][index]["option_data"]
          .asMap()
          .forEach((position, option) {
        if (pos == position) {
          optionDataDummy[index][position] = true;
        } else {
          optionDataDummy[index][position] = false;
        }
      });

      optionData = optionDataDummy;
      notifyListeners();
    }

    productChange();
  }

  renderConfigProduct() {
    productDetails!["data"]["Child_product"].asMap().forEach((index, item) {
      if (item["product_sku"] == choosenSku) {
        productDetailsChangeField = ProductDetailsChangeField(
            productId: item["product_id"],
            productName: item["product_name"],
            productPrice: item["product_price"],
            productSku: item["product_sku"],
            productDescription: productDetails!["data"]["product_description"],
            productQty: productDetails!["data"]["Stock_qty"],
            productImage: item["product_image"]);
      }
    });
    notifyListeners();
  }

  productChange() {
    switch (productDetails!["data"]["product_options"].length) {
      case 1:
        productDetails!["data"]["product_options"][0]["value"]
            .asMap()
            .forEach((index, value) => {
                  if (value["default_title"] == initialState[0])
                    {choosenSku = value["sku"]}
                });

        break;

      case 2:
        productDetails!["data"]["product_options"][0]["value"]
            .asMap()
            .forEach((index, value) => {
                  consoleLog("aaaaaaaaaaaaa"),
                  if (value["default_title"] == initialState[0])
                    {
                      consoleLog("bbbbbbbbbbbbbb"),
                      productDetails!["data"]["product_options"][1]["value"]
                          .asMap()
                          .forEach((index, item) => {
                                consoleLog("ddddddddddddd"),
                                if (value["sku"] == item["sku"])
                                  {
                                    consoleLog("eeeeeeeeeee"),
                                    if (item["default_title"] ==
                                        initialState[1])
                                      {choosenSku = item["sku"]}
                                  }
                              })
                    }
                });

        break;

      case 3:
        productDetails!["data"]["product_options"][0]["value"]
            .asMap()
            .forEach((index, value) => {
                  consoleLog("aaaaaaaaaaaaa"),
                  if (value["default_title"] == initialState[0])
                    {
                      consoleLog("bbbbbbbbbbbbbb"),
                      productDetails!["data"]["product_options"][1]["value"]
                          .asMap()
                          .forEach((index, item) => {
                                consoleLog("ddddddddddddd"),
                                if (value["sku"] == item["sku"])
                                  if (item["default_title"] == initialState[1])
                                    {
                                      productDetails!["data"]["product_options"]
                                              [2]["value"]
                                          .asMap()
                                          .forEach((index, data) => {
                                                if (item["sku"] == data["sku"])
                                                  {
                                                    if (data["default_title"] ==
                                                        initialState[2])
                                                      {choosenSku = data["sku"]}
                                                  }
                                              })
                                    }
                                // {
                                //   consoleLog("eeeeeeeeeee"),
                                //   if (item["default_title"] ==
                                //       initialState[1])
                                //     {choosenSku = item["sku"]}
                                // }
                              })
                    }
                });

        break;
    }

    consoleLog("choosen sku: $choosenSku");
    if (choosenSku == null) {
      combinationErrorText =
          "This combination doesn't exist.Choose another variant.";
    } else {
      combinationErrorText = "";
      renderConfigProduct();
    }
    notifyListeners();
  }

  variantClick(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: false,
        context: context,
        builder: (BuildContext context) {
          return const VariantBottomSheet();
        });
  }
}

class ProductDetailsChangeField extends Equatable {
  final String? productId;
  final String? productName;
  final String? productPrice;
  final String? productSku;
  final String? productDescription;
  final int? productQty;
  final List<String>? productImage;

  const ProductDetailsChangeField(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productSku,
      this.productDescription,
      this.productQty,
      this.productImage});

  @override
  List<Object?> get props => [];
}
