import 'package:brainwired_machine_test/controller/fetch_all_user_data_provider.dart';
import 'package:brainwired_machine_test/core/themes/colors/color_pallet.dart';
import 'package:brainwired_machine_test/core/constants/user_page_constants.dart';
import 'package:brainwired_machine_test/core/utils/dynamic_sizes.dart';
import 'package:brainwired_machine_test/view/pages/user_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //user page constants(text)
    final userPageConsts = ref.read(userPageConstantsProvider);

    // controller for dropdown menu
    final dropDownController = useState<int>(0);

    return Scaffold(
        backgroundColor: ColorPallets.bgColor,
        appBar: AppBar(
          backgroundColor: ColorPallets.bgColor,
          centerTitle: true,
          title: Text(
            userPageConsts.txtTitle,
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w400),
          ),
        ),
        body: ref.watch(fetchAllUserDataProvider).when(
              data: (data) {
                // when data fetch from api shows list view
                return ListView.separated(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // individual user data
                    final userData = data[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.screenWidth(10),
                      ),
                      child: ListTile(
                        title: Text(
                          userData.username ?? userPageConsts.txtUnknown,
                          style: GoogleFonts.poppins(),
                        ),
                        leading: CircleAvatar(
                          child: Text(userData.username!.split('')[0]),
                        ),
                        subtitle: Text(
                          userData.email ?? userPageConsts.txtUnknown,
                        ),
                        trailing: PopupMenuButton(
                          icon: const Icon(Icons.more_horiz),
                          initialValue: dropDownController.value,
                          onSelected: (item) {
                            dropDownController.value = item;
                          },
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                              value: 0,
                              child: Text(
                                userPageConsts.txtInfo,
                              ),
                            ),
                          ],
                        ),
                        tileColor: ColorPallets.white500,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onTap: () {
                          ///Navigate to user details page
                          ///pass [UserDetailsModel] to details page
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserDetailsPage(
                                  model: userData,
                                ),
                              ));
                        },
                      ),
                    );
                  },
                  // seprated builder
                  separatorBuilder: (context, index) => SizedBox(
                    height: context.screenHeight(10),
                  ),
                );
              },
              error: (error, stackTrace) => Center(
                ///when error shows error message
                ///along with refresh indicator for invalidate provider
                child: Column(
                  children: [
                    Text(error.toString()),
                    IconButton(
                        onPressed: () {
                          // invalidation
                          ref.invalidate(fetchAllUserDataProvider);
                        },
                        icon: const Icon(Icons.refresh_outlined))
                  ],
                ),
              ),
              // loading screen
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
