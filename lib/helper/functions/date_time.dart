import 'package:intl/intl.dart';

List <dynamic> parseDateTime (String dateTimeString) {

  // Parse the date string
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Extract the time part
  String formattedTime = "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";


  // Extract the date part
  String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";

  // Return the formatted date and time
  return [formattedDate, formattedTime];

} 



String formatDate(String dateTimeString) {

  DateTime dateTime = DateTime.parse(dateTimeString);
  String day = dateTime.day.toString();
  String month = DateFormat.MMMM().format(dateTime);


  return "$day $month";
}

String formatTime(String timeString) {

  return timeString.substring(0, 5);
  
}


String formatMonth(String month) {
  DateTime dateTime = DateTime.parse('$month-01');
  return DateFormat('MMMM y').format(dateTime);
}