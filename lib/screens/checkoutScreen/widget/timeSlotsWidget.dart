// import 'package:project/helper/utils/generalImports.dart';

// class GetTimeSlots extends StatelessWidget {
//   const GetTimeSlots({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List lblMonthsNames = [
//       "months_names_january",
//       "months_names_february",
//       "months_names_march",
//       "months_names_april",
//       "months_names_may",
//       "months_names_june",
//       "months_names_july",
//       "months_names_august",
//       "months_names_september",
//       "months_names_october",
//       "months_names_november",
//       "months_names_december",
//     ];

//     List lblWeekDaysNames = [
//       "week_days_names_monday",
//       "week_days_names_tuesday",
//       "week_days_names_wednesday",
//       "week_days_names_thursday",
//       "week_days_names_friday",
//       "week_days_names_saturday",
//       "week_days_names_sunday",
//     ];
//     return Container(
//       decoration: DesignConfig.boxDecorationSpecific(
//           Theme.of(context).cardColor, 10, true, false),
//       width: context.width,
//       child: Padding(
//         padding: EdgeInsetsDirectional.only(
//             start: Constant.size10, top: Constant.size10, end: Constant.size10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomTextLabel(
//               jsonKey: context
//                           .read<CheckoutProvider>()
//                           .timeSlotsData
//                           ?.timeSlotsIsEnabled ==
//                       "true"
//                   ? "preferred_delivery_date_time"
//                   : "estimate_delivery_date",
//               softWrap: true,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: ColorsRes.mainTextColor,
//               ),
//             ),
//             getSizedBox(
//               height: Constant.size10,
//             ),
//             if (context
//                     .read<CheckoutProvider>()
//                     .timeSlotsData
//                     ?.timeSlotsIsEnabled ==
//                 "true")
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: List.generate(
//                     int.parse(context
//                             .read<CheckoutProvider>()
//                             .timeSlotsData
//                             ?.timeSlotsAllowedDays ??
//                         "0"),
//                     (index) {
//                       int daysStartFrom = int.parse(context
//                                   .read<CheckoutProvider>()
//                                   .timeSlotsData
//                                   ?.estimateDeliveryDays
//                                   .toString() ??
//                               "0") -
//                           1;
//                       late DateTime dateTime =
//                           DateTime.now().add(Duration(days: daysStartFrom));
//                       if (index == 0 &&
//                           context.read<CheckoutProvider>().selectedDate ==
//                               null) {
//                         String date = dateTime.day.toString();
//                         String month = dateTime.month.toString();
//                         String year = dateTime.year.toString();
//                         context.read<CheckoutProvider>().selectedDate =
//                             "$date-$month-$year";
//                       }

//                       return GestureDetector(
//                         onTap: () {
//                           context.read<CheckoutProvider>().setSelectedTime(-1);
//                           context
//                               .read<CheckoutProvider>()
//                               .setSelectedDate(index);
//                           String date = dateTime
//                               .add(Duration(days: index))
//                               .day
//                               .toString();
//                           String month = dateTime
//                               .add(Duration(days: index))
//                               .month
//                               .toString();
//                           String year = dateTime
//                               .add(Duration(days: index))
//                               .year
//                               .toString();
//                           context.read<CheckoutProvider>().selectedDate =
//                               "$date-$month-$year";
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 15),
//                           margin:
//                               const EdgeInsetsDirectional.fromSTEB(0, 5, 10, 5),
//                           decoration: BoxDecoration(
//                               color: context
//                                           .read<CheckoutProvider>()
//                                           .selectedDateId ==
//                                       index
//                                   ? Theme.of(context).cardColor
//                                   : Theme.of(context).scaffoldBackgroundColor,
//                               borderRadius: Constant.borderRadius7,
//                               border: Border.all(
//                                 width: context
//                                             .read<CheckoutProvider>()
//                                             .selectedDateId ==
//                                         index
//                                     ? 1
//                                     : 0.3,
//                                 color: context
//                                             .read<CheckoutProvider>()
//                                             .selectedDateId ==
//                                         index
//                                     ? ColorsRes.appColor
//                                     : ColorsRes.grey,
//                               )),
//                           child: Column(
//                             children: [
//                               CustomTextLabel(
//                                 jsonKey: lblWeekDaysNames[dateTime
//                                         .add(Duration(days: index))
//                                         .weekday -
//                                     1],
//                                 style: TextStyle(
//                                   color: context
//                                               .read<CheckoutProvider>()
//                                               .selectedDateId ==
//                                           index
//                                       ? ColorsRes.mainTextColor
//                                       : ColorsRes.grey,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                               Text(
//                                   dateTime
//                                       .add(Duration(days: index))
//                                       .day
//                                       .toString(),
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: context
//                                                 .read<CheckoutProvider>()
//                                                 .selectedDateId ==
//                                             index
//                                         ? ColorsRes.mainTextColor
//                                         : ColorsRes.grey,
//                                   )),
//                               CustomTextLabel(
//                                 jsonKey: lblMonthsNames[
//                                     dateTime.add(Duration(days: index)).month -
//                                         1],
//                                 style: TextStyle(
//                                   color: context
//                                               .read<CheckoutProvider>()
//                                               .selectedDateId ==
//                                           index
//                                       ? ColorsRes.mainTextColor
//                                       : ColorsRes.grey,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             if (context
//                     .read<CheckoutProvider>()
//                     .timeSlotsData
//                     ?.timeSlotsIsEnabled !=
//                 "true")
//               Text.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                       text:
//                           getTranslatedValue(context, "estimate_delivery_date"),
//                       style: TextStyle(
//                         color: ColorsRes.mainTextColor,
//                       ),
//                     ),
//                     TextSpan(
//                       text:
//                           " ${DateTime.now().add(Duration(days: Constant.estimateDeliveryDays)).toString().formatEstimateDate()}",
//                       style: TextStyle(
//                         color: ColorsRes.mainTextColor,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             getSizedBox(
//               height: Constant.size5,
//             ),
//             if (context
//                     .read<CheckoutProvider>()
//                     .timeSlotsData
//                     ?.timeSlotsIsEnabled ==
//                 "true")
//               Column(
//                 children: List.generate(
//                   context
//                           .read<CheckoutProvider>()
//                           .timeSlotsData
//                           ?.timeSlots
//                           .length ??
//                       0,
//                   (index) {
//                     var now = DateTime.now();
//                     bool isActive = false;
//                     bool isToday = context
//                                 .read<CheckoutProvider>()
//                                 .timeSlotsData
//                                 ?.estimateDeliveryDays
//                                 .toString() ==
//                             "1" &&
//                         context.read<CheckoutProvider>().selectedDateId == 0;
//                     String time = context
//                             .read<CheckoutProvider>()
//                             .timeSlotsData
//                             ?.timeSlots[index]
//                             .lastOrderTime
//                             .toString() ??
//                         "";

