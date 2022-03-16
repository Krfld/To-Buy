import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/logger.dart';

import '../services/products_service.dart';
import '../classes/product.dart';

class ProductsView extends StatelessWidget {
  // final String currentGroupId;
  // final String currentListId;

  const ProductsView({Key? key}) : super(key: key);

  final double elevation = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        elevation: elevation,
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
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => null,
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(height: 8), // Divider
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            elevation: elevation,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              title: Text('Product $index'),
              subtitle: Text('Details'),
              onTap: () => showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => ProductPopup(index.toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> form = GlobalKey<FormState>();

    return AlertDialog(
      title: Text('Add Product'),
      content: Form(
        key: form,
        // onWillPop: () => Log.print('onWillPop'),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                enabled: true, // readOnly: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value?.isEmpty ?? true ? 'Name can\'t be empty' : null,
                onSaved: (value) {
                  // Update local name
                  Log.print(value);
                },
              ),
              TextFormField(
                scrollPhysics: BouncingScrollPhysics(),
                enabled: true, // readOnly: true,
                minLines: 1,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(labelText: 'Details'),
                // validator: (value) => value?.isEmpty ?? true ? 'Name can\'t be empty' : null,
                onSaved: (value) {
                  // Update local details
                  Log.print(value);
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

class ProductPopup extends StatelessWidget {
  final Token token;

  const ProductPopup(this.token, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> form = GlobalKey<FormState>();

    return AlertDialog(title: Text('Product $token'));
  }
}
