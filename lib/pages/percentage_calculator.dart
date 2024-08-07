import 'package:flutter/material.dart';
import 'package:mathtool/constants/colors.dart';

class DiscountCalculator extends StatefulWidget {
  const DiscountCalculator({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<DiscountCalculator> createState() => _DiscountCalculatorState();
}

class _DiscountCalculatorState extends State<DiscountCalculator> {
  String totalprice = '0';
  String discount = '0';
  double discountprice = 0.0;
  double saved = 0.0;
  var priceController = TextEditingController();
  var discountController = TextEditingController();

  var showTotalPrice = "";
  var showDiscount = "";

  var listOfDiscounts = [];

  @override
  void dispose() {
    priceController.dispose();
    discountController.dispose();
    super.dispose();
  }

  _calculate(totalprice, discount) {
    totalprice = double.parse(totalprice);
    discount = double.parse(discount);
    double cal = (discount * totalprice) / 100;
    discountprice = totalprice - cal;
    return discountprice;
  }

  double _calculateAmountSaved(totalprice, discountprice) {
    totalprice = double.parse(totalprice);
    double saved = totalprice - discountprice;
    return saved;
  }

  _savedButton(showtotalprice, showdiscount, discountprice, saved) {
    listOfDiscounts.add(
      {
        "Price": showtotalprice,
        "Discount": showdiscount,
        "Discounted Price": discountprice,
        "Saved": saved,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Discount Calculator",
          style: TextStyle(color: AppColors.whiteColor),
        ),
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90), //Not Working
                  ),
                  hintText: "Enter Price",
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: discountController,
                keyboardType: TextInputType.number,
                style: const TextStyle(),
                decoration: const InputDecoration(
                  hintText: "Enter Discount",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              IconButton(
                onPressed: () {
                  showTotalPrice = priceController.text;
                  showDiscount = discountController.text;

                  discountprice = _calculate(priceController.text, discountController.text);

                  saved = _calculateAmountSaved(priceController.text, discountprice);
                  priceController.clear();
                  discountController.clear();
                  setState(() {});
                },
                icon: Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Center(
                    child: Text(
                      "Discount",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 370.0,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                    color: AppColors.primaryColor),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Calculations",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Price: ${showTotalPrice == "" // Ambigious logic but working
                                    ? "" : "$showTotalPrice Rs"}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Discount: ${showDiscount == "" ? " " : "$showDiscount%"}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                discountprice == 0.0 ? "Discounted Price: " : "Discounted Price: $discountprice",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                saved == 0.0 ? "Saved: " : "Saved Rs: $saved",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
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
