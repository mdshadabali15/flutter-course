import 'package:flutter/material.dart';
import 'package:my_shop/modal/ProductModel.dart';
import 'package:my_shop/providers/product_provider.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  static const routeName = '/edit_screen';

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _focusPrice = FocusNode();
  final _focusDescription = FocusNode();
  final _imageEditingController = TextEditingController();
  final _formGlobalKey = GlobalKey<FormState>();
  ProductModel productModel = ProductModel(
    id: null,
    price: 0.0,
    title: '',
    description: '',
    imageUrl: '',
  );

  @override
  void dispose() {
    // TODO: implement dispose
    // If you can't dispose this it
    // will lead to mermory leak

    _focusDescription.dispose();
    _focusPrice.dispose();
    _imageEditingController.dispose();
    super.dispose();
  }

  bool _isFormSaved = false;

  void _saveForm() {
    setState(() {
      _isFormSaved = true;
    });
    if (!_formGlobalKey.currentState.validate()) return;
    _formGlobalKey.currentState.save();

    Provider.of<ProductProviders>(context, listen: false)
        .saveProduct(productModel)
        .catchError((error) {
      return showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error occurred'),
          content: Text('Not able to process request'),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      );
    }).then((_) {
      setState(() {
        _isFormSaved = false;
      });
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: _isFormSaved
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: _formGlobalKey,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Value';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_focusPrice);
                      },
                      onSaved: (newValue) {
                        productModel.title = newValue;
                      },
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Price',
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        focusNode: _focusPrice,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Value';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please Enter Valid value';
                          }
                          return null;
                        },
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_focusDescription);
                        },
                        onSaved: (newValue) {
                          productModel.price = double.parse(newValue);
                        }),
                    TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Description',
                        ),
                        keyboardType: TextInputType.multiline,
                        focusNode: _focusDescription,
                        maxLines: 3,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Value';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          productModel.description = newValue;
                        }),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 8, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageEditingController.text.isEmpty
                              ? Text('Enter URL')
                              : FittedBox(
                                  child: Image.network(
                                    _imageEditingController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Image Url',
                              ),
                              keyboardType: TextInputType.url,
                              textInputAction: TextInputAction.done,
                              controller: _imageEditingController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Value';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                productModel.imageUrl = newValue;
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
