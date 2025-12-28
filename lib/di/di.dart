import 'package:savomart/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:savomart/domain/usecases/address_list_usecase.dart';
import 'package:savomart/domain/usecases/banner_usecase.dart';
import 'package:savomart/domain/usecases/cancel_order_usecase.dart';
import 'package:savomart/domain/usecases/categories_usecase.dart';
import 'package:savomart/domain/usecases/change_locale.dart';
import 'package:savomart/domain/usecases/change_password_usecase.dart';
import 'package:savomart/domain/usecases/delete_addrees_usecase.dart';
import 'package:savomart/domain/usecases/forgot_password_usecase.dart';
import 'package:savomart/domain/usecases/generate_otp_usecase.dart';
import 'package:savomart/domain/usecases/login_user_usecase.dart';
import 'package:savomart/domain/usecases/order_details_usecase.dart';
import 'package:savomart/domain/usecases/order_list_usecase.dart';
import 'package:savomart/domain/usecases/product_details_usecase.dart';
import 'package:savomart/domain/usecases/product_search_usecase.dart';
import 'package:savomart/domain/usecases/related_product_usecase.dart';
import 'package:savomart/domain/usecases/select_address_usecase.dart';
import 'package:savomart/domain/usecases/selected_address_usecase.dart';
import 'package:savomart/domain/usecases/terms_and_conditions_usecase.dart';
import 'package:savomart/domain/usecases/update_address_usecase.dart';
import 'package:savomart/domain/usecases/update_profile_usecase.dart';
import 'package:savomart/domain/usecases/upload_profile_picture_usecase.dart';
import 'package:savomart/domain/usecases/user_info_usecase.dart';
import 'package:savomart/domain/usecases/verify_otp_usecase.dart';
import 'package:savomart/domain/usecases/wish_list_usecase.dart';
import 'package:savomart/presentation/core/auth_wrapper/auth_controller.dart';
import 'package:savomart/presentation/core/navigation_screen/navigation_screen_controller.dart';
import 'package:savomart/presentation/screen/add_address/add_address_controller.dart';
import 'package:savomart/presentation/screen/change_password/change_password_controller.dart';
import 'package:savomart/presentation/screen/checkout_screen/checkout_screen_controller.dart';
import 'package:savomart/presentation/screen/cms_screen/cms_controller.dart';
import 'package:savomart/presentation/screen/filter_screen/filter_screen_controller.dart';
import 'package:savomart/presentation/screen/intro_screen/intro_screen_controller.dart';
import 'package:savomart/presentation/screen/login_screen/login_screen_controller.dart';
import 'package:savomart/presentation/screen/my_account/my_account_controller.dart';
import 'package:savomart/presentation/screen/my_address_screen/my_address_screen_controller.dart';
import 'package:savomart/presentation/screen/my_order_details/my_order_details_controller.dart';
import 'package:savomart/presentation/screen/my_orders_screen/my_order_controller.dart';
import 'package:savomart/presentation/screen/otp_verify/otp_verify_controller.dart';
import 'package:savomart/presentation/screen/product_details/product_details_controller.dart';
import 'package:savomart/presentation/screen/profile_screen/profile_screen_controller.dart';
import 'package:savomart/presentation/screen/register_screen/register_screen_controller.dart';
import 'package:savomart/presentation/screen/reset_password/reset_password_controller.dart';
import 'package:savomart/presentation/screen/return_order_item_screen/return_order_item_controller.dart';
import 'package:savomart/presentation/screen/test/test_product_details_controller.dart';
import 'package:savomart/presentation/screen/view_all_product/view_all_product_controller.dart';
import 'package:savomart/presentation/screen/view_image_screen/view_image_screen_controller.dart';
import 'package:savomart/presentation/screen/wishlist_screen/wishlist_screen_controller.dart';
import 'package:get/get.dart';
import 'package:savomart/data/core/api_client.dart';
import 'package:savomart/data/data_sources/auth_local_data_source.dart';
import 'package:savomart/data/data_sources/auth_remote_data_source.dart';
import 'package:savomart/data/data_sources/remote_data_source.dart';
import 'package:savomart/data/data_sources/user_preference_local_data_source.dart';
import 'package:savomart/data/repository/auth_repository_impl.dart';
import 'package:savomart/data/repository/data_repository_impl.dart';
import 'package:savomart/data/repository/user_preference_repository_imp.dart';
import 'package:savomart/domain/repository/auth_repository.dart';
import 'package:savomart/domain/repository/data_repository.dart';
import 'package:savomart/domain/repository/user_preference_repository.dart';
import 'package:savomart/presentation/screen/category_products/category_product_controller.dart';
import 'package:savomart/presentation/screen/category_screen/category_screen_controller.dart';
import 'package:savomart/presentation/screen/home_screen/home_screen_controller.dart';
import 'package:savomart/presentation/screen/search_screen/search_screen_controller.dart';
import 'package:savomart/presentation/screen/splash_screen/splash_screen_controller.dart';
import 'package:http/http.dart';
import '../domain/usecases/add_address_usecase.dart';
import '../domain/usecases/addtocart_usecase.dart';
import '../domain/usecases/cart_list_usecase.dart';
import '../domain/usecases/categories_product_usecase.dart';
import '../domain/usecases/order_return_usecase.dart';
import '../domain/usecases/place_order_usecase.dart';
import '../domain/usecases/product_with_category_id.dart';
import '../domain/usecases/register_user_usecase.dart';
import '../domain/usecases/remove_cart_item_usecase.dart';
import '../presentation/screen/cart_screen/cart_screen_controller.dart';

