import 'package:eat_meat/feature/home/adress_or_home/adress/adress_mixin.dart';
import 'package:eat_meat/product/constants/string_constants.dart';
import 'package:eat_meat/product/utility/padding.dart';
import 'package:eat_meat/product/widgets/my_button.dart';
import 'package:flutter/material.dart';

import '../../../../product/widgets/text_field/my_text_field.dart';

class AddressView extends StatefulWidget {
  const AddressView({Key? key}) : super(key: key);
  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> with AddressMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.pagePaddingLow,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: AppPadding.paddingTopLow,
                  child: MyTextField(
                    controller: nameSurname,
                    hintText: 'Name Surname',
                  ),
                ),
                Padding(
                  padding: AppPadding.paddingTopLow,
                  child: MyTextField(
                    controller: province,
                    hintText: 'province',
                  ),
                ),
                Padding(
                  padding: AppPadding.paddingTopLow,
                  child: MyTextField(
                    controller: district,
                    hintText: 'district',
                  ),
                ),
                Padding(
                  padding: AppPadding.paddingTopLow,
                  child: MyTextField(
                    controller: neighbourhood,
                    hintText: 'neighbourhood',
                  ),
                ),
                Padding(
                  padding: AppPadding.paddingTopLow,
                  child: MyTextField(
                    controller: address,
                    hintText: 'address',
                  ),
                ),
                Padding(
                  padding: AppPadding.paddingTopLow,
                  child: MyButton(
                    onPressed: () {
                      saveAddress(
                        province: province.text,
                        district: district.text,
                        neighbourhood: neighbourhood.text,
                        address: address.text,
                        nameSurname: nameSurname.text,
                      );
                    },
                    text: StringConstants.saveButton,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
