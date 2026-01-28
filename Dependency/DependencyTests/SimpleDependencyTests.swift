@testable import Dependency
import SimpleDependency
import SwiftUI
import Testing

struct SimpleDependencyTests {
  @Test @MainActor func testDate() async throws {
    let now = Date(timeIntervalSince1970: 0)
    SimpleDateGenerator.$current.withValue({ now }) {
      let view = SimpleDependencyView()
      #expect(view.date == now)
    }
  }
  
  @Test @MainActor func testUUID() async throws {
    let uuid = UUID()
    SimpleUUIDGenerator.$current.withValue({ uuid }) {
      let view = SimpleDependencyView()
      #expect(view.uuid == uuid)
    }
  }
  
  @Test @MainActor func testLocale() async throws {
    let locale = Locale(identifier: "en_GB")
    SimpleLocaleGenerator.$current.withValue({ locale }) {
      let view = SimpleDependencyView()
      #expect(view.locale == locale)
    }
  }
}
