String extractRefreshToken(String input) {
  final regex = RegExp(r'refreshToken=([^]+); expires=');
  final match = regex.firstMatch(input);

  if (match != null) {
    return match.group(1)!; // Return the extracted token
  }

  return ''; // Return an empty string if not found
}

void navigateToLogin() {
  // PageRoutes.router.goNamed(PagesKeys.loginPage);
}
