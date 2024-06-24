import 'package:brainwired_machine_test/core/constants/user_page_constants.dart';
import 'package:brainwired_machine_test/core/themes/colors/color_pallet.dart';
import 'package:brainwired_machine_test/core/utils/dynamic_sizes.dart';
import 'package:brainwired_machine_test/model/user_details_model/user_details_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PersonlaInfoWidget extends StatelessWidget {
  const PersonlaInfoWidget({
    super.key,
    required this.userPageConsts,
    required this.model,
  });

  final UserPageConstants userPageConsts;
  final UserDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: ColorPallets.white500),
        child: Padding(
          padding: EdgeInsets.all(context.screenWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on_outlined),
                  Padding(
                    padding: EdgeInsets.only(right: context.screenWidth(50)),
                    child: Text(userPageConsts.txtAdress),
                  ),
                  Column(
                    children: [
                      Text(
                        model.address!.city!,
                      ),
                      Text(model.address!.street!),
                      Text(model.address!.zipcode!)
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.language),
                  Text(userPageConsts.txtConnect),
                  Padding(
                    padding: EdgeInsets.only(left: context.screenWidth(44)),
                    child: InkWell(
                      onTap: () {
                        // launch url
                        launchUrlString(model.website!);
                      },
                      child: Text(
                        model.website ?? userPageConsts.txtUnknown,
                        style:
                            GoogleFonts.poppins(color: ColorPallets.blueAccent),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: context.screenWidth(5)),
                child: Row(
                  children: [
                    const Icon(Icons.business_sharp),
                    Padding(
                      padding: EdgeInsets.only(left: context.screenWidth(10)),
                      child: Text(userPageConsts.txtCurrentCmpny),
                    ),
                    Text(
                      model.company!.name!,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: context.screenWidth(100)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.company!.bs!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      model.company!.catchPhrase!,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
