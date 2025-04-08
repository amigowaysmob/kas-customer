import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kasnew/response_model/home_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/text_view_medium.dart';


 class RateSection extends StatefulWidget {
  final GoldSilverPrice? rate;
LangData? langData;
  RateSection({this.rate,this.langData});

  @override
  _RateSectionState createState() => _RateSectionState();
}

class _RateSectionState extends State<RateSection> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScrolling());
  }

  void _startScrolling() {
    // Check if there are clients to avoid errors
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final duration = Duration(seconds:15); // Adjust speed here

      _scrollController.animateTo(
        maxScroll,
        duration: duration,
        curve: Curves.linear,
      ).then((_) {
        // Reset to start and scroll again
        _scrollController.jumpTo(0);
        _startScrolling();
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  
  Widget build(BuildContext context) {
    var d = widget.langData;
    var price = widget.rate;

    return InkWell(
      onTap: () {
        showAlert(
          context,
          price?.goldPrice,
          price?.silverPrice,
          price?.priceUpdatedTime,
        );
      },
      child: Container(
        height: 50, // Fixed height for ticker
        color: appColor,
        child: ListView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextViewMedium(
                    name: '${price?.priceUpdatedTime}',
                    fontWeight: FontWeight.w700,
                    textColors: greyColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextViewMedium(
                    name:
                        '${d?.todayGoldPrice ?? 'Today Gold Rate'} : ₹${price?.goldPrice}',
                    fontWeight: FontWeight.w700,
                    textColors: sandleColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextViewMedium(
                    name:
                        '${d?.todaySilverPrice ?? 'Today Silver Price'} : ₹${price?.silverPrice}',
                    fontWeight: FontWeight.w700,
                    textColors: whiteColor,
                  ),
                ),
              ],
            ),
            // Duplicate content to create seamless scrolling
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextViewMedium(
                    name: '${price?.priceUpdatedTime}',
                    fontWeight: FontWeight.w700,
                    textColors: greyColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextViewMedium(
                    name:
                        '${d?.todayGoldPrice ?? 'Today Gold Rate'} : ₹${price?.goldPrice}',
                    fontWeight: FontWeight.w700,
                    textColors: sandleColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextViewMedium(
                    name:
                        '${d?.todaySilverPrice ?? 'Today Silver Price'} : ₹${price?.silverPrice}',
                    fontWeight: FontWeight.w700,
                    textColors: whiteColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showAlert(BuildContext context,String? goldPrice,String? silverPrice,String? update) {
    showDialog(
        context: context,
       
        builder: (context) {
          LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Ensure the dialog takes only as much space as needed
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextViewMedium(
                    name: update,
                    fontWeight: FontWeight.w700,
                    textColors:blackColor,
                  ),
                  vericalSpaceMedium,
                          
                          TextViewMedium(
                    name:  '${d?.todayGoldPrice??'Today Gold Rate'} : ₹$goldPrice',
                    fontWeight: FontWeight.w700,
                    textColors:blackColor,
                  ),
                  vericalSpaceMedium,
                  TextViewMedium(
                    name: '${d?.todaySilverPrice??'Today Silver Price'}  : ₹$silverPrice',
                    fontWeight: FontWeight.w700,
                    textColors:blackColor,
                  ),
                          vericalSpaceLarge,
                         ButtonWidget(
                          width: 100,
                           buttonName: 'Ok',
                           onPressed: () {
                           context.router.pop();
                           },
                           buttonColor: appColor,
                         ),
                        
                        ],
                      ),
                    )
                  ]));
        });
  }

  

   
