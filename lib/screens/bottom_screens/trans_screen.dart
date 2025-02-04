import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/cubits/trans_cubit.dart';
import 'package:kasnew/request_model/trans_request_model.dart';
import 'package:kasnew/states/trans_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/drop_down_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/no_data_widget.dart';
import 'package:kasnew/widgets/no_userId_function.dart';
import 'package:kasnew/widgets/no_user_id_screen.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';
import 'package:kasnew/widgets/trans_widget.dart';
@RoutePage()
class TransScreen extends HookWidget {
  bool? isMenu;
 TransScreen({this.isMenu});

  @override
  Widget build(BuildContext context) {
  
     double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    var searchController=useTextEditingController();
    var filter=useState<String?>('All');
    List<String> status=['Pending','Success','All',"Failed"];
    var size=useState<String?>('All');
final isExpanded = useState(false);
 final showSuffixIcon = useState(false);
    
   useEffect(() {
   context.read<TransCubit>().login(TransRequestModel(
    userId: ApiConstant.userId,
    lang: ApiConstant.langCode,
    paymentStatus: filter.value,
    searchTerm: searchController.text
   
  ));
  
  // Return a cleanup function or null if none is needed
  return null;
}, []);

    return Scaffold(
      appBar:isMenu==true? TitleAppBarWidget(title: 'Paid Amount Details'):null,
      body:Helper.isUser()==true? SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                 height: sheight/19,decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                 ),
                child: Row(
                  
                  children: [
                    Container(
                      
                      width:swidth/2.5,
                      height: sheight/19,
                     
                      child:
                      //  TextForm(keyboardType: TextInputType.text,controller:searchController ,hintText: 'Search',)
                      TextField(
                  controller: searchController,
                  // focusNode: focus,
                  onChanged: (val){
                   showSuffixIcon.value = searchController.text.isNotEmpty;
                   context.read<TransCubit>().login(TransRequestModel(
                    userId: ApiConstant.userId,
                    lang: ApiConstant.langCode,
                    
                    searchTerm: searchController.text
                   
                  ));
                  },
                  decoration: InputDecoration(
                
                    hintText: 'Search',
                   
                    suffixIcon: 
                    showSuffixIcon.value
                        ? 
                        IconButton(
                            onPressed: () {
                              searchController.clear();
                              showSuffixIcon.value = false;
                            },
                            icon: Icon(Icons.close_rounded,
                                color: Colors.black, size: 15),
                          )
                        : null,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.grey,
                        style: BorderStyle.solid,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: const BorderSide(
                        width: 0.5,
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    
                  ),
                  
                )
                       ),
                    ButtonWidget(onPressed: (){
                      context.read<TransCubit>().login(TransRequestModel(
                    userId: ApiConstant.userId,
                    lang: ApiConstant.langCode,
                    
                    searchTerm: searchController.text
                   
                  ));
                    },
                     buttonName: 'Search', 
                     buttonColor:appColor,
                     width: swidth/5,
                     isLeftRadius: true,
                     ),
                     horizontalSpaceSmall,
                           DropDownWidget1(items: status,
                size:filter.value,
                width: swidth/3.2,
                 height: sheight/19,
                             hint: 'Status',
                             
                onChanged: (value){
                filter.value=value;
                 context.read<TransCubit>().login(TransRequestModel(
                    userId: ApiConstant.userId,
                    lang: ApiConstant.langCode,
                    paymentStatus: filter.value,
                    
                   
                  ));
                },),
                  ],
                ),
              ),
              vericalSpaceMedium,
             
             
                   BlocConsumer<TransCubit, TransState>(
                listener: (context, state) {
               
          if (state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text=='Success') {
             
          }
          else if(state.networkStatusEnum == NetworkStatusEnum.loaded && state.model.text!='Success'){
          
          }
              },
               builder: (context, state) {
               if(  state.networkStatusEnum==NetworkStatusEnum.loading){
          return CircularWidgetC();
              }
              if( state.networkStatusEnum==NetworkStatusEnum.loaded){
          var data=state.model.data?.transactionsData;
               return (data?.length??0)>0? ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data?.length??0,
          itemBuilder: (context,index){
          return TransWidget(transData: data?[index],langData: state.model.data?.langData,);
               }):NoDataWidget(title: state.model.data?.langData?.noTransactionData); }
               else{
          return NoDataWidget(title: state.model.data?.langData?.noTransactionData);
               }
               }
           )
               ] ),
        ),
      ):NoUseridScreen(content: 'Login to access your transactions'),
    );
  }
}

