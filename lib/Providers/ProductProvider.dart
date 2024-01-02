import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_smart/Models/product_models.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> product = [];
  List<ProductModel> get getProduct {
    return product;
  }

  ProductModel? findByProductId(String productId) {
    if (product.where((element) => element.productId == productId).isEmpty) {
      return null;
    }
    return product.firstWhere((element) => element.productId == productId);
  }

  List<ProductModel> findByCategoey({required String category}) {
    List<ProductModel> ctgList = product
        .where((element) => element.productCategory
            .toLowerCase()
            .contains(category.toLowerCase()))
        .toList();
    return ctgList;
  }

  List<ProductModel> searchQuery(
      {required String textSearch, required List<ProductModel> passedList}) {
    List<ProductModel> searchList = passedList
        .where((element) => element.productTitle
            .toLowerCase()
            .contains(textSearch.toLowerCase()))
        .toList();
    return searchList;
  }

  final productDb = FirebaseFirestore.instance.collection("products");
  Future<List<ProductModel>> fetchProducts() async {
    try {
      await productDb
          .orderBy('createdAt', descending: false)
          .get()
          .then((productSnapshot) {
        product.clear();
        // products = []
        for (var element in productSnapshot.docs) {
          product.insert(0, ProductModel.fromFirestore(element));
        }
      });
      notifyListeners();
      return product;
    } catch (e) {
      rethrow;
    }
  }
