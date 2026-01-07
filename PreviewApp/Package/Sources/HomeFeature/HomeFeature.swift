import ComposableArchitecture
import DatabaseClient
import FeatureKit
import SwiftUI

@Reducer
public struct HomeFeature {
  public struct State: Equatable {
    public init() {}
  }
  
  public enum Action {
    case task
  }
  
  public init() {}
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .task:
        return .run { _ in
          @Dependency(DatabaseClient.self) var client
          try await client.greeting()
        } catch: { error, send in
          print(error.localizedDescription)
        }
      }
    }
  }
}
