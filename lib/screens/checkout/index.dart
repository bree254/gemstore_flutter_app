import 'package:flutter/material.dart';
import 'package:gemstore_flutter/constants/colors.dart';
import 'package:gemstore_flutter/screens/main_page/index.dart';
class CheckoutScreen extends StatefulWidget {

  final String orderNumber;
  final String trackingNumber;
  final String quantity;
  final String subtotal;

  const CheckoutScreen({
    Key? key,
    required this.orderNumber,
    required this.trackingNumber,
    required this.quantity,
    required this.subtotal,
  }) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading:  IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(widget.orderNumber,style: const TextStyle(color: Colors.black),),
        ),
        body:CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:OrderGrayColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Your order is delivered',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),),
                            SizedBox(height: 15),
                            Text('Rate product to get 5 points for collect.',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),)
                          ],
                        ),
                        Image.asset(
                          'assets/icons/pay.png',
                          color: Colors.white,
                          height: 50,
                          width: 50,
                        ),

                      ],
                    ),
                  ),

                ),
              ),
            ),
            SliverToBoxAdapter(
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Order number'),
                            Text(
                                widget.orderNumber,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Tracking Number'),
                            Text(
                                widget.trackingNumber,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Delivery address'),
                            Text(
                                ' SBI Building, Software Park',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 240,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Maxi Dress ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                Text(
                                  ' X ${widget.quantity}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                const Text(
                                  ' \$68.00',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Linen Dress ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                Text(
                                  ' X ${widget.quantity}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                const Text(
                                  ' \$52.00',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Sub Total',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                Text(
                                  ' \$  ${widget.subtotal}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Shipping',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                Text(
                                  ' \$ 0.00',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            const Divider(),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                Text(
                                  ' \$  ${widget.subtotal}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height:45,
                      width: 170,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPage ()));
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black, backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black),
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text('Return home',style: TextStyle(color: OrderGrayColor,fontSize: 16),),
                      ),
                    ),

                    SizedBox(
                      height:45,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {
                          // Action when details button is pressed
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black, backgroundColor: RateColor,
                          side: BorderSide(color: Colors.black),
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text('Rate',style: TextStyle(color: Colors.white,fontSize: 16),),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],

        )
    );
  }
}
