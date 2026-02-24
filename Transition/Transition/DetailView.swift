import SwiftUI

struct DetailView: View {
  let color: Color
  
  var body: some View {
    VStack {
      Spacer()
      
      Text("Hello, \(color.description)")
        .frame(maxWidth: .infinity)
      
      Spacer()
    }
    .background(color)
  }
}
