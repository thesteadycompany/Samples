import ComposableArchitecture
import FeatureKit
import HomeFeature
import SwiftUI

public struct AppView: View {
  public let store: StoreOf<AppFeature>
  
  public init(store: StoreOf<AppFeature>) {
    self.store = store
  }
  
  public var body: some View {
    VStack {
      HomeView(store: store.scope(state: \.home, action: \.home))
    }
    .task {
      store.send(.task)
    }
  }
}
