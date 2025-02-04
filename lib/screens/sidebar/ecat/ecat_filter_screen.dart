import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasnew/cubits/cat_list_cubit.dart';
import 'package:kasnew/cubits/product_list_cubit.dart';
import 'package:kasnew/request_model/home_request_model.dart';
import 'package:kasnew/request_model/product_list_request_model.dart';
import 'package:kasnew/response_model/language_model.dart';
import 'package:kasnew/router/app_router.gr.dart';
import 'package:kasnew/states/cat_list_state.dart';
import 'package:kasnew/states/product_list_state.dart';
import 'package:kasnew/utils/constant.dart';
import 'package:kasnew/utils/constants/api_constants.dart';
import 'package:kasnew/utils/enums.dart';
import 'package:kasnew/widgets/button_widget.dart';
import 'package:kasnew/widgets/drop_down_widget.dart';
import 'package:kasnew/widgets/indicator_widget.dart';
import 'package:kasnew/widgets/text_view_large.dart';
import 'package:kasnew/widgets/text_view_medium.dart';
import 'package:kasnew/widgets/text_view_small.dart';
import 'package:kasnew/widgets/title_app_bar_widget.dart';

@RoutePage()
class ProductScreen extends HookWidget {
  String? categoryId;
   ProductScreen({super.key,this.categoryId});

