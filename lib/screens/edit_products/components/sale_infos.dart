import 'package:flutter/material.dart';
import 'package:thunderapp/screens/edit_products/add_products_controller.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'currency_format.dart';
import '../../../components/forms/custom_currency_form_field.dart';

class SaleInfos extends StatefulWidget {
  const SaleInfos({Key? key}) : super(key: key);

  @override
  State<SaleInfos> createState() => _SaleInfosState();
}

class _SaleInfosState extends State<SaleInfos> {
  CurrencyInputFormatter currency =
      CurrencyInputFormatter();
  AddProductsController controller =
      AddProductsController();
  double profit = 0.0;

  @override
  void initState() {
    controller.costController.text = 'R\$ 2,68';
    controller.saleController.text = 'R\$ 4,68';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Preço de custo',
                style: TextStyle(
                    color: kTextButtonColor,
                    fontSize: size.height * 0.017),
              ),
              Divider(height: size.height * 0.005,),
              SizedBox(
                height: size.height * 0.06,
                width: size.width * 0.25,
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(6),
                      side: const BorderSide(
                          color: kTextButtonColor)),
                  child: Align(
                      alignment: Alignment.center,
                      child: CustomCurrencyTextFormField(
                        onChanged: (value) {
                          setState(() {
                            profit =
                                controller.changeProfit(
                                    controller
                                        .saleController
                                        .text,
                                    controller
                                        .costController
                                        .text);
                          });
                        },
                        inputFormatter:
                            controller.currencyFormatter,
                        controller:
                            controller.costController,
                      )),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Preço de venda',
                  style: TextStyle(
                      color: kTextButtonColor,
                      fontSize: size.height * 0.017),
                ),
              ),
              Divider(height: size.height * 0.005,),
              SizedBox(
                height: size.height * 0.06,
                width: size.width * 0.26,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(6),
                      side: const BorderSide(
                          color: kTextButtonColor)),
                  child: Align(
                      alignment: Alignment.center,
                      child: CustomCurrencyTextFormField(
                        onChanged: (value) {
                          setState(() {
                            profit =
                                controller.changeProfit(
                                    controller
                                        .saleController
                                        .text,
                                    controller
                                        .costController
                                        .text);
                          });
                        },
                        inputFormatter:
                            controller.currencyFormatter,
                        controller:
                            controller.saleController,
                      )),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lucro R\$',
                style: TextStyle(
                    color: kTextButtonColor,
                    fontSize: size.height * 0.017),
              ),
              Divider(height: size.height * 0.005),
              SizedBox(
                height: size.height * 0.06,
                width: size.width * 0.25,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(6),
                      side: const BorderSide(
                          color: kTextButtonColor)),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        profit.toStringAsPrecision(4),
                        style: TextStyle(
                            fontSize: size.height * 0.017,
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
