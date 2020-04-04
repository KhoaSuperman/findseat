extension HHmm on Duration {
  String formatHHmm() {
    //1:34:00.000000
    final str = this.toString();
    
    final texts = str.split(":");
    final textHour = texts[0].padLeft(2, '0');
    final textMinute = texts[1].padLeft(2, '0');

    return "${textHour}h ${textMinute}m";
  }
}
