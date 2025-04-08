import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kasnew/cubits/winners_cubit.dart';
import 'package:kasnew/request_model/winners_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/screens/lucky_draw/widgets/name_widget.dart';
import 'package:kasnew/screens/lucky_draw/widgets/title_container_widget.dart';
import 'package:kasnew/screens/lucky_draw/widgets/winners_widget.dart';
import 'package:kasnew/states/winners_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/no_data_widget.dart';
import 'package:kasnew/widgets/plan_name_widget.dart';
import 'package:kasnew/widgets/row_bold_text_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';

class NoneligibleWidget extends HookWidget {
  String? eligible;
  String? win;
  String? time;
  String? content;
  String? nextLuckyDrawDate;
 NoneligibleWidget({this.eligible,this.time,this.win,this.content,this.nextLuckyDrawDate});

  @override
  Widget build(BuildContext context) {
      LangModel? lang=ApiConstant.language;
  
    var d=lang?.data;
    var image=useState<String?>(null);
 
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    void getImage(){
      print('win----------------------------$win');
       print('eligible----------------------------$eligible');
if(win=='1'){
image.value='assets/images/Winner.png';

    }
    else if(win!='1' && eligible=='1'){
image.value='assets/images/eli.png';

    }
    else if(win!='1' && eligible=='0'){
      image.value='assets/images/luck_next.png';
      
    }
    }
      useEffect(() {
   getImage();
}, []);

  
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image.asset(image.value??'',height:sheight/6,width: swidth/3,),
        TextViewLarge(title: content,textcolor: yellowColor,
        fontWeight: FontWeight.bold,),
        // ButtonWidget(onPressed: (){
      
        // }, buttonName:'View Winners',
        // width: swidth/3,
        //  buttonColor: whiteColor),
       win!='1'?  RowBoldTextWidget(title:d?.nextLuckyDrawDate?? 'Next Lucky Draw Date', value:nextLuckyDrawDate,color: whiteColor,):Container()
        ],),
      ),
    );
  }
}
