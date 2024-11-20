import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:townsquare/Constants/AppColor.dart';
import 'package:townsquare/Constants/sample_data.dart';
import 'package:townsquare/Reusable%20Widgets/Activities_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategoryIndex = 0;

  late Map<String, List<Map<String, dynamic>>> groupedActivities;
  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    // Update System UI Overlay Style based on theme
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: EdgeInsets.only(top: 20.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('EEE, MMM d').format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      height: 14.32.h / 12.h,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "This Week in Estepona",
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      height: 23.87 / 20,
                    ),
                  ),
                ],
              ),
            ),
            elevation: 0,
            foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  children: [
                    // IconButton(
                    //   icon: Icon(
                    //     widget.toggleTheme == ThemeMode.light
                    //         ? Icons.dark_mode
                    //         : Icons.light_mode,
                    //     size: 24.sp,
                    //   ),
                    //   onPressed: widget.toggleTheme,
                    // ),
                    IconButton(
                      icon:
                          Icon(Icons.notifications_none_outlined, size: 24.sp),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: CircleAvatar(
                        radius: 16.r,
                        backgroundImage: const AssetImage(
                          'assets/images/user.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
        child: Column(
          children: [
            // Goal Banner
            Container(
              decoration: BoxDecoration(
                color: AppColors.blueBanner,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4), // Shadow position
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(4, 0), // Shadow position
                    blurRadius: 4,
                  ),
                ],
              ),
              height: 110.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You’re close to your goal!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Join more sport activities to collect more points",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                minimumSize: Size(0, 25.h),
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                              ),
                              child: Text(
                                "Join now",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.sp),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                minimumSize: Size(0, 25.h),
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                              ),
                              child: Text(
                                "My points",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.sp),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 60.w,
                        height: 60.h,
                        child: CircularProgressIndicator(
                          value: 0.54,
                          backgroundColor: Colors.white,
                          color: Colors.blue,
                          strokeWidth: 5.w,
                        ),
                      ),
                      Text(
                        "27",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 18.h),
            // Search Bar
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4), // Shadow position
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(4, 0), // Shadow position
                    blurRadius: 4,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "What do you feel like doing?",
                  hintStyle: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyText,
                  ),
                  suffixIcon: Icon(Icons.search, size: 20.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                ),
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4), // Shadow position
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(4, 0), // Shadow position
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            // Scrollable Categories
            Container(
              height: 35.h,
              margin: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add functionality for the icon if needed
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: AppColors.notSelectedPurple,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: const Icon(
                        Icons
                            .filter_list_rounded, // Replace with the desired icon
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategoryIndex = index;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                color: selectedCategoryIndex == index
                                    ? AppColors.selectedPurple
                                    : AppColors.notSelectedPurple,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Center(
                                child: Text(
                                  categories[index],
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            // Activities List
            Expanded(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  return ActivityCard(
                    title: activity['title'],
                    time: activity['time'],
                    location: activity['location'],
                    spots: activity['spots'],
                    intensity: activity['intensity'],
                    price: activity['price'],
                    available: activity['available'],
                    childcare: activity['childcare'],
                    onJoinPressed: activity['available']
                        ? () {
                            // Handle join logic here
                          }
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                size: 35,
                color: Colors.blue,
              ),
              label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
