class PaymentTable {
  final String year;
  final String name;
  final double jan;
  final double fev;
  final double mar;
  final double abr;
  final double mai;
  final double jun;
  final double jul;
  final double ago;
  final double set;
  final double out;
  final double nov;
  final double dez;
  final double total;

  PaymentTable({
      this.year,
      this.name,
      this.jan,
      this.fev,
      this.mar,
      this.abr,
      this.mai,
      this.jun,
      this.jul,
      this.ago,
      this.set,
      this.out,
      this.nov,
      this.dez,
      this.total});

  PaymentTable.fromJson(Map<String, dynamic> json)
      : year = json['year'],
        name = json['name'],
        jan = json['jan'],
        fev = json['fev'],
        mar = json['mar'],
        abr = json['abr'],
        mai = json['mai'],
        jun = json['jun'],
        jul = json['jul'],
        ago = json['ago'],
        set = json['set'],
        out = json['out'],
        nov = json['nov'],
        dez = json['dez'],
        total = json['total'];

  Map<String, dynamic> toJson() => {
        'year': year,
        'name': name,
        'jan': jan,
        'fev': fev,
        'mar': mar,
        'abr': abr,
        'mai': mai,
        'jun': jun,
        'jul': jul,
        'ago': ago,
        'set': set,
        'out': out,
        'nov': nov,
        'dez': dez,
        'total': total,
      };

  @override
  String toString() {
    return 'PaymentTable{year: $year, name: $name, '
        'jan: $jan, fev: $fev, mar: $mar, abr: $abr, mai: $mai, jun: $jun,'
        'jul: $jul, ago: $ago, set: $set, out: $out. nov: $nov, dez: $dez}';
  }
}
