

import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/features/profile/data/model/request/edit_user_model_params.dart';
import 'package:bookia_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:bookia_app/features/profile/presentation/bloc/profile_event.dart';
import 'package:bookia_app/features/profile/presentation/bloc/profile_state.dart';
import 'package:bookia_app/features/profile/presentation/page/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(GetProfileEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.logout_rounded)),
            const Gap(5)
          ],
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          buildWhen: (previous, current) =>
              current is GetProfileSuccessState ||
              current is GetProfileLoagingState,
          builder: (context, state) {
            if (state is GetProfileSuccessState) {
              var profile = context.read<ProfileBloc>().profileResponse?.data;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // IMAGE
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              profile?.image ?? '',
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // NAME
                              Text(
                                profile?.name ?? '',
                                style: getFont16TextStyle(context,),
                              ),
                              // EMAIL
                              Text(
                                profile?.email ?? '',
                                style: getFont16TextStyle(context,),
                              ),
                            ],
                          ))
                        ],
                      ),
                      const Gap(20),
                      Divider(
                        color: AppColors.greyColor.withOpacity(.5),
                        endIndent: 20,
                        indent: 20,
                      ),
                      const Gap(10),
                      Card(
                        color: AppColors.whiteColor,
                        elevation: 20,
                        shadowColor: AppColors.greyColor.withOpacity(.3),
                        child: ListTile(
                          onTap: () {},
                          tileColor: AppColors.whiteColor,
                          title: const Text('My Orders'),
                          trailing: const Icon(Icons.chevron_right),
                        ),
                      ),
                      const Gap(5),
                      Card(
                        color: AppColors.whiteColor,
                        elevation: 20,
                        shadowColor: AppColors.greyColor.withOpacity(.3),
                        child: ListTile(
                          onTap: () {
                            pushTo(context, EditProfileView(model: EditUserModelParams(
                              address: profile?.address,
                              image: profile?.image,
                              name: profile?.name,
                              phone: profile?.phone,
                            ),));
                          },
                          tileColor: AppColors.whiteColor,
                          title: const Text('Edit Profile'),
                          trailing: const Icon(Icons.chevron_right),
                        ),
                      ),
                      const Gap(5),
                      Card(
                        color: AppColors.whiteColor,
                        elevation: 20,
                        shadowColor: AppColors.greyColor.withOpacity(.3),
                        child: ListTile(
                          onTap: () {},
                          tileColor: AppColors.whiteColor,
                          title: const Text('Reset Password'),
                          trailing: const Icon(Icons.chevron_right),
                        ),
                      ),
                      const Gap(5),
                      Card(
                        color: AppColors.whiteColor,
                        elevation: 20,
                        shadowColor: AppColors.greyColor.withOpacity(.3),
                        child: ListTile(
                          onTap: () {},
                          tileColor: AppColors.whiteColor,
                          title: const Text('Contact Us'),
                          trailing: const Icon(Icons.chevron_right),
                        ),
                      ),
                      const Gap(5),
                      Card(
                        color: AppColors.whiteColor,
                        elevation: 20,
                        shadowColor: AppColors.greyColor.withOpacity(.3),
                        child: ListTile(
                          onTap: () {},
                          tileColor: AppColors.whiteColor,
                          title: const Text('About Us'),
                          trailing: const Icon(Icons.chevron_right),
                        ),
                      ),
                      const Gap(5),
                      Card(
                        color: AppColors.whiteColor,
                        elevation: 20,
                        shadowColor: AppColors.greyColor.withOpacity(.3),
                        child: ListTile(
                          onTap: () {},
                          tileColor: AppColors.whiteColor,
                          title: const Text('Terms & Conditions'),
                          trailing: const Icon(Icons.chevron_right),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}