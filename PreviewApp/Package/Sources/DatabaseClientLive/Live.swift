@_exported import DatabaseClient
import Dependencies
import SQLiteData

extension DatabaseClient: DependencyKey {
  public static let liveValue = DatabaseClient(
    bootstrap: { print("SQLiteData bootstrap") },
    greeting: { print("SQLiteData greeting") }
  )
}
