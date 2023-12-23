extension IterableExtensions<E> on Iterable<E> {
  Map<K, V> toMap<K, V>({required K Function(E el) keys, required V Function(E el) values}) =>
      { for (var el in this) keys(el) : values(el) };
}