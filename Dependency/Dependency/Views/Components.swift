import SwiftUI

struct DateView: View {
  let date: Date
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text("Date")
        .font(.caption2)
        .foregroundStyle(.primary.secondary)
      
      Text(date.formatted())
        .font(.default)
        .foregroundStyle(.primary)
    }
  }
}

struct UUIDView: View {
  let uuid: UUID
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text("UUID")
        .font(.caption2)
        .foregroundStyle(.primary.secondary)
      
      Text(uuid.uuidString)
        .font(.default)
        .foregroundStyle(.primary)
    }
  }
}

struct LocaleView: View {
  let locale: Locale
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text("Locale")
        .font(.caption2)
        .foregroundStyle(.primary.secondary)
      
      Text(locale.identifier)
        .font(.default)
        .foregroundStyle(.primary)
    }
  }
}
