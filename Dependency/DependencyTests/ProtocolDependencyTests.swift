@testable import Dependency
import ProtocolDependency
import SwiftUI
import Testing

struct ProtocolDependencyTests {
  @Test @MainActor func testDate() async throws {
    let now = Date(timeIntervalSince1970: 0)
    await withDependencies {
      $0.date = { now }
    } operation: {
      let view = ProtocolDependencyView()
      #expect(view.date() == now)
    }
  }
  
  @Test @MainActor func testUUID() async throws {
    let uuid = UUID()
    await withDependencies {
      $0.uuid = { uuid }
    } operation: {
      let view = ProtocolDependencyView()
      #expect(view.uuid() == uuid)
    }
  }
  
  @Test @MainActor func testLocale() async throws {
    let locale = Locale(identifier: "en_GB")
    await withDependencies {
      $0.locale = locale
    } operation: {
      let view = ProtocolDependencyView()
      #expect(view.locale == locale)
    }
  }
}
