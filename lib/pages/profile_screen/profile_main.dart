import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'vouchers_tab.dart';
import 'orders_tab.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({super.key});

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  int selectedIndex = 0;
  final tabs = ['Posts', 'Vouchers', 'Orders'];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile",
                      style: GoogleFonts.montserrat(
                        fontSize: screenWidth * 0.065,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SvgPicture.asset("assets/icons/settings.svg"),
                  ],
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                    padding: const EdgeInsets.only(
                        top: 60, bottom: 1, left: 24, right: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: const Color.fromARGB(255, 0, 171, 89),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Jessica Melinda",
                          style: GoogleFonts.montserrat(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons/location.svg",
                                color: Colors.white, height: 14),
                            const SizedBox(width: 4),
                            Text(
                              "Los Angeles",
                              style: GoogleFonts.montserrat(
                                fontSize: screenWidth * 0.038,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            double tabWidth =
                                constraints.maxWidth / tabs.length;

                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(tabs.length, (index) {
                                    final isSelected = selectedIndex == index;
                                    return Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                        },
                                        child: Column(
                                          children: [
                                            Text(
                                              tabs[index],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.montserrat(
                                                fontSize: screenWidth * 0.042,
                                                fontWeight: FontWeight.w600,
                                                color: isSelected
                                                    ? const Color.fromARGB(
                                                        255, 249, 178, 51)
                                                    : Colors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                  bottom: -6,
                                  left: tabWidth * selectedIndex +
                                      tabWidth / 2 -
                                      5,
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 249, 178, 51),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage("assets/images/profile.png"),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              _buildTabContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (selectedIndex) {
      case 0:
        return _buildPostSection();
      case 1:
        return const VouchersTab();
      case 2:
        return const OrdersTab();
      default:
        return const SizedBox();
    }
  }

  Widget _buildPostSection() {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: List.generate(
        5,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/profile.png", height: 37),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jessica Melinda",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.043,
                          ),
                        ),
                        Text(
                          "12 Jan 2022",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.035,
                            color: const Color.fromARGB(255, 200, 200, 200),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/icons/options.svg",
                      height: 6,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Image.asset(
                  "assets/images/post.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/icons/heart.svg", height: 20),
                  const SizedBox(width: 4),
                  Text("143k",
                      style: GoogleFonts.montserrat(
                          fontSize: screenWidth * 0.035)),
                  const SizedBox(width: 16),
                  SvgPicture.asset("assets/icons/comment.svg", height: 20),
                  const SizedBox(width: 4),
                  Text("13k",
                      style: GoogleFonts.montserrat(
                          fontSize: screenWidth * 0.035)),
                  const SizedBox(width: 16),
                  SvgPicture.asset("assets/icons/share.svg", height: 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
