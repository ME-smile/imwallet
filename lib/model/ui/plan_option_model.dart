class PlanOptionModel {
  String? title;
  String? description;
  String? value;
  String? unit;
  bool hasTrailing;
  Function()? onTap;
  PlanOptionModel({
    required this.title,
    required this.description,
    this.value,
    this.unit,
    this.hasTrailing = false,
    this.onTap,
  });
}
