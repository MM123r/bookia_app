// import 'package:bookia_app/core/functions/dialogs.dart';
// import 'package:bookia_app/core/functions/navigation.dart';
// import 'package:bookia_app/core/utils/colors.dart';
// import 'package:bookia_app/core/utils/text_styles.dart';
// import 'package:bookia_app/core/widgets/custom_button.dart';
// import 'package:bookia_app/features/cart/data/models/request/place_order_params.dart';
// import 'package:bookia_app/features/cart/data/models/response/governrates_data.dart';
// import 'package:bookia_app/features/cart/page/success_screen.dart';
// import 'package:bookia_app/features/home/presentation/bloc/home_bloc.dart';
// import 'package:bookia_app/features/home/presentation/bloc/home_event.dart';
// import 'package:bookia_app/features/home/presentation/bloc/home_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';

// class CheckoutScreen extends StatefulWidget {
//   CheckoutScreen({super.key, required this.total});
//   final String total;

//   @override
//   State<CheckoutScreen> createState() => _CheckoutScreenState();
// }

// class _CheckoutScreenState extends State<CheckoutScreen> {
//   var nameController = TextEditingController(text: "m");
//   var phoneController = TextEditingController(text: "m");
//   var addressController = TextEditingController(text: "m");
//   var emailController = TextEditingController(text: "m");

//   var formKey = GlobalKey<FormState>();

//   int? governorateId;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeBloc, HomeState>(
//       listener: (context, state) {
//         if (state is PlaceOrderLoadedState) {
//           Navigator.pop(context);
//           pushAndRemoveUntil(context, SuccessScreen());
//         } else if (state is HomeErrorState) {
//           Navigator.pop(context);
//           showErrorDialog(context, state.message);
//         } else if (state is PlaceOrderLoadingState) {
//           showLoadingDialog(context);
//         }

//         // if (state is PlaceOrderLoadingState) {
//         //   showLoadingDialog(context);
//         //   Navigator.pop(context);
//         // } else if (state is HomeErrorState) {
//         //   Navigator.pop(context);
//         //   showErrorDialog(context, "${state.message}");
//         // } else {
//         //   pushWithReplacement(context, SuccessScreen());
//         // }
//       },
//       builder: (context, state) {
//         return Scaffold(
//         appBar: AppBar(
//           title: const Text("Checkout"),
//         ),
//         //
      
//         bottomNavigationBar: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(22, 10, 22, 14),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       "Tota:",
//                       style: getFont18TextStyle(),
//                     ),
//                     const Spacer(),
//                     Text(
//                       "${widget.total}\$",
//                       style: getFont18TextStyle(),
//                     ),
//                   ],
//                 ),
//                 const Gap(16),
//                 CustomButton(
//                     text: "Submit Order",
//                     onPressed: () {
//                       if (formKey.currentState!.validate()) {
//                         context.read<HomeBloc>().add(PlaceOrderEvent(
//                                 params: PlaceOrderParams(
//                               name: nameController.text,
//                               phone: phoneController.text,
//                               address: addressController.text,
//                               email: emailController.text,
//                               governorateId: governorateId,
//                             )));
      
//                         // Navigator.pop(context);
//                       }
//                     })
//               ],
//             ),
//           ),
//         ),
      
