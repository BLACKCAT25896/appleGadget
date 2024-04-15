import 'package:bikrify/feature/home/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController implements GetxService {
  ProductController();

  final List<Product> _productList = [
    Product(id:1, name:'Toyota Fielder G-PUSH START 3.5 89K 2019',description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        image: "https://i.bikroy-st.com/toyota-allion-g-octane-used-car-2013-for-sale-dhaka/4d3845c0-8533-404a-9410-f1a1e1ff23ea/160/120/cropped.webp",price: 100, quantity: 1,ratting: 4.5, reviewCount: 212),
    Product(id:2, name:'AsusX507U (laptop for sell)',description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        image: "https://i.bikroy-st.com/asusx507u-laptop-for-sell-for-sale-rajshahi-division/acbb1c33-3820-4e5b-bc61-015888b73eb0/160/120/cropped.webp", price: 150, quantity: 10,ratting: 4.1, reviewCount: 434),
    Product(id:3, name:'Very Exclusive Beautiful Project',description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        image: "https://i.bikroy-st.com/ready-flat-at-mirpur-near-metro-for-sale-dhaka/efba3782-43ca-49a6-8488-03b2962cd743/142/107/cropped.webp", price: 120, quantity: 90,ratting: 4.3, reviewCount: 23),
    Product(id:4, name:'ALMIRA 3 PALLA MALAYSIAN MDF. M # 278',description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        image: "https://i.bikroy-st.com/almira-3-palla-malaysian-mdf-m-278-for-sale-dhaka/1d8f92f2-cca3-4d08-b067-ee8418a9f97d/142/107/cropped.webp", price: 190, quantity: 18,ratting: 4.2, reviewCount: 354),
    Product(id:5, name:'Spiral  Binding',description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        image: "https://i.bikroy-st.com/spiral-baainddin-meshin-for-sale-dhaka/ecb38c17-795d-40c1-bc0f-74eeabcb4557/142/107/cropped.webp", price: 160, quantity: 16,ratting: 4.6, reviewCount: 234),
    Product(id:6, name:'Mobile charger usb cable making vartical injection machine',description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        image: "https://i.bikroy-st.com/mobile-charger-usb-cable-making-vartical-injection-machine-for-sale-dhaka/3708413c-cd51-438d-90fe-cb991d1e2d21/142/107/cropped.webp", price: 110, quantity: 14,ratting: 4.7, reviewCount: 465),

  ];
  List<Product> get productList => _productList;
  int _quantity = 0;
  int get quantity => _quantity;




  void setQuantity(int value) {
    _quantity = value;
    update();
  }

  int imageSliderIndex = 0;
  void setImageSliderSelectedIndex(int selectedIndex) {
    imageSliderIndex = selectedIndex;
    update();
  }
}