  @override
  Widget build(BuildContext context) {
     LangModel? lang=ApiConstant.language;
    var d=lang?.data;
    // final productCategoryTypeList =
    //     ref.watch(productStateProvider.notifier).productCategoryTypeList;
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    
    // final productListModel = ref.read(productStateProvider).productListModel;
    // final message = ref.read(productStateProvider).error;

   
  var sortBy=useState<String?>(null);
  var category=useState<String?>('');
  var size=useState<String?>(null);
  var mainCatIndex=useState<List<String>>([]); 
  final selectedCategoryIndex = useState<List<String>>([]); 
  List<String>? sizes=[];
  
  //  final selectedCategoryIndex = useState<String?>(null); 
    // if (message?.isNotEmpty == true) {
    //   context.showCenterShortToast(message: message);
    // }
    final selectedSortOption = useState<int>(0);
void filterApiCall()async{
    context.read<ProductListCubit>().login(ProductListRequestModel(userId: ApiConstant.userId,lang:ApiConstant.langCode,
    sortBy: sortBy.value,size: size.value,
    category:category.value));
}
 useEffect(() {
      SchedulerBinding.instance.addPostFrameCallback((_) {
    filterApiCall();
  context.read<CatListCubit>().login(HomeRequestModel(userId: ApiConstant.userId,lang:ApiConstant.langCode));
 
  return null;
      });
}, []);

    // Function to show the bottom sheet when the sort button is pressed
    void _showSortBottomSheet() {
      showModalBottomSheet(
        backgroundColor: whiteColor,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sort By',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Divider(),
                 RadioListTile<int>(
                  title: TextViewSmall(title: d?.allPrice??'All price'),
                  value: 1,
                  groupValue: selectedSortOption.value,
                  onChanged: (int? value) {
                    selectedSortOption.value = value!;
                    sortBy.value="";
                    filterApiCall();
                    context.router.pop();
                    
                  },
                ),
                RadioListTile<int>(
                  title: TextViewSmall(title:d?.lowToHigh??'Low to High'),
                  value: 2,
                  groupValue: selectedSortOption.value,
                  onChanged: (int? value) {
                    selectedSortOption.value = value!;
                     sortBy.value="asc";
                    filterApiCall();
                    context.router.pop();// Close bottom sheet
                  },
                ),
                RadioListTile<int>(
                  title:TextViewSmall(title:d?.highToLow??'High to Low'),
                  value: 3,
                  groupValue: selectedSortOption.value,
                  onChanged: (int? value) {
                    selectedSortOption.value = value!;
                     sortBy.value="desc";
                    filterApiCall();
                    context.router.pop();
                  },
                ),
               
              ],
            ),
          );
        },);}
    return SafeArea(
        child: Scaffold(
      backgroundColor: greyColor,
      appBar: TitleAppBarWidget(title: d?.eCatalogue??'E-catalogue',),
      body: Container(
              margin: EdgeInsets.only(top: 5.sp, left: 5.sp, right: 5.sp),
              padding: EdgeInsets.only(top: 10.sp, left: 10.sp, right: 10.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 0.04.sh,
                    // child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: productCategoryTypeList!.length,
                    //     itemBuilder: (context, index) {
                    //       return InkWell(
                    //         onTap: () {
                    //           ref
                    //                   .watch(productStateProvider.notifier)
                    //                   .selectedCatIndex =
                    //               int.parse(productCategoryTypeList[index]
                    //                   .id
                    //                   .toString());
                    //           ref
                    //               .watch(productStateProvider.notifier)
                    //               .productsApiCall(
                    //                   categoryId: productCategoryTypeList[index]
                    //                       .id
                    //                       .toString());
                    //         },
                    //         child: Padding(
                    //           padding: EdgeInsets.only(right: 15.sp),
                    //           child: TextViewLarge(
                    //               title: productCategoryTypeList[index].name,
                    //               fontWeight: FontWeight.bold,
                    //               textcolor: ref
                    //                           .watch(
                    //                               productStateProvider.notifier)
                    //                           .selectedCatIndex ==
                    //                       int.parse(
                    //                           productCategoryTypeList[index]
                    //                               .id
                    //                               .toString())
                    //                   ? Palette.gradientColor
                    //                   : Palette.grayColor),
                    //         ),
                    //       );
                    //     }),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      InkWell(onTap: (){
                       _showSortBottomSheet();
                      }, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Icon(Icons.sort,),
                        horizontalSpaceMedium,
                        TextViewSmall(title: d?.sortBy??'Sort By',textcolor: blackColor,),
                        
                      ],)),
                      Container(
                        height: 0.04.sh,
                        width: 1,
                        color: greyColor,
                      ),
                       Builder(
      builder: (context) {
        return InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer(); // This will now work
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.filter_alt_outlined),
              horizontalSpaceMedium,
              TextViewSmall(
                title: d?.filter??'Filter',
                textcolor: blackColor,
              ),
            ],
          ),
        );
      },
    ),
                    ],),
                  ),
                  
                   Divider(thickness: 5,color: greyColor,),
                 vericalSpaceSmall,
                  BlocConsumer<ProductListCubit,ProductListState>(
                    listener: (context, state) {
                      
                    },
                 builder:(context,state){ 
                  if(  state.networkStatusEnum==NetworkStatusEnum.loading){
      return CircularWidgetC();
    }
   else if( state.networkStatusEnum==NetworkStatusEnum.loaded){
                  var data=state.model.data;
                return  Expanded(
                      child: 
                     data?.length==0?  Container(
                              child: Center(
                                child: TextViewLarge(
                                  title: d?.noDataFound??'No data found',
                                  fontWeight: FontWeight.bold,
                                  textcolor: appColor,
                                ),
                              ),
                            )
                          :  GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
            mainAxisSpacing:10,
          
            mainAxisExtent: sheight/3,
            crossAxisSpacing: 10
             
              
              ),
              itemCount: data?.length,
              itemBuilder: (context, index) {
                print('datalength--------${data?.length}');
                 var eData=data?[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:InkWell(
                    onTap: (){
                      context.router.push(ECatDetailScreen(id: eData?.id));
                    },
                    child: Card(
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Image.network(eData?.proImg??'',height: sheight/5.5,width: swidth/2,fit: BoxFit.cover,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: swidth/2.1,
                                      child: TextViewMedium(name:'${eData?.productName}' ,fontWeight: FontWeight.bold,textColors: appColor,)),
                                    TextViewSmall(title: 'Weight:${eData?.weight}',textcolor: greyColor,),
                                    TextViewMedium(name: '₹${eData?.salePrice}',textColors: appColor,fontWeight: FontWeight.w800,),
                                  ],
                                ),
                              )
                              
                      ],),
                    ),
                  )
                );
              },
            )
                            
                    );}
                    else{
                       return CircularWidgetC();
                    }
  }
  
  ),
                 vericalSpaceSmall,
                ],
              ),
            ),
            drawer: Drawer(
              backgroundColor: whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: BlocConsumer<CatListCubit,CatListState>(
                    listener: (context,state){

                    },
                    builder:(context,state){
 if(  state.networkStatusEnum==NetworkStatusEnum.loading){
      return CircularWidgetC();
    }
   else if( state.networkStatusEnum==NetworkStatusEnum.loaded){
            var cData=state.model.data;        
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      TextViewLarge(title: d?.filter??'Filter',textcolor: blackColor,fontWeight: FontWeight.bold,),
                      vericalSpaceSmall,
                      Divider(),
                      TextViewMedium(name:  d?.pickCategory??'Pick Category',fontWeight: FontWeight.bold,),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: cData?.category?.length,
                                    itemBuilder: (context,index){
                                      var cat=state.model.data?.category?[index];
                                  return cat?.subcatitems?.length!=0?
                                   ExpansionTile(
                                    minTileHeight: 30,
                                    dense: true,
                                    initiallyExpanded: mainCatIndex.value.contains(cat?.id)?true:false,
                                    // onExpansionChanged: (value){
                                                      
                                    // },
                                    //  initiallyExpanded:
                                    //                               expandedState.value[
                                    //                                   index], // Manage expanded state
                                    //                           onExpansionChanged: (bool
                                    //                               expanded) {
                                    //                             expandedState.value[index] =
                                    //                                 expanded;
                                    //                           },
                                    // initiallyExpanded: selectedCategoryIndex.value.contains(cat.subcatitems.),
                                    title:TextViewSmall(title: cat?.name??'',textcolor: blackColor,) ,
                                  children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0,left: 20.0),
                                    child:ListView.builder(
                                      shrinkWrap: true,
                                       physics: NeverScrollableScrollPhysics(),
                                      itemCount: cat?.subcatitems?.length,
                                      
                                      itemBuilder: (context, subIndex) {
                                        
                                        var subCategory =
                                            cat?.subcatitems?[subIndex];
                                            
                                            print(sizes);
                                        return CheckboxListTile(
                                         
                                                value: selectedCategoryIndex.value.contains(subCategory?.id),
                                                activeColor: blackColor,
                                                checkColor: whiteColor,
                                                dense: true,
                                                onChanged: (bool? value) {
                                                                      if (value == true) {
                                                                        // Add the subCategory ID if it's not already in the list
                                                                        selectedCategoryIndex.value = List.from(selectedCategoryIndex.value)
                                                                          ..add(subCategory?.id ?? '');
                                                                          mainCatIndex.value = List.from(mainCatIndex.value)
                                                                          ..add(cat?.id?? '');
                                                                      } else {
                                                                        // Remove the subCategory ID from the list
                                                                        selectedCategoryIndex.value = List.from(selectedCategoryIndex.value)
                                                                          ..remove(subCategory?.id);
                                                                           mainCatIndex.value = List.from(mainCatIndex.value)
                                                                          ..remove(cat?.id?? '');
                                                                      }
                                                                      // Update the category value with the updated list (for API call)
                                                                      category.value = selectedCategoryIndex.value.join(",");// Update the category value with the updated list
                                                },
                                                title: TextViewSmall(
                                                                      title: subCategory?.name ?? '',
                                                ),
                                              );
                                                                            }),
                                  ),
                                  
                                  ],):CheckboxListTile(
                                    
                                                        value: selectedCategoryIndex.value.contains(cat?.id),
                                                        activeColor: blackColor,
                                                        checkColor: whiteColor,
                                                        dense: true,
                                                        onChanged: (bool? value) {
                                  if (value == true) {
                                    // Add the subCategory ID if it's not already in the list
                                    selectedCategoryIndex.value = List.from(selectedCategoryIndex.value)
                                      ..add(cat?.id??'');
                                  } else {
                                    // Remove the subCategory ID from the list
                                    selectedCategoryIndex.value = List.from(selectedCategoryIndex.value)
                                      ..remove(cat?.id);
                                  }
                                  // Update the category value with the updated list (for API call)
                                  category.value = selectedCategoryIndex.value.join(",");// Update the category value with the updated list
                                                        },
                                                        title: TextViewSmall(
                                  title: cat?.name ?? '',
                                                        ),
                                                      );
                                  }),
                      
                    cData?.size?.length!=0 ? 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Padding(
                          padding:  EdgeInsets.only(top: 8.0,bottom: 8.0),
                          child: TextViewMedium(name: d?.size??'size' ,textColors: blackColor,fontWeight: FontWeight.bold,),
                        ),
                      //  CustomDropdownButton2(dropdownItems: catGroupModel?.data?.size??[], hint: 'Sizes',
                       
                      //   onChanged: (p0) {
                      //     size.value=p0;
                      //   },
                      //   value: size.value,)
                      
                      DropDownWidget1(size: size.value, hint: d?.selectSize??'selectSize',items:cData?.size??[],
                      onChanged: (p0) {
                        
                          size.value=p0;
                        },),
                      ],
                    ):
                    Container(),
                    
                     Padding(
                          padding:  EdgeInsets.only(top: 30,bottom: 8.0),
                      child: Center(
                        child: ButtonWidget(buttonName:  d?.search??'search', onPressed: (){
                          filterApiCall();
                          context.router.pop();
                        }, buttonColor: appColor,),
                      ),
                    )
                    ],);}
                    else{
                      return CircularWidgetC();
                    }
  })
                ),
              ),
            ),
    ));
  }
}
