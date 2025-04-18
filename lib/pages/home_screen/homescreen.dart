import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  int selectedTabIndex = 0;

  void onTabChanged(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  Widget buildStoreChip(String name, String iconPath, Color bgColor) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: bgColor,
            child: SvgPicture.asset(iconPath, height: 14, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Text(
            name,
            style: GoogleFonts.montserrat(fontSize: 17),
          )
        ],
      ),
    );
  }

  Widget buildProduceCard({
    required String title,
    required String itemCount,
    required String vendorName,
    required String vendorIcon,
    required String itemIcon,
    required Color vendorColor,
    required String price,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 233, 233, 233),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                itemIcon,
                height: 45,
                width: 45,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 18.5,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 0, 171, 89),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    itemCount,
                    style: GoogleFonts.montserrat(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 9,
                        backgroundColor: vendorColor,
                        child: SvgPicture.asset(
                          vendorIcon,
                          height: 10,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        vendorName,
                        style: GoogleFonts.montserrat(fontSize: 14),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          Text(
            "\$$price",
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 0, 171, 89),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Row
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 34,
                          backgroundImage:
                              AssetImage("assets/images/profile.png"),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Morning",
                              style: GoogleFonts.montserrat(
                                  fontSize: 17,
                                  color: const Color.fromARGB(255, 0, 171, 89),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Jessica",
                              style: GoogleFonts.montserrat(
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      "assets/icons/bell.svg",
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),

              // Nearest Vendor Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Nearest Vendor",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Green container vendor info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    color: const Color.fromARGB(255, 0, 171, 89),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      height: 43,
                      width: 43,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 242, 63, 57),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/vendor.svg",
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "Billy Vendor",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "Main Street Downtown",
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    trailing: SvgPicture.asset(
                      "assets/icons/location.svg",
                      height: 24,
                      width: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Popular Stores title row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Stores",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "View All",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 0, 171, 89),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Scrollable Store Chips
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildStoreChip("Billy Vendor", "assets/icons/vendor.svg",
                          Colors.red),
                      buildStoreChip("Jolly’s Farm Stand",
                          "assets/icons/vendor.svg", Colors.green),
                      buildStoreChip(
                          "The Market", "assets/icons/vendor.svg", Colors.blue),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Custom Tab Selector
              // Custom Underline Tab Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => onTabChanged(0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Produces",
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: selectedTabIndex == 0
                                  ? const Color.fromARGB(255, 0, 171, 89)
                                  : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 2,
                            width: 60,
                            color: selectedTabIndex == 0
                                ? const Color.fromARGB(255, 0, 171, 89)
                                : Colors.transparent,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    GestureDetector(
                      onTap: () => onTabChanged(1),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Single items",
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: selectedTabIndex == 1
                                  ? const Color.fromARGB(255, 0, 171, 89)
                                  : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 2,
                            width: 80,
                            color: selectedTabIndex == 1
                                ? const Color.fromARGB(255, 0, 171, 89)
                                : Colors.transparent,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Tab Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: selectedTabIndex == 0
                      ? [
                          buildProduceCard(
                            title: "Fruits Produce",
                            itemCount: "5 items",
                            vendorName: "Walli Vendor",
                            vendorIcon: "assets/icons/vendor.svg",
                            itemIcon: "assets/icons/fruits.svg",
                            vendorColor: Colors.orange,
                            price: "17.54",
                          ),
                          buildProduceCard(
                            title: "Healthy Produce",
                            itemCount: "5 items",
                            vendorName: "Jolly’s Farm Stand",
                            vendorIcon: "assets/icons/vendor.svg",
                            itemIcon: "assets/icons/fruits.svg",
                            vendorColor: Colors.green,
                            price: "10.56",
                          ),
                          buildProduceCard(
                            title: "Family Produce",
                            itemCount: "10 items",
                            vendorName: "Jolly’s Farm Stand",
                            vendorIcon: "assets/icons/vendor.svg",
                            itemIcon: "assets/icons/fruits.svg",
                            vendorColor: Colors.green,
                            price: "22.51",
                          ),
                        ]
                      : [
                          buildProduceCard(
                            title: "Watermelon",
                            itemCount: "Medium",
                            vendorName: "Billy Vendor",
                            vendorIcon: "assets/icons/vendor.svg",
                            itemIcon: "assets/icons/watermelon.svg",
                            vendorColor: Colors.orangeAccent,
                            price: "3.25",
                          ),
                          buildProduceCard(
                            title: "Banana",
                            itemCount: "6 bananas",
                            vendorName: "Walli Vendor",
                            vendorIcon: "assets/icons/vendor.svg",
                            itemIcon: "assets/icons/banana.svg",
                            vendorColor: Colors.green,
                            price: "2.45",
                          ),
                          buildProduceCard(
                            title: "Potato",
                            itemCount: "1 kg",
                            vendorName: "Local Mart",
                            vendorIcon: "assets/icons/vendor.svg",
                            itemIcon: "assets/icons/potato.svg",
                            vendorColor: Colors.green,
                            price: "1.80",
                          ),
                        ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
