
class SelectedValue {
  String name;
  String quantity;

  SelectedValue(this.name, this.quantity);

  Map toJson() => {
        'name': name,
        'quantity': quantity,
      };
}