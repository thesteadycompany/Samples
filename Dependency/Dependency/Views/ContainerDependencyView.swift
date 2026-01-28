import ContainerDependency
import SwiftUI

struct ContainerDependencyView: View {
  @ContainerDependency(\.date) var date
  @ContainerDependency(\.uuid) var uuid
  @ContainerDependency(\.locale) var locale
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("ContainerDependency")
        .font(.title2)
        .bold()
      
      DateView(date: date())
      UUIDView(uuid: uuid())
      LocaleView(locale: locale())
    }
  }
}
