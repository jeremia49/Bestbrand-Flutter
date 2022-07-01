import 'package:bestbrand/models/bookmark.dart';
import 'package:get/get.dart';

import '../dummy_data.dart' as dummy;

class BookmarkController extends GetxController {
  var bookmarkList = List<Bookmark>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    bookmarkList.value = List.of(dummy.bookmarkList);
  }

  bool isBookmark(int id) {
    if (bookmarkList.toList().firstWhereOrNull((element) => element.id == id) !=
        null) {
      return true;
    }
    return false;
  }

  addBookmark(int id) {
    bookmarkList.add(Bookmark(id));
  }

  removeBookmark(int id) {
    bookmarkList.removeWhere((item) => item.id == id);
  }
}
