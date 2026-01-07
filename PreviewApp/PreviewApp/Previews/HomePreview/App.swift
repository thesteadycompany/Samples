import ComposableArchitecture
import DatabaseClient
import HomeFeature
import SwiftUI

@main
struct HomePreviewApp: App {
  let store = Store(initialState: HomeFeature.State()) {
    HomeFeature()
  }
  
  var body: some Scene {
    WindowGroup {
      HomeView(store: store)
    }
  }
}

extension DatabaseClient: @retroactive DependencyKey {
  public static let liveValue = DatabaseClient(
    bootstrap: { print("Home bootstrap") },
    greeting: { print("Home greeting") }
  )
}
