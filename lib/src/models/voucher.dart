class Voucher {
  final String title;
  final String urlToImage;

  Voucher({this.title, this.urlToImage});
}

List<Voucher> vouchers = [
  new Voucher(
    title: 'Voucher Lorem sales off 50%',
    urlToImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqVFM3eeNS5N7qXVX4VgIJzp4i5tEFzFN7-Q&usqp=CAU',
  ),
  new Voucher(
    title: 'Voucher Makeup sales off 50%',
    urlToImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSttOpbEI7VZYsl0rbtCGXVmsgWwOU7rXCimg&usqp=CAU',
  ),
  new Voucher(
    title: 'Discout 50% for all product in store',
    urlToImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwR3JctxlYYb45xtTum64b0po9feENNO81Bw&usqp=CAU',
  ),
];
