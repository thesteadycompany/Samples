import ProtocolDependency
import SwiftUI

struct ProtocolDependencyView: View {
  @Dependency(\.date) var date
  @Dependency(\.uuid) var uuid
  @Dependency(\.locale) var locale
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("ProtocolDependency")
        .font(.title2)
        .bold()
      
      DateView(date: date())
      UUIDView(uuid: uuid())
      LocaleView(locale: locale)
    }
  }
}
