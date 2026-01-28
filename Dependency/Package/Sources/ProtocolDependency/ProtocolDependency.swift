import Foundation

public protocol DependencyKey {
  associatedtype Value: Sendable
  static var defaultValue: Value { get }
}

public struct DependencyValues: Sendable {
  @TaskLocal public static var current = DependencyValues()
  
  private var storage: [ObjectIdentifier: any Sendable] = [:]
  
  public subscript<Key: DependencyKey>(key: Key.Type) -> Key.Value {
    get {
      guard let value = storage[ObjectIdentifier(key)] as? Key.Value else {
        return Key.defaultValue
      }
      return value
    }
    set {
      storage[ObjectIdentifier(key)] = newValue
    }
  }
}

@propertyWrapper
public struct Dependency<Value> {
  private let keyPath: KeyPath<DependencyValues, Value>
  
  public init(_ keyPath: KeyPath<DependencyValues, Value>) {
    self.keyPath = keyPath
  }
  
  public var wrappedValue: Value {
    DependencyValues.current[keyPath: keyPath]
  }
}
