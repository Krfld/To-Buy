import 'package:flutter/material.dart';
import '../utils/logger.dart';

import '../services/products_service.dart';
import '../classes/product.dart';

class ProductsView extends StatelessWidget {
  // final String currentGroupId;
  // final String currentListId;

  const ProductsView({Key? key}) : super(key: key);

  final double elevation = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        // icon: Icon(Icons.add),
        // label: Text('Add'),
        onPressed: () => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AddProduct(),
        ),
      ),
      appBar: AppBar(
        elevation: elevation,
        title: Text('Products'),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.settings),
        //     onPressed: () => null,
        //   ),
        // ],
      ),
      body: StreamBuilder<Products>(
        stream: ProductsService.productsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());

          Products products = snapshot.data!;
          Products productsToBuy = products.where((product) => product.content.bought == null).toList()
            ..sort((a, b) => a.content.added.compareTo(b.content.added));
          Products productsBought = products.where((product) => product.content.bought != null).toList()
            ..sort((a, b) => b.content.bought!.compareTo(a.content.bought!));

          int totalProducts = productsToBuy.length + productsBought.length;

          if (totalProducts == 0) return Center(child: Text('No products'));

          return ListView.separated(
            padding: EdgeInsets.all(16),
            physics: BouncingScrollPhysics(),
            itemCount: totalProducts,
            separatorBuilder: (context, index) => index == productsToBuy.length - 1
                ? Divider(
                    height: 32,
                    indent: 64,
                    endIndent: 64,
                    thickness: 1,
                    color: Theme.of(context).primaryColor,
                  )
                : SizedBox(height: 8),
            itemBuilder: (context, index) {
              bool bought = index >= productsToBuy.length;
              Product product =
                  !bought ? productsToBuy.elementAt(index) : productsBought.elementAt(index - productsToBuy.length);
              return Card(
                elevation: elevation,
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  // contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  leading: bought
                      ? CircleAvatar(
                          child: Icon(Icons.check, color: Theme.of(context).primaryColor),
                          backgroundColor: Colors.transparent,
                        )
                      : null,
                  title: Text(product.content.name),
                  subtitle: product.content.description != null ? Text(product.content.description!) : null,
                  onTap: () => showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => ProductPopup(product),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductPopup extends StatelessWidget {
  final Product product;

  const ProductPopup(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> form = GlobalKey<FormState>();

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(product.content.name),
    );
  }
}

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> form = GlobalKey<FormState>();

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text('Add Product'),
      content: Form(
        key: form,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                // enabled: true, // readOnly: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value?.isEmpty ?? true ? 'Name can\'t be empty' : null,
                onSaved: (value) {
                  //*Update local name
                  Log.print(value!);
                },
              ),
              TextFormField(
                // enabled: true, // readOnly: true,
                minLines: 1,
                maxLines: 4,
                scrollPhysics: BouncingScrollPhysics(),
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(labelText: 'Details'),
                // validator: (value) => value?.isEmpty ?? true ? 'Name can\'t be empty' : null,
                onSaved: (value) {
                  //* Update local description
                  Log.print(value!.trim());
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        OutlinedButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context), //? Confirm to discard changes
        ),
        ElevatedButton(
          child: Text('Add'),
          onPressed: () {
            if (form.currentState!.validate()) form.currentState!.save();
          },
        ),
      ],
    );
  }
}
