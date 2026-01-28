import SimpleDependency
import SwiftUI

struct SimpleDependencyView: View {
  let date: Date
  let uuid: UUID
  let locale: Locale
  
  init() {
    self.date = SimpleDateGenerator.current()
    self.uuid = SimpleUUIDGenerator.current()
    self.locale = SimpleLocaleGenerator.current()
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("SimpleDependency")
        .font(.title2)
        .bold()
      
      DateView(date: date)
      UUIDView(uuid: uuid)
      LocaleView(locale: locale)
    }
  }
}