/* List<ProductModels> product = [
    /*phones*/
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "1399.99",
        productTitle: 'Apple iphone 14 pro (128GB) - Gold',
        productCategroy: 'Phone',
        productDecription:
            "6.1 inch Super Retina XDR display Promotion and always-on display. Dynamic ISL",
        productImage:
            "https://img.freepik.com/premium-photo/smartphone-with-blank-screen-modern-frame-less-design-isolated-white_745615-364.jpg?size=626&ext=jpg&ga=GA1.1.1809616900.1700058685&semt=ais",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productImage:
            "https://img.freepik.com/premium-vector/isolated-pink-3d-new-phone-model-template-realistic-smartphone-ultra-note-mockup-front-back-view-vector-illustration_541075-579.jpg?size=626&ext=jpg&ga=GA1.1.1809616900.1700058685&semt=ais",
        productPrice: "122.99",
        productTitle:
            "Samsoung Glaxy s22 ultra 5G - 256GB - phontom Black (ulocked)",
        productCategroy: 'Phone',
        productDecription:
            "About this item\nPro Grade Camera:Zoom in close with 100k Space  Zoom, and take phc     ",
        productQuantity: "4752"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "1399.99",
        productTitle: 'Apple iphone 14 pro (128GB) - whit',
        productCategroy: 'Phone',
        productDecription:
            "6.1 inch Super Retina XDR display Promotion and always-on display. Dynamic ISL",
        productImage:
            "https://img.freepik.com/premium-vector/realistic-smartphone_97886-3515.jpg?size=626&ext=jpg&ga=GA1.1.1809616900.1700058685&semt=ais",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "1399.99",
        productTitle:
            "Samsoung Glaxy s22 ultra 5G - 256GB - phontom Black (ulocked)",
        productCategroy: 'Phone',
        productDecription:
            "About this item\nPro Grade Camera:Zoom in close with 100k Space  Zoom, and take phc     ",
        productImage:
            "https://img.freepik.com/premium-vector/isolated-smartphone-pixel-pro-mockup-vector-illustration_541075-203.jpg?size=626&ext=jpg&ga=GA1.1.1809616900.1700058685&semt=ais",
        productQuantity: "5446"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "1399.99",
        productTitle: 'Apple iphone 14 pro (128GB) - Gold',
        productCategroy: 'Phone',
        productDecription:
            "6.1 inch Super Retina XDR display Promotion and always-on display. Dynamic ISL",
        productImage:
            "https://img.freepik.com/premium-photo/smartphone-with-blank-screen-modern-frame-less-design-isolated-white_745615-364.jpg?size=626&ext=jpg&ga=GA1.1.1809616900.1700058685&semt=ais",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productImage:
            "https://img.freepik.com/premium-vector/isolated-pink-3d-new-phone-model-template-realistic-smartphone-ultra-note-mockup-front-back-view-vector-illustration_541075-579.jpg?size=626&ext=jpg&ga=GA1.1.1809616900.1700058685&semt=ais",
        productPrice: "122.99",
        productTitle:
            "Samsoung Glaxy s22 ultra 5G - 256GB - phontom Black (ulocked)",
        productCategroy: 'Phone',
        productDecription:
            "About this item\nPro Grade Camera:Zoom in close with 100k Space  Zoom, and take phc     ",
        productQuantity: "4752"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "1399.99",
        productTitle: 'Apple iphone 14 pro (128GB) - whit',
        productCategroy: 'Phone',
        productDecription:
            "6.1 inch Super Retina XDR display Promotion and always-on display. Dynamic ISL",
        productImage:
            "https://img.freepik.com/premium-vector/realistic-smartphone_97886-3515.jpg?size=626&ext=jpg&ga=GA1.1.1809616900.1700058685&semt=ais",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "1399.99",
        productTitle:
            "Samsoung Glaxy s22 ultra 5G - 256GB - phontom Black (ulocked)",
        productCategroy: 'Phone',
        productDecription:
            "About this item\nPro Grade Camera:Zoom in close with 100k Space  Zoom, and take phc     ",
        productImage:
            "https://img.freepik.com/premium-vector/isolated-smartphone-pixel-pro-mockup-vector-illustration_541075-203.jpg?size=626&ext=jpg&ga=GA1.1.1809616900.1700058685&semt=ais",
        productQuantity: "5446"),

    /* electronics*/
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "450.99",
        productTitle: 'Remote control',
        productCategroy: 'Elcotronics',
        productDecription: "Remote control radio model in the hands of man",
        productImage:
            "https://media.istockphoto.com/id/505674704/photo/remote-control-in-hand-man.jpg?s=1024x1024&w=is&k=20&c=HR87pNeBkc8xAGvepjA7U4fwrHN-Phn9StMjoOp-RNs=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "50.63",
        productTitle: 'Old cassette player and headphones',
        productCategroy: 'Elcotronics',
        productDecription: "Old cassette player and headphones isolated",
        productImage:
            "https://media.istockphoto.com/id/1207566416/photo/old-cassette-player-and-headphones.jpg?s=612x612&w=is&k=20&c=M8TYyBRsXJw-2r_M4y8NgUeTWpKz_MpJdmjCWgsJfxc=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "850.99",
        productTitle: 'Modern acoustic systems with lcd panel',
        productCategroy: 'Elcotronics',
        productDecription: "Modern acoustic systems with lcd panel",
        productImage:
            "https://media.istockphoto.com/id/1441874787/photo/modern-acoustic-systems-with-lcd-panel.jpg?s=612x612&w=is&k=20&c=TWm93CMca938DZe1zYaioYdgLXL60pLHXESr3eiF6dc=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "499.99",
        productTitle: 'Hard drive with network cable ',
        productCategroy: 'Elcotronics',
        productDecription: "Hard drive with network cable ",
        productImage:
            "https://media.istockphoto.com/id/1259106600/photo/hard-drive-with-network-cable.jpg?s=612x612&w=is&k=20&c=-Ud1FkbAC8SNU2fLuIf81KV1XSTjKh9i1KnWL2jrbf0=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "185.99",
        productTitle: 'Flatbed scanner isolated ',
        productCategroy: 'Elcotronics',
        productDecription: "Flatbed scanner isolated ",
        productImage:
            "https://media.istockphoto.com/id/186008307/photo/flatbed-scanner-isolated-on-white.jpg?s=612x612&w=is&k=20&c=ItbP0Fhmc-N5E20wVa7iPmSVhp6tqV2b_OCZK4nCfes=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "150.63",
        productTitle: 'Black office telephone isolated',
        productCategroy: 'Elcotronics',
        productDecription: "Black office telephone isolated",
        productImage:
            "https://media.istockphoto.com/id/186062183/photo/black-office-telephone-isolated-on-white.jpg?s=612x612&w=is&k=20&c=5dgoN56mmkoYn3N0uu_4LXaVunBq2LvSMtxxg7gK9FQ=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "250.99",
        productTitle: 'Medical Fetal Monitor Isolated',
        productCategroy: 'Elcotronics',
        productDecription: "Medical Fetal Monitor Isolated",
        productImage:
            "https://media.istockphoto.com/id/1217728750/photo/medical-fetal-monitor-isolated.jpg?s=612x612&w=is&k=20&c=ROgSzSf-TRWnxxZyI7A2C1lgDfkDRVYd2ssPJGdB6LA=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "98.99",
        productTitle: 'HLaptop power adapter',
        productCategroy: 'Elcotronics',
        productDecription: "Laptop power adapter ",
        productImage:
            "https://media.istockphoto.com/id/1407371292/photo/laptop-power-adapter-on-white-background-collage.jpg?s=612x612&w=is&k=20&c=Y12BdIka35JLJaZU7KzArt_7zua80jaxm15rKG3fTc0=",
        productQuantity: "3675"),

