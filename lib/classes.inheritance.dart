void main(List<String> arguments) {
  var elevated=new ElevatedLocation(1, 2, 3);
  print(elevated);
}

class Location {
  num lat, lng;

  Location(this.lat, this.lng);

  Location.create(this.lat, this.lng);
}

class ElevatedLocation extends Location {
  num elevation;

  ElevatedLocation(num lat, num lng, this.elevation) : super(lat, lng);

  @override
  String toString() {
    return "$lat, $lng, $elevation";
  }
}
