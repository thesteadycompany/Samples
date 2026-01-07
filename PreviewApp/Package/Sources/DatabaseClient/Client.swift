import DependenciesMacros

@DependencyClient
public struct DatabaseClient: Sendable {
  public var bootstrap: @Sendable () async throws -> Void
  public var greeting: @Sendable () async throws -> Void
}