/*cosmetics*/
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "20.99",
        productTitle: 'Blue pigment poweder isolated',
        productCategroy: 'cosmetics',
        productDecription: "Blue pigment poweder isolated",
        productImage:
            "https://media.istockphoto.com/id/1564617308/photo/blue-pigment-poweder-isolated-on-white.jpg?s=612x612&w=0&k=20&c=1UGoJsyzxxH8gZTwH-LA1Em2UA9uPaXK_V2dKZGuiW8=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "50.63",
        productTitle: ' makeup products out of a red purse ',
        productCategroy: 'cosmetics',
        productDecription: "Old cassette player and headphones isolated",
        productImage:
            "https://media.istockphoto.com/id/1628666627/photo/cosmetics-makeup-products-out-of-a-red-purse-isolated-on-white-transparent-background.jpg?s=612x612&w=is&k=20&c=khb4WRs4ARKo8NeQErh1S-JFUWmWgkfiKdDWyYyRRzU=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "32.99",
        productTitle:
            'Liquid foundation in bottle and splashes of makeup product',
        productCategroy: 'cosmetics',
        productDecription:
            "Liquid foundation in bottle and splashes of makeup product",
        productImage:
            "https://media.istockphoto.com/id/1707024920/photo/liquid-foundation-in-bottle-and-splashes-of-makeup-product-on-light-background.jpg?s=612x612&w=is&k=20&c=QOqztl6DpXBgtmVwMhhnnQx1PGibp6pN_DXBVT56isw=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "220.99",
        productTitle:
            'Beauty containers for shampoo, lotion, cream. Cream tubes',
        productCategroy: 'cosmetics',
        productDecription:
            "Beauty containers for shampoo, lotion, cream. Cream tubes",
        productImage:
            "https://media.istockphoto.com/id/1493127225/photo/beauty-containers-for-shampoo-lotion-cream-cream-tubes-on-a-white-background.jpg?s=612x612&w=is&k=20&c=162r5fujfO9a-Zah_-7bFyYTJJioEgEhQddtds9akMo=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "93.99",
        productTitle: 'Makeup and cosmetics  ',
        productCategroy: 'cosmetics',
        productDecription: "Makeup and cosmetics  ",
        productImage:
            "https://media.istockphoto.com/id/176475192/photo/makeup-and-cosmetics.jpg?s=612x612&w=is&k=20&c=fTSUZEMAnLR6BKPybp45I_IJPESQt2TAdmEKkX2Xako=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "150.63",
        productTitle: 'Silver bottle for cosmetic serum product',
        productCategroy: 'cosmetics',
        productDecription: "Silver bottle for cosmetic serum product",
        productImage:
            "https://media.istockphoto.com/id/1333124009/photo/silver-bottle-for-cosmetic-serum-product-design-mock-up-isolated-on-white-background.jpg?s=612x612&w=is&k=20&c=KYRRhRewmdd6JysB17eD6VdZwIK2kydv-f2W5C0GUrU=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "132.99",
        productTitle: 'makeup',
        productCategroy: 'cosmetics',
        productDecription: "of pomade, powder, mirror, mascara",
        productImage:
            "https://media.istockphoto.com/id/1371974987/photo/3d-makeup-illustrations-collection-on-white-set-of-3d-cosmetic-illustrations-on-white.webp?s=612x612&w=is&k=20&c=xC6-ON-71HcGPDDmlAGXbjsebpewFH7qfRF-ABaL3fg=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "79.99",
        productTitle: 'Perfume bottle and packaging box',
        productCategroy: 'cosmetics',
        productDecription: "Mock Up, Beauty, Beauty Product, Blank, Body Care",
        productImage:
            "https://media.istockphoto.com/id/1066462974/photo/perfume-bottle-and-packaging-box-on-isolated-white-background-ready-for-your-design.jpg?s=612x612&w=0&k=20&c=3gwYJk7KCOmz-bbNLNMYQJv9_EUqxJdBHIc2QbW1vzA=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "85.99",
        productTitle: 'Perfume',
        productCategroy: 'cosmetics',
        productDecription:
            "Perfume Sprayer, Bottle, Single Object, Beauty Product",
        productImage:
            "https://media.istockphoto.com/id/1057878470/photo/perfume-bottle-and-packaging-box.jpg?s=612x612&w=0&k=20&c=S-qCY8t9FrEO9qsiEcmuYzleiyGPVi5P4fABPilOyMg=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "79.99",
        productTitle: 'Set of female cosmetic',
        productCategroy: 'cosmetics',
        productDecription:
            "Set of female cosmetic products (perfume, body sprays, roll-on and stick antiperspirant deodorants)",
        productImage:
            "https://media.istockphoto.com/id/928044166/photo/set-of-female-cosmetic-products.jpg?s=612x612&w=0&k=20&c=ev8ZpA_YXLRSnlLH9CnYwitl6sFyIVERVBA2Sj3rdEM=",
        productQuantity: "3675"),

