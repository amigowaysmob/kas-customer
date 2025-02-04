import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kasnew/cubits/feed_back_cubit.dart';
import 'package:kasnew/request_model/feedback_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/toast_widget.dart';

class ReviewWidget extends HookWidget {
  ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = ApiConstant.language; // Language configuration
    final d = lang?.data;

    // State controllers
    final reviewController = useTextEditingController();
    final ratingValue = useState<double>(0.0);
    final formKey = useMemoized(() => GlobalKey<FormState>());

    // Review validation
    String? _validateReview(String? value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter your review';
      }
      return null;
    }

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            TextViewLarge(
              title: 'Add Review',
              textcolor: blackColor,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 16),

            // Rating Stars Widget
            RatingStars(
              axis: Axis.horizontal,
              value: ratingValue.value,
              onValueChanged: (v) => ratingValue.value = v,
              starCount: 5,
              starSize: 24,
              valueLabelColor: const Color(0xff9b9b9b),
              valueLabelTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
              ),
              starSpacing: 4,
              maxValue: 5,
              maxValueVisibility: true,
              valueLabelVisibility: false,
              animationDuration: const Duration(milliseconds: 500),
              starOffColor: const Color.fromARGB(255, 202, 208, 218),
              starColor: sandleColor,
            ),
            const SizedBox(height: 24),

            // Review Input Field
            TextFormField(
              controller: reviewController,
              validator: _validateReview,
              decoration: InputDecoration(
                labelText: 'Write your review*',
                hintText: 'Write your review',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: appColor, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            const SizedBox(height: 24),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Cancel Button
                ButtonWidget(
                  onPressed: () => context.router.pop(),
                  buttonName: 'Cancel',
                  buttonColor: whiteColor,
                  width: 100,
                ),
                const SizedBox(width: 24),

                // Send Review Button
                ButtonWidget(
                  onPressed: () async {
                    if (formKey.currentState!.validate() &&
                        ratingValue.value != 0.0) {
                      // Call feedback submission API
                      context.read<FeedBackCubit>().login(
                            FeedBackRequestModel(
                              userId: ApiConstant.userId,
                              feedback: reviewController.text,
                              rating: ratingValue.value.toString(),
                              lang: ApiConstant.langCode,
                            ),
                          );

                      await context.router.pop();
                    } else if (ratingValue.value == 0.0) {
                      ToastWidget(
                        message: 'Please give your ratings',
                      ).build(context);
                    }
                  },
                  buttonName: 'Send Review',
                  buttonColor: appColor,
                  width: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}