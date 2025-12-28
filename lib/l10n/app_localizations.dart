import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @locale.
  ///
  /// In en, this message translates to:
  /// **'عربي'**
  String get locale;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @please_enter_phone.
  ///
  /// In en, this message translates to:
  /// **'Please enter phone number'**
  String get please_enter_phone;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @please_enter_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter password'**
  String get please_enter_password;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgot_password;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @dont_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Have an Account?'**
  String get dont_have_an_account;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Signup'**
  String get sign_up;

  /// No description provided for @already_an_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_an_account;

  /// No description provided for @please_enter_name.
  ///
  /// In en, this message translates to:
  /// **'Please enter name'**
  String get please_enter_name;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @please_enter_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter email'**
  String get please_enter_email;

  /// No description provided for @please_enter_valid_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid email'**
  String get please_enter_valid_email;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notification;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @wishlist.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishlist;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password;

  /// No description provided for @my_address.
  ///
  /// In en, this message translates to:
  /// **'My Address'**
  String get my_address;

  /// No description provided for @my_wishlist.
  ///
  /// In en, this message translates to:
  /// **'My Wishlist'**
  String get my_wishlist;

  /// No description provided for @my_orders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get my_orders;

  /// No description provided for @my_notification.
  ///
  /// In en, this message translates to:
  /// **'My Notification'**
  String get my_notification;

  /// No description provided for @my_account.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get my_account;

  /// No description provided for @see_all.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get see_all;

  /// No description provided for @recently_view.
  ///
  /// In en, this message translates to:
  /// **'Recently Viewed'**
  String get recently_view;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @my_cart.
  ///
  /// In en, this message translates to:
  /// **'My Cart'**
  String get my_cart;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @price_details.
  ///
  /// In en, this message translates to:
  /// **'Price Details'**
  String get price_details;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @delivery_charge.
  ///
  /// In en, this message translates to:
  /// **'Delivery Charges'**
  String get delivery_charge;

  /// No description provided for @total_amount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get total_amount;

  /// No description provided for @delivery_address.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address'**
  String get delivery_address;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @coupon_code.
  ///
  /// In en, this message translates to:
  /// **'Coupon Code'**
  String get coupon_code;

  /// No description provided for @please_enter_coupon_code.
  ///
  /// In en, this message translates to:
  /// **'Please enter coupon code'**
  String get please_enter_coupon_code;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @payment_option.
  ///
  /// In en, this message translates to:
  /// **'Payment Option'**
  String get payment_option;

  /// No description provided for @cash_on_delivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery'**
  String get cash_on_delivery;

  /// No description provided for @online_payment.
  ///
  /// In en, this message translates to:
  /// **'Online Payment'**
  String get online_payment;

  /// No description provided for @place_order.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get place_order;

  /// No description provided for @congratulation.
  ///
  /// In en, this message translates to:
  /// **'Congratulation!!!'**
  String get congratulation;

  /// No description provided for @order_success_message.
  ///
  /// In en, this message translates to:
  /// **'Deliver will be done within the estimated\ntime (it may vary based on location)'**
  String get order_success_message;

  /// No description provided for @continue_shopping.
  ///
  /// In en, this message translates to:
  /// **'Continue Shopping'**
  String get continue_shopping;

  /// No description provided for @high_to_low.
  ///
  /// In en, this message translates to:
  /// **'High to Low'**
  String get high_to_low;

  /// No description provided for @low_to_high.
  ///
  /// In en, this message translates to:
  /// **'Low to High'**
  String get low_to_high;

  /// No description provided for @new_arrival.
  ///
  /// In en, this message translates to:
  /// **'New Arrivals'**
  String get new_arrival;

  /// No description provided for @ascending_order.
  ///
  /// In en, this message translates to:
  /// **'Ascending Order'**
  String get ascending_order;

  /// No description provided for @descending_order.
  ///
  /// In en, this message translates to:
  /// **'Descending Order'**
  String get descending_order;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @no_item_found.
  ///
  /// In en, this message translates to:
  /// **'No Item Found'**
  String get no_item_found;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @order_details.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get order_details;

  /// No description provided for @shipping_address.
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get shipping_address;

  /// No description provided for @cancel_order.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get cancel_order;

  /// No description provided for @order_id.
  ///
  /// In en, this message translates to:
  /// **'Order Id'**
  String get order_id;

  /// No description provided for @order_status.
  ///
  /// In en, this message translates to:
  /// **'Order Status'**
  String get order_status;

  /// No description provided for @delivery_date.
  ///
  /// In en, this message translates to:
  /// **'Delivery Date'**
  String get delivery_date;

  /// No description provided for @delivery_location.
  ///
  /// In en, this message translates to:
  /// **'Delivery Location'**
  String get delivery_location;

  /// No description provided for @add_address.
  ///
  /// In en, this message translates to:
  /// **'+ Add New Address'**
  String get add_address;

  /// No description provided for @enter_address.
  ///
  /// In en, this message translates to:
  /// **'Please enter your address'**
  String get enter_address;

  /// No description provided for @enter_more_specific_address.
  ///
  /// In en, this message translates to:
  /// **'Please enter more specific address'**
  String get enter_more_specific_address;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @enter_street_name.
  ///
  /// In en, this message translates to:
  /// **'Please enter street name'**
  String get enter_street_name;

  /// No description provided for @enter_valid_street_name.
  ///
  /// In en, this message translates to:
  /// **'please enter valid street name'**
  String get enter_valid_street_name;

  /// No description provided for @street.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get street;

  /// No description provided for @invalid_phone.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number'**
  String get invalid_phone;

  /// No description provided for @address_add.
  ///
  /// In en, this message translates to:
  /// **'Add Address'**
  String get address_add;

  /// No description provided for @enter_old_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter old password'**
  String get enter_old_password;

  /// No description provided for @old_password.
  ///
  /// In en, this message translates to:
  /// **'Old password'**
  String get old_password;

  /// No description provided for @please_enter_new_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter new password'**
  String get please_enter_new_password;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get new_password;

  /// No description provided for @enter_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter confirm password'**
  String get enter_confirm_password;

  /// No description provided for @password_mismatch.
  ///
  /// In en, this message translates to:
  /// **'Password mismatch'**
  String get password_mismatch;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirm_password;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @agree_to_the_terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'Agree to the terms and conditions'**
  String get agree_to_the_terms_and_conditions;

  /// No description provided for @terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get terms_and_conditions;

  /// No description provided for @i_agree_to_the.
  ///
  /// In en, this message translates to:
  /// **'I agree to the'**
  String get i_agree_to_the;

  /// No description provided for @total_price.
  ///
  /// In en, this message translates to:
  /// **'Total Price'**
  String get total_price;

  /// No description provided for @add_to_bag.
  ///
  /// In en, this message translates to:
  /// **'Add to bag'**
  String get add_to_bag;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get are_you_sure;

  /// No description provided for @you_want_to_place_order.
  ///
  /// In en, this message translates to:
  /// **'You want to place order'**
  String get you_want_to_place_order;

  /// No description provided for @logout_message.
  ///
  /// In en, this message translates to:
  /// **'You want to logout'**
  String get logout_message;

  /// No description provided for @you_want_to_cancel_order.
  ///
  /// In en, this message translates to:
  /// **'You want to cancel this order'**
  String get you_want_to_cancel_order;

  /// No description provided for @return_order.
  ///
  /// In en, this message translates to:
  /// **'Return Order'**
  String get return_order;

  /// No description provided for @edit_address.
  ///
  /// In en, this message translates to:
  /// **'Edit Address'**
  String get edit_address;

  /// No description provided for @choose_product.
  ///
  /// In en, this message translates to:
  /// **'Choose Product'**
  String get choose_product;

  /// No description provided for @choose_product_to_return.
  ///
  /// In en, this message translates to:
  /// **'Choose a product to return'**
  String get choose_product_to_return;

  /// No description provided for @return_item.
  ///
  /// In en, this message translates to:
  /// **'Return Item'**
  String get return_item;

  /// No description provided for @already_returned.
  ///
  /// In en, this message translates to:
  /// **'This product already returned'**
  String get already_returned;

  /// No description provided for @no_order_found.
  ///
  /// In en, this message translates to:
  /// **'No Order Founds'**
  String get no_order_found;

  /// No description provided for @order_date.
  ///
  /// In en, this message translates to:
  /// **'Order Date'**
  String get order_date;

  /// No description provided for @goto_cart.
  ///
  /// In en, this message translates to:
  /// **'Go to Cart'**
  String get goto_cart;

  /// No description provided for @out_of_stock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get out_of_stock;

  /// No description provided for @select_variant.
  ///
  /// In en, this message translates to:
  /// **'Select Variant'**
  String get select_variant;

  /// No description provided for @choose_variant_product.
  ///
  /// In en, this message translates to:
  /// **'Choose any of the variant product'**
  String get choose_variant_product;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @search_for_medical_equipment.
  ///
  /// In en, this message translates to:
  /// **'Search for Fresh Fruites\nand Vegitables...'**
  String get search_for_medical_equipment;

  /// No description provided for @price_symbol.
  ///
  /// In en, this message translates to:
  /// **'\$'**
  String get price_symbol;

  /// No description provided for @qty.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get qty;

  /// No description provided for @show_profile.
  ///
  /// In en, this message translates to:
  /// **'Show Profile'**
  String get show_profile;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get change_password;

  /// No description provided for @search_category.
  ///
  /// In en, this message translates to:
  /// **'Search Categories'**
  String get search_category;

  /// No description provided for @add_new_address.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get add_new_address;

  /// No description provided for @order_placed_success.
  ///
  /// In en, this message translates to:
  /// **'Your Order Placed\nSuccessfully'**
  String get order_placed_success;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
