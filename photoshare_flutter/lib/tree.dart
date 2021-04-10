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

final Album jimuZushi = Album("jimuZushi", "");
final Album jimuBBQ = Album("jimuBBQ", "");
final Album jimuNomi = Album("jimuNomi", "");
final Album jimuDrive = Album("jimuDrive", "www.googlephoto.com");
final Album jimuSesshou = Album("kobetsuSesshou", "");
final Album jimuHakone =
    Album("jimuHakone", "https://photos.app.goo.gl/GUaKcpuVhez61aLKA");
final Album jimuGyoza =
    Album("jimuGyoza", "https://photos.app.goo.gl/pCm7UXgAWqK53Y6e9");
final Album jimuBowling = Album("jimuBowling", "");
final Album jimuChiba =
    Album("jimuTrip", "https://photos.app.goo.gl/GUaKcpuVhez61aLKA");

Category jimu13th = Category("jimu13th", [jimuBBQ, jimuGyoza, jimuHakone]);
Category jimu14th = Category("jimu14th", [jimuBBQ, jimuGyoza, jimuHakone]);
Category jimu15th = Category("jimu15th", []);

Category jimukyoku = Category("jimukyoku", [jimu13th, jimu14th, jimu15th]);

Category photoShare = Category("photoShare", [jimukyoku]);
