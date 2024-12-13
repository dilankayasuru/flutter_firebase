import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsAdd extends StatefulWidget {
  const ProductsAdd({super.key});

  @override
  State<ProductsAdd> createState() => _ProductsAddState();
}

class _ProductsAddState extends State<ProductsAdd> {
  final nameTxtController = TextEditingController();
  final colorTxtController = TextEditingController();
  final brandTxtController = TextEditingController();
  final sizeTxtController = TextEditingController();

  String errorTxt = "";

  @override
  Widget build(BuildContext context) {
    CollectionReference product =
        FirebaseFirestore.instance.collection('products');

    Future<void> addProduct() {
      return product
          .add({
            "pname": nameTxtController.text,
            "brand": brandTxtController.text,
            "color": colorTxtController.text,
            "size": int.parse(sizeTxtController.text),
          })
          .then(
            (value) => {
              setState(() {
                errorTxt = "Product added";
              })
            },
          )
          .catchError(
            (error) => {
              setState(() {
                errorTxt = "Failed to add product: $error";
              })
            },
          );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new product"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24.0,
            )),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameTxtController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(64)),
                ),
                label: Text("Product name"),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: brandTxtController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(64)),
                ),
                label: Text("Product brand"),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: sizeTxtController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(64)),
                ),
                label: Text("Product size"),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: colorTxtController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(64)),
                ),
                label: Text("Product color"),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            FilledButton(
              onPressed: () async {
                try{
                  addProduct();
                } catch (error) {
                  setState(() {
                    errorTxt = error.toString();
                  });
                }
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: const Text(
                  textAlign: TextAlign.center,
                  "Add product",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              errorTxt,
              style: const TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
