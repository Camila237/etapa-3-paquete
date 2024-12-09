import 'package:flutter/material.dart';
import 'package:paquete_fake_api_store_etapa_3/src/paquete_fake_api_store_etapa_3_base.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/entities/cart_model.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/entities/product_model.dart';
import 'package:paquete_fake_api_store_etapa_3/src/data/entities/user_model.dart';

/// * [ApiDataScreen] is a [StatefulWidget] that displays data fetched from an API.
/// * It shows lists of products, users, and carts.
class ApiDataScreen extends StatefulWidget {
  @override
  _ApiDataScreenState createState() => _ApiDataScreenState();
}

class _ApiDataScreenState extends State<ApiDataScreen> {
  List<ProductModel> _products = [];
  List<UserModel> _users = [];
  List<CartModel> _carts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  /// * [_fetchData] fetches products, users, and carts from the API and updates the state.
  Future<void> _fetchData() async {
    await fetchProducts().then((products) {
      setState(() {
        _products = products;
      });
    });

    await fetchUsers().then((users) {
      setState(() {
        _users = users;
      });
    });

    await fetchCarts().then((carts) {
      setState(() {
        _carts = carts;
      });
    });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Data'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildSectionTitle('Products'),
                  _buildProductList(),
                  _buildSectionTitle('Users'),
                  _buildUserList(),
                  _buildSectionTitle('Carts'),
                  _buildCartList(),
                ],
              ),
            ),
    );
  }

  /// * [_buildSectionTitle] creates a section title widget.
  /// * [title] is the title of the section.
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// * [_buildProductList] creates a list view of products.
  Widget _buildProductList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return ListTile(
          title: Text(product.title),
          subtitle:
              Text('Price: ${product.price} - Rating: ${product.rating.rate}'),
        );
      },
    );
  }

  /// * [_buildUserList] creates a list view of users.
  Widget _buildUserList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _users.length,
      itemBuilder: (context, index) {
        final user = _users[index];
        return ListTile(
          title: Text(user.name.firstname),
          subtitle: Text('Email: ${user.email}'),
        );
      },
    );
  }

  /// * [_buildCartList] creates a list view of carts.
  Widget _buildCartList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _carts.length,
      itemBuilder: (context, index) {
        final cart = _carts[index];
        return ListTile(
          title: Text('User ID: ${cart.userId}'),
          subtitle: Text('Products: ${cart.products}'),
        );
      },
    );
  }
}
