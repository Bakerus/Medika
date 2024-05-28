import 'package:get/get.dart';
import 'package:medika/app/data/models/articles.dart';
import 'package:medika/app/data/services/articlesProviders.dart';

class EdukateController extends GetxController {
  //TODO: Implement EdukateController

  final articleLists = <Articles>[].obs;
  final articleListsGeneral = <Articles>[].obs;
  final articleListsVIH = <Articles>[].obs;

  final ArticlesProviders articlesProvider = ArticlesProviders();

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    final articles = await articlesProvider.get_all_articles();
    // articleLists.assignAll(articles);
    articleListsGeneral.assignAll(articles.where((element) => element.typeArticle.contains("GENERAL")));
    articleListsVIH.assignAll(articles.where((element) => element.typeArticle.contains("MALADIE")));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
