import Foundation

public func withDependencies<T>(
  _ configure: (inout ContainerDependencyContainer) -> Void,
  operation: () async throws -> T
) async rethrows -> T {
  var deps = ContainerDependencyContainer()
  configure(&deps)
  return try await ContainerDependencyValues.$current.withValue(deps, operation: operation)
}
