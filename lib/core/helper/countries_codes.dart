const countryToPhoneCode = {
  "EG": "+20", // Egypt
  "SA": "+966", // Saudi Arabia
};

String countryCodeToEmoji(String countryCode) {
  const int base = 0x1F1E6;
  return countryCode
      .toUpperCase()
      .codeUnits
      .map((c) => String.fromCharCode(base + c - 65))
      .join();
}
