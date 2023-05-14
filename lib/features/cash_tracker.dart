
// CLASS FOR STORING CASH TRACE INPUT BY USER
class CashTrackerModel{
  String upToTwelvePM;
  String upToSixPM;
  String upToTwelveAM;


  CashTrackerModel({required this.upToSixPM, required this.upToTwelveAM, required this.upToTwelvePM});

}

// LIST FOR STORING CASH TRACES FOR OTHER PURPOSES, SUCH AS ANALYTICS
List<CashTrackerModel> cashTraces = [];