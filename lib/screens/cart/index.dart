import 'package:flutter/material.dart';
import 'package:gemstore_flutter/constants/colors.dart';
import 'package:gemstore_flutter/models/data_class.dart';
import 'package:gemstore_flutter/screens/checkout/index.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title: const Text(
          'My orders',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Icon(Icons.menu_outlined, color: Colors.black),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined, color: Colors.black),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  children: MyData.orderCategory.map((category) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          MyData.orderCategory.forEach((item) {
                            item.isSelected = false;
                          });

                          category.isSelected = true;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: category.isSelected ? DeliveredColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              category.name,
                              style: TextStyle(
                                color: category.isSelected ? Colors.white : Colors.black,
                                fontWeight: category.isSelected ? FontWeight.w500 : FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                MyData.orders[index]['orderNumber']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              Text(MyData.orders[index]['date']!),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('Tracking number : '),
                                  Text(
                                    MyData.orders[index]['trackingNumber']!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Quantity : ${MyData.orders[index]['quantity']}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                      'Subtotal :\$ ${MyData.orders[index]['subtotal']}',
                                    style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                MyData.orders[index]['status']!,
                                style: const TextStyle(
                                  color: GreenColor,
                                  fontWeight: FontWeight.w500,

                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CheckoutScreen(
                                        orderNumber: MyData.orders[index]['orderNumber']!,
                                        trackingNumber: MyData.orders[index]['trackingNumber']!,
                                        quantity: MyData.orders[index]['quantity']!,
                                        subtotal: MyData.orders[index]['subtotal']!,
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black, backgroundColor: Colors.white,
                                  side: const BorderSide(color: Colors.black),
                                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                ),
                                child: const Text('Details'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: MyData.orders.length,
            ),
          ),

        ],
      ),
    );
  }
}
