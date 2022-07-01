import 'package:bestbrand/models/review.dart';
import 'package:get/get.dart';

import '../dummy_data.dart' as dummy;

class ReviewController extends GetxController {
  var reviewList = List<Review>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    reviewList.value = List.of(dummy.reviewList);
  }

  removeReview(int index) {
    reviewList.removeAt(index);
  }

  addReview(int id, int stars, String review) {
    reviewList.add(Review(id, stars, review));
  }

  double getRating(int id) {
    List<Review> review = reviewList.where((p1) => p1.id == id).toList();
    if (review.isEmpty) {
      return 0.0;
    }
    int sum = review.fold(0, (sum, element) => sum + element.stars);
    return double.parse((sum / review.length).toStringAsFixed(2));
  }

  int getRateCount(int id) {
    return reviewList.where((p1) => p1.id == id).toList().length;
  }

  List<Review> getReviewById(int id) {
    return reviewList.where((p1) => p1.id == id).toList();
  }
}
