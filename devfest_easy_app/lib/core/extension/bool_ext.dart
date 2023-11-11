extension BoolExt on bool? {
  bool get ifNullTrue => this ?? true;

  bool get ifNullFalse => this ?? false;
}
