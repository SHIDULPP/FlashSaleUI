import 'package:flash_sale_app/widgets/discount_selecter.dart';
import 'package:flash_sale_app/widgets/flashsaletimer.dart';
import 'package:flash_sale_app/widgets/navbar_widget.dart';
import 'package:flash_sale_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_services.dart';

class FlashSaleScreen extends StatefulWidget {
  const FlashSaleScreen({super.key});

  @override
  State<FlashSaleScreen> createState() => _FlashSaleScreenState();
}

class _FlashSaleScreenState extends State<FlashSaleScreen> {
  List<Product> _products = [];
  bool _isLoading = true;
   String _discountvalue="20%" ;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final products = await ApiService.fetchProducts();
      setState(() {
        _products = products;
        _isLoading = false;
      });
    } catch (e) {
      print("Failed to load products: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 180,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Flash Sale',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            const Text(
              'Choose Your Discount',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/appbar_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: FlashSaleTimer(),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Column(
            children: [
              DiscountSelector(
                onSelected: (discount) {
                  print('Selected $discount');
                  setState(() {
                    _discountvalue = discount;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 30, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$_discountvalue Discount",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.filter_list),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.7,
                          ),
                      itemBuilder: (context, index) {
                        return ProductCard(product: _products[index], discount: _discountvalue,);
                      },
                    ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: NavbarWidget(),
    );
  }
}
