import ComposableArchitecture
import DatabaseClient
import FeatureKit
import HomeFeature
import SwiftUI

@Reducer
public struct AppFeature {
  public struct State: Equatable {
    var home: HomeFeature.State = .init()
    
    public init() {}
  }
  
  public enum Action {
    case home(HomeFeature.Action)
    case task
  }
  
  public init() {}
  
  public var body: some ReducerOf<Self> {
    Scope(state: \.home, action: \.home) {
      HomeFeature()
    }
    Reduce { state, action in
      switch action {
      case .home:
        return .none
        
      case .task:
        return .run { send in
          @Dependency(DatabaseClient.self) var client
          try await client.bootstrap()
        } catch: { error, send in
          print(error.localizedDescription)
        }
      }
    }
  }
}
