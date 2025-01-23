# onrapp test

[![Flutter Version](https://img.shields.io/badge/Flutter-3.27.1-blue?logo=flutter)](https://flutter.dev)
[![License](https://img.shields.io/github/license/cristiancamilo070/onrapp_test)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20|%20iOS%20|%20Web-orange)](https://flutter.dev)
[![Last Commit](https://img.shields.io/github/last-commit/cristiancamilo070/onrapp_test)](https://github.com/cristiancamilo070/onrapp_test/commits/main)
[![Issues](https://img.shields.io/github/issues/cristiancamilo070/onrapp_test)](https://github.com/cristiancamilo070/onrapp_test/issues)
[![Stars](https://img.shields.io/github/stars/cristiancamilo070/onrapp_test?style=social)](https://github.com/cristiancamilo070/onrapp_test)

## Running the Flutter Project Locally

To run this Flutter project locally, follow these steps:

- Make sure you have Flutter and Dart installed on your machine.
- Clone the GitHub repository to your local machine using the following command:

```bash
git clone https://github.com/cristiancamilo070/onrapp_test.git
```

- then run

```bash
flutter pub get
```

```bash
flutter run
```

# Frontend Overview

<div style="display: flex; flex-wrap: wrap; justify-content: space-between;">
  <img src="assets/screenshots/0.jpg" alt="Screenshot 1" width="180" height="350">
  <img src="assets/screenshots/1.jpg" alt="Screenshot 2" width="180" height="350">
  <img src="assets/screenshots/2.jpg" alt="Screenshot 3" width="180" height="350">
</div>
<div style="display: flex; flex-wrap: wrap; justify-content: space-between;">
  <img src="assets/screenshots/3.jpg" alt="Screenshot 4" width="180" height="350">
  <img src="assets/screenshots/4.jpg" alt="Screenshot 5" width="180" height="350">
  <img src="assets/screenshots/5.jpg" alt="Screenshot 6" width="180" height="350">

## Clean Architecture and Code

This Flutter frontend follows the principles of Clean Architecture and Clean Code, providing a structured and maintainable codebase.

---

## Overview

This Flutter project demonstrates a simple application with a clean architecture approach. The app includes the following functionalities:

1. **Login Screen**:

   - Email and password input fields with validation.
   - Simulation of an authentication process with a loading indicator.
   - Navigation to the product list upon successful login.

2. **Product List Screen**:

   - Fetches and displays products from [FakeStore API](https://fakestoreapi.com/products).
   - Displays product details such as:
     - Title.
     - Short description (limited to 2 lines).
     - Price in USD.
   - Allows navigation to a detailed view of each product by tapping on the product card.

3. **Product Detail Screen**:
   - Fetches and displays detailed information for a selected product using [FakeStore API](https://fakestoreapi.com/products/:id).
   - Displays:
     - Product image.
     - Title.
     - Full description.
     - Price.
     - Category.
     - Rating (with stars and number of reviews).
   - Includes a back button for navigation to the product list.
