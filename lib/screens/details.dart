import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String? image;
  final String? description;
  final double? discountPercentage;
  final double? rating;
  final int? price;
  const DetailsPage(
      {Key? key,
      this.description,
      this.image,
      this.discountPercentage,
      this.price,
      this.rating})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  child: Image.network(widget.image ?? '')),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Container(
              width: double.infinity,
              child: Text(
                widget.description ?? '',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.black.withOpacity(0.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  productsDetails(
                      icon:Icons.money,value: widget.price?.toDouble()??0,),
                  productsDetails(
                      icon:Icons.percent,value: widget.discountPercentage ?? 0),
                 productsDetails(
                      icon:Icons.star,value: widget.rating ?? 0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row productsDetails({required IconData icon, required double value}) {
    return Row(
      children: [
        Icon(icon, color: Colors.white,),
        SizedBox(width:4.0),
        Text(value.toString(), style: TextStyle(color: Colors.white),)
      ],
    );
  }
}
