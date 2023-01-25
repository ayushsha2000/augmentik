import 'package:agumentik/bloc/dummy_logic_bloc.dart';
import 'package:agumentik/model/dummy_model/product.dart';
import 'package:agumentik/screens/details.dart';
import 'package:agumentik/screens/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Product> products = [];
  // DummyLogicBloc? dummyLogicBloc;
  @override
  void initState() {
    context.read<DummyLogicBloc>().add(GetProductList());
    // dummyLogicBloc = DummyLogicBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DummyLogicBloc(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black, 
          child: Icon(Icons.info),
          onPressed: () {
          showDialog(context: context, builder: (context)=>FormDialog());
        }),
        appBar: AppBar(
          title: const Text('HomePage'),
        ),
        body: BlocListener<DummyLogicBloc, DummyLogicState>(
          listener: (context, state) {
            if (state is DummyLogicFetchError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<DummyLogicBloc, DummyLogicState>(
            bloc: context.read(),
            builder: (context, state) {
              if (state is DummyLogicLoaded) {
                return _buildGrid(context, state.product);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildGrid(BuildContext context, List<Product> product) {
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: product.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        description: product[index].description,
                        image: product[index].thumbnail,
                        discountPercentage: product[index].discountPercentage,
                        price: product[index].price,
                        rating: product[index].rating,
                      ),
                    ),
                  );
                },
                child: Container(
                  // color: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      child: Image.network(
                        product[index].thumbnail ?? '',
                      )),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8.0),
                      ),
                      color: Colors.white),
                  child: Text(
                    product[index].title ?? '',
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            )
          ],
        );
      });
}
