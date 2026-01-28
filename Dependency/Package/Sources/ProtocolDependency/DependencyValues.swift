import Foundation

public struct DateGeneratorKey: DependencyKey {
  public static let defaultValue: @Sendable () -> Date = { Date() }
}

extension DependencyValues {
  public var date: @Sendable () -> Date {
    get { self[DateGeneratorKey.self] }
    set { self[DateGeneratorKey.self] = newValue }
  }
}

public struct UUIDGeneratorKey: DependencyKey {
  public static let defaultValue: @Sendable () -> UUID = { UUID() }
}

extension DependencyValues {
  public var uuid: @Sendable () -> UUID {
    get { self[UUIDGeneratorKey.self] }
    set { self[UUIDGeneratorKey.self] = newValue }
  }
}

public struct LocaleKey: DependencyKey {
  public static let defaultValue: Locale = .current
}

extension DependencyValues {
  public var locale: Locale {
    get { self[LocaleKey.self] }
    set { self[LocaleKey.self] = newValue }
  }
}
