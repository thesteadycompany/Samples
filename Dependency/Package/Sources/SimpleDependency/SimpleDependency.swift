import Foundation

public enum SimpleDateGenerator {
  @TaskLocal public static var current: @Sendable () -> Date = { Date() }
}

public enum SimpleUUIDGenerator {
  @TaskLocal public static var current: @Sendable () -> UUID = { UUID() }
}

public enum SimpleLocaleGenerator {
  @TaskLocal public static var current: @Sendable () -> Locale = { .current }
}
