import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:townsquare/Constants/AppColor.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final String time;
  final String location;
  final String spots;
  final String intensity;
  final String price;
  final bool available;
  final bool? childcare;
  final VoidCallback? onJoinPressed;

  const ActivityCard({
    super.key,
    required this.title,
    required this.time,
    required this.location,
    required this.spots,
    required this.intensity,
    required this.price,
    required this.available,
    this.childcare,
    this.onJoinPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(16.w).copyWith(bottom: 5.h),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: isDarkMode
            ? Border.all(color: Colors.white)
            : Border.all(color: Colors.grey.withOpacity(0.3)),
        boxShadow: isDarkMode
            ? [] // No shadow in dark mode
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 4), // Shadow position
                  blurRadius: 4,
                ),
              ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: isDarkMode ? Colors.white : Colors.black54,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 4.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16.sp,
                      color: isDarkMode ? AppColors.greyText : Colors.black54,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: isDarkMode ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    // Spots
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? AppColors.darkerGrey
                            : AppColors.greyBackground,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 16.sp,
                            color: isDarkMode
                                ? Colors.white70
                                : AppColors.greyText,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            spots,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: isDarkMode
                                  ? Colors.white70
                                  : AppColors.greyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 4.w),
                    // Intensity
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: getIntensityColor(intensity),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        intensity,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: getFontColor(intensity),
                        ),
                      ),
                    ),
                    if (childcare == true) ...[
                      SizedBox(width: 4.w),
                      // Childcare
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 8.w),
                        decoration: BoxDecoration(
                          color: AppColors.greenButton,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          "Childcare",
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greenFont,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          // Right Section
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Column(
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 12.h),
                ElevatedButton(
                  onPressed: available ? onJoinPressed : null,
                  style: ElevatedButton.styleFrom(
                    // Remove backgroundColor here
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    minimumSize: Size(60.w, 32.h),
                    padding: EdgeInsets.zero,
                    elevation: 5, // Optional: Adds a shadow when pressed
                  ).copyWith(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.pressed)) {
                          // Highlight color when pressed
                          return isDarkMode
                              ? AppColors.darkerGrey
                                  .withOpacity(0.1) // Dark mode pressed
                              : Colors.white
                                  .withOpacity(0.1); // Light mode pressed
                        }
                        return available
                            ? (isDarkMode ? Colors.white : Colors.black)
                            : (isDarkMode
                                ? AppColors.darkerGrey
                                : AppColors.darkerGrey);
                      },
                    ),
                  ),
                  child: Text(
                    available ? "Join" : "Sold Out",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: available
                          ? (isDarkMode
                              ? Colors.black // Dark mode & available
                              : Colors.white) // Light mode & available
                          : (isDarkMode
                              ? Colors.white // Dark mode & not available
                              : Colors.black), // Light mode & not available
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
