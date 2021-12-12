class Sanitized {
  static String viewPhoneSanitized({required String phone}) {
    final regexp = RegExp(r'\D');
    var phoneSanitized = '';
    var phoneInitials = phone
        .replaceAll(regexp, '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('-', '')
        .replaceAll(' ', '');

    if (phoneInitials.length == 10) {
      var formattedPhoneNumber = '(' +
          phoneInitials.substring(0, 2) +
          ') ' +
          phoneInitials.substring(2, 6) +
          '-' +
          phoneInitials.substring(6, phoneInitials.length);
      phoneSanitized = formattedPhoneNumber;
    }
    if (phoneInitials.length == 11) {
      var formattedPhoneNumber2 = '(' +
          phoneInitials.substring(0, 2) +
          ') ' +
          phoneInitials.substring(2, 7) +
          '-' +
          phoneInitials.substring(7, phoneInitials.length);
      phoneSanitized = formattedPhoneNumber2;
    }
    if (phoneInitials.length < 10 || phoneInitials.length > 11) {
      phoneSanitized = phoneInitials;
    }
    return phoneSanitized;
  }

  static String viewCpfSanitized({required String document}) {
    String? documentSanitized;
    var documentInitial =
        document.replaceAll('.', '').replaceAll('-', '').replaceAll(' ', '');

    if (documentInitial.length == 11) {
      var formattedDocument = documentInitial.substring(0, 3) +
          '.' +
          documentInitial.substring(3, 6) +
          '.' +
          documentInitial.substring(6, 9) +
          '-' +
          documentInitial.substring(9, 11);
      documentSanitized = formattedDocument;
    }
    if (documentInitial.length < 11 || documentInitial.length > 11) {
      documentSanitized = documentInitial;
    }
    return documentSanitized!;
  }

  static double viewDoubleValue({required String value}) {
    var valueSanitized = value
        .replaceAll('R', '')
        .replaceAll('\$', '')
        .replaceAll(' ', '')
        .replaceAll(',', '.');

    return double.tryParse(valueSanitized)!;
  }
}
