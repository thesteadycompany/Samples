import Dependencies

extension DatabaseClient: TestDependencyKey {
  public static let testValue = Self()
}
