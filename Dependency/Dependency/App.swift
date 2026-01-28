import SwiftUI

@main
struct DependencyApp: App {
  var body: some Scene {
    WindowGroup {
      ScrollView {
        SimpleDependencyView()
        ContainerDependencyView()
      }
    }
  }
}
