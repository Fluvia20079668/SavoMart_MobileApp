import 'package:savomart/presentation/core/navigation_screen/navigation_screen.dart';
import 'package:savomart/presentation/screen/add_address/add_address_screen.dart';
import 'package:savomart/presentation/screen/change_password/change_password.dart';
import 'package:savomart/presentation/screen/checkout_screen/checkout_screen.dart';
import 'package:savomart/presentation/screen/cms_screen/cms_screen.dart';
import 'package:savomart/presentation/screen/filter_screen/filter_screen.dart';
import 'package:savomart/presentation/screen/intro_screen/intro_screen.dart';
import 'package:savomart/presentation/screen/my_account/my_account.dart';
import 'package:savomart/presentation/screen/my_address_screen/my_address_screen.dart';
import 'package:savomart/presentation/screen/my_order_details/my_order_details.dart';
import 'package:savomart/presentation/screen/my_orders_screen/my_orders_screen.dart';
import 'package:savomart/presentation/screen/notification_screen/notification_screen.dart';
import 'package:savomart/presentation/screen/order_success_screen/order_success_screen.dart';
import 'package:savomart/presentation/screen/otp_verify/otp_verify_screen.dart';
import 'package:savomart/presentation/screen/register_screen/register_screen.dart';
import 'package:savomart/presentation/screen/reset_password/reset_password.dart';
import 'package:savomart/presentation/screen/return_order_item_screen/return_order_item_screen.dart';
import 'package:savomart/presentation/screen/view_all_product/view_all_product_screen.dart';
import 'package:savomart/presentation/screen/view_image_screen/view_image_screen.dart';
import 'package:savomart/presentation/screen/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savomart/presentation/core/auth_wrapper/auth_wrapper.dart';
import 'package:savomart/presentation/route/route_constants.dart';
import 'package:savomart/presentation/screen/cart_screen/cart_screen.dart';
import 'package:savomart/presentation/screen/category_products/category_products.dart';
import 'package:savomart/presentation/screen/category_screen/category_screen.dart';
import 'package:savomart/presentation/screen/home_screen/home_screen.dart';
import 'package:savomart/presentation/screen/login_screen/login_screen.dart';
import 'package:savomart/presentation/screen/product_details/product_details.dart';
import 'package:savomart/presentation/screen/profile_screen/profile_screen.dart';
import 'package:savomart/presentation/screen/search_screen/search_screen.dart';
import 'package:savomart/presentation/screen/splash_screen/splash_screen.dart';

class Routes {
  static Map<String, Widget> routes() => {
        RouteList.initial: const AuthWrapper(),
        RouteList.authWrapper: const AuthWrapper(),
        RouteList.splash: const SplashScreen(),
        RouteList.loginScreen: const LoginScreen(),
        RouteList.homeScreen: const HomeScreen(),
        RouteList.categoryScreen: const CategoryScreen(),
        RouteList.cartScreen: const CartScreen(),
        RouteList.productDetails: const ProductDetails(),
        RouteList.categoryProduct: const CategoryProducts(),
        RouteList.searchScreen: const SearchScreen(),
        RouteList.profileScreen: const ProfileScreen(),
        RouteList.otpVerify: const OtpVerifyScreen(),
        RouteList.myOrdersScreen: const MyOrdersScreen(),
        RouteList.orderSuccess: const OrderSuccessScreen(),
        RouteList.introScreen: const IntroScreen(),
        RouteList.registerScreen: const RegisterScreen(),
        RouteList.viewAllProductScreen: const ViewAllProductScreen(),
        RouteList.changePassword: const ChangePassword(),
        RouteList.notificationScreen: const NotificationScreen(),
        RouteList.wishlistScreen: const WishlistScreen(),
        RouteList.checkoutScreen: const CheckoutScreen(),
        RouteList.myOrderDetails: const MyOrderDetails(),
        RouteList.myAccountScreen: const MyAccountScreen(),
        RouteList.addAddressScreen: const AddAddressScreen(),
        RouteList.fiterScreen: const FilterScreen(),
        RouteList.myAddress: const MyAddressScreen(),
        RouteList.restPassword: const ResetPassword(),
        RouteList.navigationScreen: const NavigationScreen(),
        RouteList.returnOrderItem: const ReturnOrderItemScreen(),
        RouteList.viewImageScreen: const ViewImageScreen(),
        RouteList.cmsScreen: const CMSScreen(),
        // RouteList.register: const RegisterScreen(),
        // RouteList.login: const LoginScreen(),
        // RouteList.registrationSuccessScreen: const RegistrationSuccessScreen(),
        // RouteList.splashScreen:  const SplashScreen(),
        // RouteList.temporaryUnAvailable:  const TemporaryUnAvailable(),
        // RouteList.webView:
        //     const DefaultWebView(),
      };

  static List<GetPage> getPages() {
    List<GetPage> pages = [];
    routes().forEach((key, value) {
      pages.add(GetPage(name: key, page: () => value));
    });
    return pages;
  }
}