//                     late DateTime dateTime = now.copyWith(
//                         hour: int.parse(time.split(":")[0]),
//                         microsecond: int.parse(time.split(":")[1]),
//                         second: int.parse(time.split(":")[2]));

//                     if (now.isAfter(dateTime)) {
//                       if (isToday) {
//                         isActive = false;
//                       } else {
//                         isActive = true;
//                       }
//                     } else {
//                       isActive = true;
//                     }
//                     if (index == 0) {
//                       context
//                           .read<CheckoutProvider>()
//                           .addOrResetTimeSlots(true);
//                     }
//                     if (isActive) {
//                       context
//                           .read<CheckoutProvider>()
//                           .addOrResetTimeSlots(false);

//                       if (context
//                               .read<CheckoutProvider>()
//                               .initiallySelectedIndex ==
//                           -1) {
//                         context
//                             .read<CheckoutProvider>()
//                             .setSelectedTimeWithoutNotify(index);
//                       }
//                       return GestureDetector(
//                         onTap: () {
//                           context
//                               .read<CheckoutProvider>()
//                               .setSelectedTime(index);
//                         },
//                         child: Container(
//                           padding: EdgeInsets.zero,
//                           margin: EdgeInsets.zero,
//                           decoration: BoxDecoration(
//                             border: BorderDirectional(
//                               bottom: BorderSide(
//                                 width: 1,
//                                 color: context
//                                             .read<CheckoutProvider>()
//                                             .timeSlotsData
//                                             ?.timeSlots
//                                             .length ==
//                                         index + 1
//                                     ? Colors.transparent
//                                     : ColorsRes.grey.withOpacity(0.1),
//                               ),
//                             ),
//                           ),
//                           child: Row(
//                             children: [
//                               CustomTextLabel(
//                                 text: context
//                                         .read<CheckoutProvider>()
//                                         .timeSlotsData
//                                         ?.timeSlots[index]
//                                         .title ??
//                                     "",
//                                 style: TextStyle(
//                                   color: ColorsRes.mainTextColor,
//                                 ),
//                               ),
//                               const Spacer(),
//                               CustomRadio(
//                                 visualDensity: VisualDensity.compact,
//                                 materialTapTargetSize:
//                                     MaterialTapTargetSize.shrinkWrap,
//                                 inactiveColor: ColorsRes.mainTextColor,
//                                 value: context
//                                     .read<CheckoutProvider>()
//                                     .selectedTime,
//                                 groupValue: index,
//                                 activeColor: Theme.of(context).primaryColor,
//                                 onChanged: (value) {
//                                   context
//                                       .read<CheckoutProvider>()
//                                       .setSelectedTime(index);
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     } else {
//                       return Container();
//                     }
//                   },
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:project/helper/utils/generalImports.dart';

class GetTimeSlots extends StatefulWidget {
  const GetTimeSlots({super.key});

  @override
  State<GetTimeSlots> createState() => _GetTimeSlotsState();
}

class _GetTimeSlotsState extends State<GetTimeSlots> {
  final List<String> lblMonthsNames = [
    "months_names_january",
    "months_names_february",
    "months_names_march",
    "months_names_april",
    "months_names_may",
    "months_names_june",
    "months_names_july",
    "months_names_august",
    "months_names_september",
    "months_names_october",
    "months_names_november",
    "months_names_december",
  ];

  final List<String> lblWeekDaysNames = [
    "week_days_names_monday",
    "week_days_names_tuesday",
    "week_days_names_wednesday",
    "week_days_names_thursday",
    "week_days_names_friday",
    "week_days_names_saturday",
    "week_days_names_sunday",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeTimeSlots();
    });
  }

  void _initializeTimeSlots() {
    final checkoutProvider = context.read<CheckoutProvider>();
    final timeSlotsData = checkoutProvider.timeSlotsData;

    if (timeSlotsData?.timeSlotsIsEnabled == "true") {
      int daysStartFrom =
          int.parse(timeSlotsData?.estimateDeliveryDays.toString() ?? "0") - 1;
      DateTime dateTime = DateTime.now().add(Duration(days: daysStartFrom));

      // Check if today's slots are finished
      bool areAllSlotsFinished = timeSlotsData?.timeSlots.every((slot) {
            var now = DateTime.now();
            String time = slot.lastOrderTime.toString();
            DateTime slotTime = now.copyWith(
                hour: int.parse(time.split(":")[0]),
                minute: int.parse(time.split(":")[1]),
                second: int.parse(time.split(":")[2]));
            return now.isAfter(slotTime);
          }) ??
          false;

      // Set initial date if not already set
      if (checkoutProvider.selectedDate == null) {
        if (areAllSlotsFinished) {
          // Set to tomorrow if today's slots are finished
          dateTime = dateTime.add(const Duration(days: 1));
          checkoutProvider.setSelectedDate(1);
        } else {
          checkoutProvider.setSelectedDate(0);
        }

        String date = dateTime.day.toString();
        String month = dateTime.month.toString();
        String year = dateTime.year.toString();
        checkoutProvider.selectedDate = "$date-$month-$year";
      }

      // Automatically select the first available slot for today
      if (!areAllSlotsFinished) {
        for (int i = 0; i < timeSlotsData!.timeSlots.length; i++) {
          var now = DateTime.now();
          String time = timeSlotsData.timeSlots[i].lastOrderTime.toString();
          DateTime slotTime = now.copyWith(
            hour: int.parse(time.split(":")[0]),
            minute: int.parse(time.split(":")[1]),
            second: int.parse(time.split(":")[2]),
          );

          if (now.isBefore(slotTime)) {
            checkoutProvider.setSelectedTime(i); // Select this time slot
            break; // Exit the loop once the first available slot is found
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final checkoutProvider = context.read<CheckoutProvider>();
    return Container(
      decoration: DesignConfig.boxDecorationSpecific(
          Theme.of(context).cardColor, 10, true, false),
      width: context.width,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            start: Constant.size10, top: Constant.size10, end: Constant.size10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextLabel(
              jsonKey:
                  checkoutProvider.timeSlotsData?.timeSlotsIsEnabled == "true"
                      ? "preferred_delivery_date_time"
                      : "estimate_delivery_date",
              softWrap: true,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorsRes.mainTextColor,
              ),
            ),
            getSizedBox(height: Constant.size10),

            // Time slots enabled section
            if (checkoutProvider.timeSlotsData?.timeSlotsIsEnabled == "true")
              _buildDateSelection(checkoutProvider),

            // Time slots disabled section
            if (checkoutProvider.timeSlotsData?.timeSlotsIsEnabled != "true")
              _buildEstimatedDeliveryText(),

            getSizedBox(height: Constant.size5),

            // Time slots list
            if (checkoutProvider.timeSlotsData?.timeSlotsIsEnabled == "true")
              _buildTimeSlotsList(checkoutProvider),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelection(CheckoutProvider checkoutProvider) {
    final timeSlotsData = checkoutProvider.timeSlotsData;

    if (timeSlotsData == null) return const SizedBox.shrink();

    int daysStartFrom =
        int.parse(timeSlotsData.estimateDeliveryDays.toString() ?? "0") - 1;
    DateTime dateTime = DateTime.now().add(Duration(days: daysStartFrom));

    // Check if today's slots are finished
    bool areAllSlotsFinished = timeSlotsData.timeSlots.every((slot) {
      var now = DateTime.now();
      String time = slot.lastOrderTime.toString();
      DateTime slotTime = now.copyWith(
        hour: int.parse(time.split(":")[0]),
        minute: int.parse(time.split(":")[1]),
        second: int.parse(time.split(":")[2]),
      );
      return now.isAfter(slotTime);
    });

    // Start index (skip today if all slots are finished)
    int startIndex = areAllSlotsFinished ? 1 : 0;
    int allowedDays = int.parse(timeSlotsData.timeSlotsAllowedDays ?? "0");

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          allowedDays - startIndex, // Adjust length
          (index) {
            int actualIndex =
                index + startIndex; // Offset by 1 if today is skipped
            DateTime currentDate = dateTime.add(Duration(days: actualIndex));

            return GestureDetector(
              onTap: () {
                if ("${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}" ==
                    "${currentDate.day}-${currentDate.month}-${currentDate.year}") {
                  checkoutProvider.setSelectedDate(actualIndex);
                  checkoutProvider.selectedDate =
                      "${currentDate.day}-${currentDate.month}-${currentDate.year}";

                  for (int i = 0; i < timeSlotsData.timeSlots.length; i++) {
                    var now = DateTime.now();
                    String time =
                        timeSlotsData.timeSlots[i].lastOrderTime.toString();
                    DateTime slotTime = now.copyWith(
                      hour: int.parse(time.split(":")[0]),
                      minute: int.parse(time.split(":")[1]),
                      second: int.parse(time.split(":")[2]),
                    );

                    if (now.isBefore(slotTime)) {
                      print('id is $i');
                      checkoutProvider
                          .setSelectedTime(i); // Select this time slot
                      break; // Exit the loop once the first available slot is found
                    }
                  }
                  print(
                      'if condition is working || ${checkoutProvider.selectedTime}');

                  print('it is today');
                } else {
                  print("It is not today");

                  checkoutProvider.setSelectedTime(-1);
                  checkoutProvider.setSelectedDate(actualIndex);
                  checkoutProvider.selectedDate =
                      "${currentDate.day}-${currentDate.month}-${currentDate.year}";
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: const EdgeInsetsDirectional.fromSTEB(0, 5, 10, 5),
                decoration: BoxDecoration(
                  color: checkoutProvider.selectedDateId == actualIndex
                      ? Theme.of(context).cardColor
                      : Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: Constant.borderRadius7,
                  border: Border.all(
                    width: checkoutProvider.selectedDateId == actualIndex
                        ? 1
                        : 0.3,
                    color: checkoutProvider.selectedDateId == actualIndex
                        ? ColorsRes.appColor
                        : ColorsRes.grey,
                  ),
                ),
                child: Column(
                  children: [
                    CustomTextLabel(
                      jsonKey: lblWeekDaysNames[currentDate.weekday - 1],
                      style: TextStyle(
                        color: checkoutProvider.selectedDateId == actualIndex
                            ? ColorsRes.mainTextColor
                            : ColorsRes.grey,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      currentDate.day.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: checkoutProvider.selectedDateId == actualIndex
                            ? ColorsRes.mainTextColor
                            : ColorsRes.grey,
                      ),
                    ),
                    CustomTextLabel(
                      jsonKey: lblMonthsNames[currentDate.month - 1],
                      style: TextStyle(
                        color: checkoutProvider.selectedDateId == actualIndex
                            ? ColorsRes.mainTextColor
                            : ColorsRes.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEstimatedDeliveryText() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: getTranslatedValue(context, "estimate_delivery_date"),
            style: TextStyle(
              color: ColorsRes.mainTextColor,
            ),
          ),
          TextSpan(
            text:
                " ${DateTime.now().add(Duration(days: Constant.estimateDeliveryDays)).toString().formatEstimateDate()}",
            style: TextStyle(
              color: ColorsRes.mainTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSlotsList(CheckoutProvider checkoutProvider) {
    return Column(
      children: List.generate(
        checkoutProvider.timeSlotsData?.timeSlots.length ?? 0,
        (index) {
          var now = DateTime.now();
          bool isActive = false;
          bool isToday =
              checkoutProvider.timeSlotsData?.estimateDeliveryDays.toString() ==
                      "1" &&
                  checkoutProvider.selectedDateId == 0;

          String time = checkoutProvider
                  .timeSlotsData?.timeSlots[index].lastOrderTime
                  .toString() ??
              "";

          DateTime dateTime = now.copyWith(
              hour: int.parse(time.split(":")[0]),
              minute: int.parse(time.split(":")[1]),
              second: int.parse(time.split(":")[2]));

          if (now.isAfter(dateTime)) {
            isActive = !isToday;
          } else {
            isActive = true;
          }

          if (index == 0) {
            checkoutProvider.addOrResetTimeSlots(true);
          }

          if (!isActive) return const SizedBox.shrink();

          checkoutProvider.addOrResetTimeSlots(false);

          return GestureDetector(
            onTap: () {
              checkoutProvider.setSelectedTime(index);
            },
            child: Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                border: BorderDirectional(
                  bottom: BorderSide(
                    width: 1,
                    color: checkoutProvider.timeSlotsData?.timeSlots.length ==
                            index + 1
                        ? Colors.transparent
                        : ColorsRes.grey.withOpacity(0.1),
                  ),
                ),
              ),
              child: Row(
                children: [
                  CustomTextLabel(
                    text: checkoutProvider
                            .timeSlotsData?.timeSlots[index].title ??
                        "",
                    style: TextStyle(
                      color: ColorsRes.mainTextColor,
                    ),
                  ),
                  const Spacer(),
                  CustomRadio(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    inactiveColor: ColorsRes.mainTextColor,
                    value: checkoutProvider.selectedTime,
                    groupValue: index,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (value) {
                      checkoutProvider.setSelectedTime(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