/*shoes*/
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "220.99",
        productTitle: 'Pair of white leather trainers ',
        productCategroy: 'shoes',
        productDecription: "Pair of white leather trainers ",
        productImage:
            "https://media.istockphoto.com/id/1324847242/photo/pair-of-white-leather-trainers-on-white-background.jpg?s=612x612&w=is&k=20&c=qcxnIeZv7cTHTsmH0WYnjTw8SfKwo26XJdDhRnkoXjc=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "150.63",
        productTitle: ' White sports sneakers ',
        productCategroy: 'shoes',
        productDecription: "White sports sneakers",
        productImage:
            "https://media.istockphoto.com/id/1366527868/photo/white-sports-sneakers-on-a-white-background.jpg?s=1024x1024&w=is&k=20&c=9ZHTopLJUEm3B_3ZDRPShe64Uev0s1F7hvluAJ2EFOg=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "232.99",
        productTitle: 'Black sports sneakers',
        productCategroy: 'shoes',
        productDecription: "Black sports sneakers",
        productImage:
            "https://media.istockphoto.com/id/1365744714/photo/black-sports-sneakers-on-a-white-background.jpg?s=612x612&w=is&k=20&c=okZEaa5iai4jfdU7Y1KmdzElh8QgliNWbLgL5fbneDo=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "320.99",
        productTitle: 'Yellow boots ',
        productCategroy: 'shoes',
        productDecription: "Yellow boots ",
        productImage:
            "https://media.istockphoto.com/id/474862754/photo/yellow-boots.jpg?s=612x612&w=is&k=20&c=tiT_9lOy22kxybYOdI51IILJDCrsdPB10QsYaRplMVE=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "450.99",
        productTitle: 'Soccer shoe ',
        productCategroy: 'shoes',
        productDecription: "football boot",
        productImage:
            "https://media.istockphoto.com/id/589953244/photo/soccer-shoe-isolated.jpg?s=612x612&w=is&k=20&c=tNpQdWYB1oDUpHvMIEFI25Y3YH2OlbP8EPQW9okaf0w=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "320.63",
        productTitle: 'Black Boot',
        productCategroy: 'shoes',
        productDecription: "Hills Black",
        productImage:
            "https://media.istockphoto.com/id/155961534/photo/boot.jpg?s=612x612&w=is&k=20&c=QPUK1p2hpksXinnFRs5MFph3BzBqVupbbrrSOYLdDLE=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "332.99",
        productTitle: 'Male Black Leather Shoe ',
        productCategroy: 'shoes',
        productDecription: "Male Black Leather Shoe",
        productImage:
            "https://media.istockphoto.com/id/825891382/photo/male-black-leather-shoe-on-white-background.jpg?s=612x612&w=is&k=20&c=iECgIt8xa-BDTnacJN2B4ONic_W2Mu3IoZ808pbZH2g=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "379.99",
        productTitle: 'Male brown leather shoe ',
        productCategroy: 'shoes',
        productDecription: "Male brown leather shoe ",
        productImage:
            "https://media.istockphoto.com/id/1031343662/photo/male-brown-leather-shoe-on-white-background-isolated-product-comfortable-footwear.jpg?s=612x612&w=is&k=20&c=E3SUMb87M2OoWlEI62aKhNNLLMJDGCCxQEHuVfpFU-Y=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "185.99",
        productTitle: 'Black shoes',
        productCategroy: 'shoes',
        productDecription: "Black shoes",
        productImage:
            "https://media.istockphoto.com/id/91363978/photo/black-shoes.jpg?s=1024x1024&w=is&k=20&c=qOntXUjo4QEhEoU63PrGZwIgKc15q2wLjPcL7j3thrU=",
        productQuantity: "3675"),
    ProductModels(
        productId: const Uuid().v4(),
        productPrice: "179.99",
        productTitle: 'Modern female ',
        productCategroy: 'shoes',
        productDecription: "Modern female",
        productImage:
            "https://media.istockphoto.com/id/92279455/photo/modern-female-shoes.jpg?s=612x612&w=is&k=20&c=P4PNTj36lyY08SP7Vdlz8iqNgQ-3cZhh8y1DMRa-9XU=",
        productQuantity: "3675"),
  ];
*/

  Stream<List<ProductModel>> fetchProductStream() {
    try {
      return productDb.snapshots().map((snapshoot) {
        product.clear();
        for (var element in snapshoot.docs) {
          product.insert(
            0,
            ProductModel.fromFirestore(element),
          );
        }
        return product;
      });
    } catch (error) {
      rethrow;
    }
  }
}
