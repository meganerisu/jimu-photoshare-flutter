class Category {
  var name = "";
  var children = [];

  Category(this.name, this.children);
}

class Album {
  var name;
  var url;

  Album(this.name, this.url);
}

// final List urlJimuBBQ = ["www.google.com"];
// final List urlJimuZushi = ["www.amason.com"];
// final List urlJimuDrive = ["www.microsoft.com"];
// final List urlJimuGyoza = ["www.apple.com"];

final Album jimuZushi13 =
    Album("jimuZushi13", "https://photos.app.goo.gl/knFwQkYYpHjU9dVd9");
final Album jimuBBQ13 =
    Album("jimuBBQ13", "https://photos.app.goo.gl/8U9oAVGSczLSSPWVA");
// final Album jimuNomi13 = Album("jimuNomi13", "");
final Album jimuDrive13 =
    Album("jimuDrive13", "https://photos.app.goo.gl/zNX5kMgRozMWDR5e8");
final Album jimuSesshou13 =
    Album("kobetsuSesshou13", "https://photos.app.goo.gl/t7EVff13xwGqnnpC6");
final Album jimuHakone =
    Album("jimuHakone13", "https://photos.app.goo.gl/GUaKcpuVhez61aLKA");
final Album jimuBowling = Album("jimuBowling13", "");
final Album jimuChiba =
    Album("jimuTrip13", "https://photos.app.goo.gl/GUaKcpuVhez61aLKA");
final Album jimuGyoza13 =
    Album("jimuGyoza13", "https://photos.app.goo.gl/Nbh6ThtZthczmnvC9");

final Album jimuBBQ14 = Album("jimuGyoza", "");

final Album jimuGyoza15 =
    Album("jimuGyoza", "https://photos.app.goo.gl/pCm7UXgAWqK53Y6e9");

Category jimu13th = Category("jimu13th", [
  jimuZushi13,
  jimuBBQ13,
  jimuDrive13,
  jimuSesshou13,
  jimuGyoza15,
  jimuHakone,
  jimuBowling,
  jimuChiba
]);
Category jimu14th = Category("jimu14th", [jimuBBQ14, jimuGyoza15, jimuHakone]);
Category jimu15th = Category("jimu15th", []);

Category jimukyoku = Category("jimukyoku", [jimu13th, jimu14th, jimu15th]);

Category photoShare = Category("photoShare", [jimukyoku]);
