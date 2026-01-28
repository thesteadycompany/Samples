@testable import Dependency
import ContainerDependency
import SwiftUI
import Testing

struct ContainerDependencyTests {
  @Test @MainActor func testDate() async throws {
    let now = Date(timeIntervalSince1970: 0)
    await withDependencies {
      $0.date = { now }
    } operation: {
      let view = ContainerDependencyView()
      #expect(view.date() == now)
    }
  }
  
  @Test @MainActor func testUUID() async throws {
    let uuid = UUID()
    await withDependencies {
      $0.uuid = { uuid }
    } operation: {
      let view = ContainerDependencyView()
      #expect(view.uuid() == uuid)
    }
  }
  
  @Test @MainActor func testLocale() async throws {
    let locale = Locale(identifier: "en_GB")
    await withDependencies {
      $0.locale = { locale }
    } operation: {
      let view = ContainerDependencyView()
      #expect(view.locale() == locale)
    }
  }
}
