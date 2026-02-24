import SwiftUI

struct RootView: View {
  private enum TransitionID: Hashable {
    case red
    case blue
  }
  
  @Namespace var namespace
  @State var isRedPresented = false
  @State var isBluePresented = false
  
  var body: some View {
    NavigationStack {
      VStack {
        HStack {
          Button {
            isRedPresented = true
          } label: {
            Circle()
              .fill(.red)
              .frame(width: 30, height: 30)
          }
          .matchedTransitionSource(id: TransitionID.red, in: namespace)
          
          Spacer()
          
          Button {
            isBluePresented = true
          } label: {
            Circle()
              .fill(.blue)
              .frame(width: 30, height: 30)
          }
          .background {
            Circle()
              .fill(.blue)
              .matchedTransitionSource(id: TransitionID.blue, in: namespace)
          }
        }
        
        Spacer()
      }
      .navigationDestination(isPresented: $isRedPresented) {
        DetailView(color: .red)
          .navigationTransition(.zoom(sourceID: TransitionID.red, in: namespace))
      }
      .navigationDestination(isPresented: $isBluePresented) {
        DetailView(color: .blue)
          .navigationTransition(.zoom(sourceID: TransitionID.blue, in: namespace))
      }
    }
  }
}