//         //
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SingleChildScrollView(
//             child: Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   const Gap(20),
//                   TextFormField(
//                     controller: nameController,
//                     decoration: const InputDecoration(hintText: "Full Name"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please Enter Some Text";
//                       }
//                       return null;
//                     },
//                   ),
      
//                   /////////////
//                   const Gap(12),
//                   TextFormField(
//                     controller: phoneController,
//                     decoration: const InputDecoration(hintText: "Phone"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please Enter Some Text";
//                       }
//                     },
//                   ),
      
//                   ///////////
//                   const Gap(12),
//                   TextFormField(
//                     controller: addressController,
//                     decoration: const InputDecoration(hintText: "Address"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please Enter Some Text";
//                       }
//                     },
//                   ),
      
//                   /////////
//                   const Gap(12),
//                   TextFormField(
//                     controller: emailController,
//                     decoration: const InputDecoration(hintText: "Email"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Please Enter Some Text";
//                       }
//                     },
//                   ),
//                   const Gap(12),
//                   DropdownMenu(
//                     enableSearch: true,
//                     hintText: "Choose Goverrate",
//                     menuStyle: const MenuStyle(
//                         backgroundColor:
//                             WidgetStatePropertyAll(AppColors.borderColor)),
//                     expandedInsets: const EdgeInsets.all(0),
//                     inputDecorationTheme: const InputDecorationTheme(
//                       fillColor: AppColors.accentColor,
//                       filled: true,
//                     ),
//                     onSelected: (value) {
//                       governorateId = value;
//                     },
//                     dropdownMenuEntries: governrateData.map((m) {
//                       return DropdownMenuEntry(
//                         label: m["governorate_name_en"],
//                         value: m["id"],
//                       );
//                     }).toList(),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//       },
//     );
//   }
// }

















































import 'dart:ui';


import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/features/cart/data/models/request/place_order_params.dart';
import 'package:bookia_app/features/cart/data/models/response/governrates_data.dart';
import 'package:bookia_app/features/cart/page/success_screen.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_event.dart';
import 'package:bookia_app/features/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.total});
  final String total;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  var namecontroller = TextEditingController(text: "Mohamed Mostafa");
  var emailcontroller = TextEditingController(text: "mohamedmostafaamin80@gmail.com ");
  var Addresscontroller = TextEditingController();
  var Phonecontroller = TextEditingController();
  var govontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();
  int? governorateId;
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is PlaceOrderLoadingState) {
          showLoadingDialog(context);
        } else if (state is HomeErrorState) {
          Navigator.pop(context); // Close the loading dialog
           showErrorDialog(context, state.message);
        } else if (state is PlaceOrderLoadedState) {
          Navigator.pop(context); // Close the loading dialog
           pushWithReplacement(context, SuccessScreen());
        }
        else{
        
          pushWithReplacement(context, SuccessScreen());
          
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Checkout",
              
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Text(
                          "Total:",
                          style: getFont20TextStyle(context,color: AppColors.darkColor,),
                        ),
                        const Spacer(),
                        Text(
                          "${widget.total} \$",
                          style: getFont20TextStyle(context,),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  CustomButton(
                    text: "Submit Order",
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        context.read<HomeBloc>().add(
                              PlaceOrderEvent(
                                params: PlaceOrderParams(
                                  address: Addresscontroller.text,
                                  email: emailcontroller.text,
                                  name: namecontroller.text,
                                  phone: Phonecontroller.text,
                                  governorateId: governorateId,
                                ),
                                
                              ),
                              
                            );
                            // pushWithReplacement(context, SuccessScreen());
                            
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 10),
            child: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name is required";
                        }
                        return null;
                      },
                      controller: namecontroller,
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        hintStyle: getFont16TextStyle(context,),
                        fillColor: Color(0xffE8ECF4).withOpacity(.4),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: getFont16TextStyle(context,),
                        fillColor: Color(0xffE8ECF4).withOpacity(.4),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: Addresscontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Address is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Address",
                        hintStyle: getFont14TextStyle(context,),
                        fillColor: Color(0xffE8ECF4).withOpacity(.4),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: Phonecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Phone is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Phone",
                        hintStyle: getFont14TextStyle(context,),
                        fillColor: Color(0xffE8ECF4).withOpacity(.4),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 12),
                    DropdownMenu(
                      controller: govontroller,
                      enableSearch: true,
                      hintText: "Choose Governorate",
                      expandedInsets: const EdgeInsets.all(0),
                      menuStyle: const MenuStyle(
                        backgroundColor: WidgetStatePropertyAll(AppColors.secondaryColor)
                      ),
                      inputDecorationTheme: InputDecorationTheme(
                        fillColor: Color(0xffE8ECF4).withOpacity(.4),
                        filled: true,
                      ),
                      onSelected: (value) {
                        governorateId = value as int;
                      },
                      dropdownMenuEntries: governrateData.map((e) {
                        return DropdownMenuEntry(
                          value: e["id"],
                          label: e["governorate_name_en"]
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
