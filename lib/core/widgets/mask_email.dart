String maskEmail(String email) {
  // Split the email into local part and domain
  List<String> parts = email.split('@');
  if (parts.length != 2) {
    return email; // Return the original email if it doesn't contain exactly one '@'
  }

  String localPart = parts[0];
  String domain = parts[1];

  // Mask the local part, leaving the first and last characters visible
  if (localPart.length <= 2) {
    // If the local part is too short, mask all characters except the first
    return '${localPart[0]}***@$domain';
  } else {
    // Mask the middle characters
    String maskedLocalPart = localPart[0] + '*' * (localPart.length - 2) + localPart[localPart.length - 1];
    return '$maskedLocalPart@$domain';
  }
}