class DependencyInjection {
  static init() {
    Get.lazyPut(() => ApiClient(Client()), fenix: true);
    Get.lazyPut<AuthenticationLocalDataSource>(
        () => AuthenticationLocalDataSourceImpl(),
        fenix: true);
    Get.lazyPut<DataRepository>(() => DataRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(Get.find()),
        fenix: true);
    Get.lazyPut<AuthenticationRemoteDataSource>(
        () => AuthenticationRemoteDataSourceImpl(Get.find()),
        fenix: true);
    Get.lazyPut<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(Get.find(), Get.find()),
        fenix: true);
    Get.lazyPut<UserPreferencesRepository>(
        () => UserPreferenceRepositoryImpl(Get.find()),
        fenix: true);
    Get.lazyPut<UserPreferenceLocalDataSource>(
        () => UserPreferenceLocalDataSourceImpl(),
        fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => AddToWishListUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => SelectedAddressUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => WishListUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => OrderListUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => SelectAddressUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => OrderDetailsUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => RemoveCartItemUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => RegisterUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => PlaceOrderUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => NavigationScreenController(), fenix: true);
    Get.lazyPut(() => SplashScreenController(), fenix: true);
    Get.lazyPut(() => HomeScreenController(), fenix: true);
    Get.lazyPut(() => CategoryScreenController(), fenix: true);
    Get.lazyPut(() => CategoryPrductController(), fenix: true);
    Get.lazyPut(() => SearchScreenController(), fenix: true);
    Get.lazyPut(() => OtpVerifyController(), fenix: true);
    Get.lazyPut(() => RegisterScreenController(), fenix: true);
    Get.lazyPut(() => LoginScreenController(), fenix: true);
    Get.lazyPut(() => IntroScreenController(), fenix: true);
    Get.lazyPut(() => CartScreenController(), fenix: true);
    Get.lazyPut(() => ProfileScreenController(), fenix: true);
    Get.lazyPut(() => ViewAllProductController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    Get.lazyPut(() => WishlistScreenController(), fenix: true);
    Get.lazyPut(() => CheckoutScreenController(), fenix: true);
    Get.lazyPut(() => MyorderController(), fenix: true);
    Get.lazyPut(() => ViewImageScreenController(), fenix: true);
    Get.lazyPut(() => MyOrderDetailsController(), fenix: true);
    Get.lazyPut(() => MyaccountController(), fenix: true);
    Get.lazyPut(() => AddAddressController(), fenix: true);
    Get.lazyPut(() => FilterScreenController(), fenix: true);
    Get.lazyPut(() => MyAddressController(), fenix: true);
    Get.lazyPut(() => ProductDetailsController(), fenix: true);
    Get.lazyPut(() => CMSController(), fenix: true);
    Get.lazyPut(() => LoginUserUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => CartListUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => AddAddressUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => AddressListUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => CategoriesWithProductUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => ProductWithCategoryIdUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => ProductDetailsUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => ProductDetailsUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => CategoriesUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => BannerUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => CancelOrderUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => AddToCartUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => ChangeLocale(Get.find()), fenix: true);
    Get.lazyPut(() => ResetPasswordController(), fenix: true);
    Get.lazyPut(() => TestProductDetailsController(), fenix: true);
    Get.lazyPut(() => ReturnOrderItemController(), fenix: true);
    Get.lazyPut(() => OrderReturnUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => UpdateAddressUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => DeleteAddressUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => RelatedProductUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => UpdateProfileUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => ProductSearchUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => UploadProfilePictureUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => TermsAndConditionsUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => UserInfoUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => ChangePasswordUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => GenerateOTpUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => VerifyOTPUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => ForgotPasswordUsecase(Get.find()), fenix: true);
  }
}
