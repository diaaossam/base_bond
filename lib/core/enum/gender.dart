enum Gender {
  male("men"),
  female("women");

  final String name;

  const Gender(this.name);
}

Gender handleGender(dynamic rawValue) {
  if (rawValue == 1 || rawValue == "men") {
    return Gender.male;
  } else {
    return Gender.female;
  }
}
