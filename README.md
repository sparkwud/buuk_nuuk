# buuk_nuuk

BuukNuuk is a Flutter application that leverages the Google Books API to help users search for and discover books. Whether you're looking for a specific title, author, or just browsing for new reads, BuukNuuk makes it easy and convenient to find and explore books from the vast Google Books database.

## 🌟 Features

- **Home Page Carousel:** Display featured books in a stunning carousel slider.
- **Responsive Design:** Adaptable UI using `flutter_screenutil` for different screen sizes and orientations.
- **Navigation:** Smooth navigation between pages using `go_router`.
- **Search Functionality:** Search for books using keywords.
- **Book Details Page:** Detailed information about each book, including a description and author info.
- **Favorites:** Save favorite books using `shared_preferences`.
- **Custom Fonts:** Enhance readability with beautiful typography powered by `google_fonts`.
- **SVG Support:** Include scalable vector graphics in the UI using `flutter_svg`.
- **Network Calls:** Fetch data from the internet using the `http` package.
- **Launch External URLs:** Open external links directly from the app using `url_launcher`.
  
## 🛠️ Technologies and Dependencies

The app leverages several powerful Flutter packages to deliver a seamless and intuitive user experience:

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [carousel_slider: ^4.2.1](https://pub.dev/packages/carousel_slider): To create an eye-catching carousel for featured books.
- [flutter_riverpod: ^2.5.1](https://pub.dev/packages/flutter_riverpod): State management using Riverpod for handling the app state efficiently.
- [http: ^1.2.1](https://pub.dev/packages/http): Handles HTTP requests to fetch book data from online APIs.
- [shared_preferences: ^2.2.3](https://pub.dev/packages/shared_preferences): Persists user preferences locally for features like saving favorites.
- [CachedNetworkImage](https://pub.dev/packages/cached_network_image) for image caching
- [url_launcher: ^6.3.0](https://pub.dev/packages/url_launcher): Opens external URLs from within the app.
- [flutter_screenutil: ^5.9.1](https://pub.dev/packages/flutter_screenutil): Makes the app responsive by adapting to different screen sizes and pixel densities.
- [flutter_svg: ^2.0.10+1](https://pub.dev/packages/flutter_svg): Renders SVG images for crisp and scalable graphics.
- [gap: ^3.0.1](https://pub.dev/packages/gap): Adds customizable spacing between widgets.
- [go_router: ^14.1.3](https://pub.dev/packages/go_router): Manages routing and navigation in the app.
- [google_fonts: ^6.2.1](https://pub.dev/packages/google_fonts): Provides access to a wide variety of Google Fonts for custom typography.



## 🚀 Getting Started

### Prerequisites

- **Flutter SDK**: Make sure you have the latest version of the Flutter SDK installed.
- **Dart**: A compatible version of Dart that works with the Flutter SDK.
- **Android/iOS Device or Emulator**: To run and test the app.

### Installation
- Clone the repository
- Install dependencies:  `flutter pub get`
- Run the app:  `flutter run`
