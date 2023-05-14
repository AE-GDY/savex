

// CLASS FOR CREATING A PERSONALIZED GOAL
class PersonalGoal {

  String description;
  String type;
  String amount;
  String time;

  PersonalGoal({required this.description, required this.type, required this.amount, required this.time});

}

// LIST FOR STORING PERSONALIZED GOALS CREATED BY THE USER
List<PersonalGoal> personalGoals = [];