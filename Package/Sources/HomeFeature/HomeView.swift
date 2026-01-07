import ComposableArchitecture
import FeatureKit
import SwiftUI

public struct HomeView: View {
  public let store: StoreOf<HomeFeature>
  
  public init(store: StoreOf<HomeFeature>) {
    self.store = store
  }
  
  public var body: some View {
    VStack {
      Text("Hello Home")
        .frame(maxWidth: .infinity)
      
      Spacer()
    }
    .task {
      store.send(.task)
    }
  }
}
