import Foundation

public enum ContainerDependencyValues {
  @TaskLocal public static var current = ContainerDependencyContainer()
}

public struct ContainerDependencyContainer: Sendable {
  public var date: @Sendable () -> Date
  public var uuid: @Sendable () -> UUID
  public var locale: @Sendable () -> Locale
  
  public init(
    date: @Sendable @escaping () -> Date = { Date() },
    uuid: @Sendable @escaping () -> UUID = { UUID() },
    locale: @Sendable @escaping () -> Locale = { Locale.current }
  ) {
    self.date = date
    self.uuid = uuid
    self.locale = locale
  }
}

@propertyWrapper
public struct ContainerDependency<Value> {
  private let keyPath: KeyPath<ContainerDependencyContainer, Value>
  
  public var wrappedValue: Value {
    ContainerDependencyValues.current[keyPath: keyPath]
  }
  public init(_ keyPath: KeyPath<ContainerDependencyContainer, Value>) {
    self.keyPath = keyPath
  }
}
