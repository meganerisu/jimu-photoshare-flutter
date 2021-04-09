class Category {
  var name;
  var children;

  Category(this.name, this.children);
}

class Album {
  var name;
  var url;

  Album(this.name, this.url);
}

final Album jimuBBQ = Album("jimuBBQ", "www.googlephoto.com");
final Album jimuNomi = Album("jimuNomi", "www.googlephoto.com");
final Album jimuZushi = Album("jimuZushi", "www.googlephoto.com");
final Album jimuDrive = Album("jimuDrive", "www.googlephoto.com");
final Album jimuGyoza = Album("jimuGyoza", "www.googlephoto.com");
final Album jimuTrip = Album("jimuTrip", "www.googlephoto.com");

Category jimukyoku = Category("jimukyoku", [jimuBBQ, jimuNomi, jimuZushi]);
