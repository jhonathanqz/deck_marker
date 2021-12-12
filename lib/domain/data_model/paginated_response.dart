class PaginatedResponse<T> {
  final int page;
  final int pages;
  final int records;
  final T data;

  PaginatedResponse({
    required this.page,
    required this.pages,
    required this.records,
    required this.data,
  });
}
