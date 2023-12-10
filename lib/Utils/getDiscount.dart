getParcent(originalPrice, discountedPrice) {
  double discount = (originalPrice - discountedPrice) / originalPrice * 100;
  return discount.round();
}
