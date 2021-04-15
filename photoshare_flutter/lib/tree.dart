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
    Album("事務寿司2017", "https://photos.app.goo.gl/knFwQkYYpHjU9dVd9");
final Album jimuBBQ13 =
    Album("事務BBQ2017", "https://photos.app.goo.gl/8U9oAVGSczLSSPWVA");
final Album jimuDrive13 =
    Album("事務ドライブ2017", "https://photos.app.goo.gl/zNX5kMgRozMWDR5e8");
final Album jimuSesshou13 =
    Album("個別折衝2017", "https://photos.app.goo.gl/t7EVff13xwGqnnpC6");
final Album jimuHakone =
    Album("事務旅行（箱根）", "https://photos.app.goo.gl/GUaKcpuVhez61aLKA");
final Album jimuChiba =
    Album("事務旅行（千葉）", "https://photos.app.goo.gl/GUaKcpuVhez61aLKA");
final Album jimuGyoza13 =
    Album("事務餃子2017", "https://photos.app.goo.gl/Nbh6ThtZthczmnvC9");
final Album jimuBowling =
    Album("事務ボウリング2018", "https://photos.app.goo.gl/HQ5XRfmYGS1LsG9eA");

final Album jimuZushi14 =
    Album("事務寿司2018", "https://photos.app.goo.gl/orBkRgUzweBVVKYg8");
final Album jimuNomi14 =
    Album("事務飲み2018", "https://photos.app.goo.gl/fn7i83QjP4iCjyMW8");
final Album jimuBBQ14 = Album("事務BBQ2018", "");
final Album jimuDrive14 = Album("事務ドライブ2018", "");
final Album jimuSaizeriya14 = Album("事務サイゼ2018", "");
final Album jimuGyoza14 =
    Album("事務餃子2019", "https://photos.app.goo.gl/pCm7UXgAWqK53Y6e9");

Category jimu13th = Category("事務13th", [
  jimuZushi13,
  jimuBBQ13,
  jimuDrive13,
  jimuSesshou13,
  jimuGyoza13,
  jimuHakone,
  jimuChiba,
  jimuBowling
]);

Category jimu14th = Category("事務14th", [
  jimuZushi14,
  jimuNomi14,
  jimuBBQ14,
  jimuDrive14,
  jimuSaizeriya14,
  jimuGyoza14
]);
Category jimu15th = Category("事務15th", []);

Category jimukyoku = Category("事務局", [jimu13th, jimu14th, jimu15th]);

Category photoShare = Category("photoShare", [jimukyoku]);
