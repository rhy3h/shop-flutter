import 'package:flutter/material.dart';
import 'package:shop_flutter/components/product_card.dart';
import 'package:shop_flutter/models/product.dart';
import 'package:shop_flutter/screens/details/details_screen.dart';
import 'package:shop_flutter/size_config.dart';

import 'section_title.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Popular Product",
          press: () {},
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular) {
                    return ProductCard(
                      product: demoProducts[index],
                      press: () => Navigator.pushNamed(
                        context,
                        DetailsScreen.routeName,
                        arguments: ProductDetailsArguments(
                          product: demoProducts[index],
                        ),
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
              SizedBox(
                width: getProportionateScreenWidth(
                  20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
