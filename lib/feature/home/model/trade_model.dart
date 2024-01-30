class TradeModel {
  double? currentPrice;
  String? comment;
  int? digits;
  int? login;
  double? openPrice;
  String? openTime;
  double? profit;
  double? sl;
  double? swaps;
  String? symbol;
  double? tp;
  int? ticket;
  int? type;
  double? volume;

  TradeModel(
      {this.currentPrice,
        this.comment,
        this.digits,
        this.login,
        this.openPrice,
        this.openTime,
        this.profit,
        this.sl,
        this.swaps,
        this.symbol,
        this.tp,
        this.ticket,
        this.type,
        this.volume});

  TradeModel.fromJson(Map<String, dynamic> json) {
    currentPrice = json['currentPrice'];
    comment = json['comment'];
    digits = json['digits'];
    login = json['login'];
    openPrice = json['openPrice'];
    openTime = json['openTime'];
    profit = json['profit'];
    sl = json['sl'].toDouble();
    swaps = json['swaps'].toDouble();
    symbol = json['symbol'];
    tp = json['tp'].toDouble();
    ticket = json['ticket'];
    type = json['type'];
    volume = json['volume'];
  }

}
