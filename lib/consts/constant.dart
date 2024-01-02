import 'package:shop_smart/Models/category_model.dart';
import 'package:shop_smart/Services/assets_services_manger.dart';

class AppConstatnt {
  static List<String> imageSwiper = [
    AssetsManger.imageBanner1,
    AssetsManger.imageBanner2,
  ];

  static List<CategorModel> categoryList = [
    CategorModel(
        image: AssetsManger.imageMobiles,
        nameImage: "Phone",
        id: AssetsManger.imageMobiles),
    CategorModel(
        image: AssetsManger.imageElectronics,
        nameImage: "Elcotronics",
        id: AssetsManger.imageElectronics),
    CategorModel(
        image: AssetsManger.imageCosmetics,
        nameImage: "Cosmetics",
        id: AssetsManger.imageCosmetics),
    CategorModel(
        image: AssetsManger.imageShoes,
        nameImage: "Shoes",
        id: AssetsManger.imageShoes),
    CategorModel(
        image: AssetsManger.imageWatch,
        nameImage: "watch",
        id: AssetsManger.imageWatch),
    CategorModel(
        image: AssetsManger.imagePc, nameImage: "Pc", id: AssetsManger.imagePc),
    CategorModel(
        image: AssetsManger.imageBook,
        nameImage: "book",
        id: AssetsManger.imageBook),
    CategorModel(
        image: AssetsManger.imageFashion,
        nameImage: "fashion",
        id: AssetsManger.imageFashion)
  ];
}
