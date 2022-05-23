///abstract class that defines the interface for [PixabayRepo]
abstract class IFeelingsHistoryRepo {
  /// method to fetch Feeling History on a specific date [date] .
  Future getFeelingHistory(
    int userId,
    String date,
  ) async {}
}
