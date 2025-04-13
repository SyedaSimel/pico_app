import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersTab extends StatefulWidget {
  const OrdersTab({super.key});

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> {
  int selected = 0;
  final List<String> tabs = ["Current", "Previous"];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final scale = screenWidth / 375;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 18 * scale, vertical: 12 * scale),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tab Bar
          Container(
            height: 45 * scale,
            decoration: BoxDecoration(
              color: const Color(0xFFE9E9E9),
              borderRadius: BorderRadius.circular(19 * scale),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  alignment: Alignment(-1 + (selected * 2.0), 0),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: FractionallySizedBox(
                    widthFactor: 1 / tabs.length,
                    heightFactor: 1,
                    child: Container(
                      margin: EdgeInsets.all(4 * scale),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 249, 178, 51),
                        borderRadius: BorderRadius.circular(15 * scale),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: List.generate(tabs.length, (index) {
                    final isSelected = selected == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selected = index),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            tabs[index],
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 15 * scale,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          SizedBox(height: 20 * scale),

          // Content
          if (selected == 0) ...[
            OrderCard(
              scale: scale,
              items: [
                OrderItem(
                  name: "Fruits Produce",
                  price: "\$17.54",
                  iconPath: "assets/icons/fruits.svg",
                ),
              ],
            )
          ] else ...[
            OrderCard(
              scale: scale,
              items: [
                OrderItem(
                  name: "Fruits Produce",
                  price: "\$17.54",
                  iconPath: "assets/icons/fruits.svg",
                ),
              ],
            ),
            SizedBox(height: 10 * scale),
            OrderCard(
              scale: scale,
              items: [
                OrderItem(
                  name: "1x Fruits Produce",
                  price: "\$17.54",
                  iconPath:
                      "assets/icons/fruits.svg", // Update with your asset path
                ),
                OrderItem(
                  name: "6x Banana’s",
                  price: "\$10.56",
                  iconPath:
                      "assets/icons/banana.svg", // Update with your asset path
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final double scale;
  final List<OrderItem> items;

  const OrderCard({
    super.key,
    required this.scale,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16 * scale),
      decoration: BoxDecoration(
        color: const Color(0xFFE9E9E9),
        borderRadius: BorderRadius.circular(12 * scale),
      ),
      child: Column(
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order ID 76372",
                style: GoogleFonts.montserrat(
                  fontSize: 20 * scale,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Vouchers",
                    style: GoogleFonts.montserrat(
                      fontSize: 14 * scale,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 1 * scale), // ← REDUCE THIS
                  Text(
                    "\$10.99",
                    style: GoogleFonts.montserrat(
                      fontSize: 14 * scale,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    // ← Remove this one **if not needed**
                    "\$10.98",
                    style: GoogleFonts.montserrat(
                      fontSize: 14 * scale,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12 * scale),

          // Items List
          ...items.map((item) => Padding(
                padding: EdgeInsets.only(bottom: 6 * scale),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      item.iconPath,
                      height: 17 * scale,
                      width: 17 * scale,
                    ),
                    SizedBox(width: 6 * scale),
                    Text(
                      item.name,
                      style: GoogleFonts.montserrat(fontSize: 16 * scale),
                    ),
                    SizedBox(width: 6 * scale),
                    Text(
                      item.price,
                      style: GoogleFonts.montserrat(
                        fontSize: 14 * scale,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(height: 5 * scale),
          Container(height: 1, color: Colors.grey.shade400),
          SizedBox(height: 5 * scale),

          // Footer Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 25 * scale,
                    height: 25 * scale,
                    padding: EdgeInsets.all(4 * scale),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 249, 178, 51),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/vendor.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 8 * scale),
                  Text(
                    "Walli Vendor",
                    style: GoogleFonts.montserrat(fontSize: 13 * scale),
                  ),
                  SizedBox(width: 6 * scale),
                  SvgPicture.asset(
                    "assets/icons/forwardarrow.svg",
                    height: 12 * scale,
                    width: 12 * scale,
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/deliveryman.svg",
                    height: 16 * scale,
                  ),
                  SizedBox(width: 4 * scale),
                  Text(
                    "15 min",
                    style: GoogleFonts.montserrat(fontSize: 13 * scale),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderItem {
  final String name;
  final String price;
  final String iconPath;

  OrderItem({
    required this.name,
    required this.price,
    required this.iconPath,
  });
}
