import SwiftUI


struct Collapsible<Content: View>: View {
    @State var label: () -> Text
    @State var content: () -> Content
    
    @State private var collapsed: Bool = true
    
    var body: some View {
        VStack {
            Button(
                action: { self.collapsed.toggle() },
                label: {
                    HStack {
                        self.label()
                        Spacer()
                        Text(self.collapsed ? "+" : "-")
                    }
                    .padding(.bottom, 1)
                    .background(Color.white.opacity(0.01))
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                self.content()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            //.animation(.easeOut)
            .transition(.slide)
        }
    }
}

struct DestinationView: View {
    @State private var collapsed: Bool = true
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Traveling")
                    .bold()
                Spacer()
              }
              .padding(.bottom)
              
              Divider()
                  .padding(.bottom)
              
            Collapsible(
            label: { Text("Travel documents") },
            content: {
                    Collapsible(
                        label: { Text("What documents do I need if I want to travel to another EU Member State?") },
                        content: {
                            HStack {
                                Text("cdc")
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                        }
                    )
                    .background(Color.secondary)
            }
            )
              .frame(maxWidth: .infinity)
              Spacer()
            
            Divider()
                .padding(.bottom)
            
          Collapsible(
          label: { Text("Travel documents") },
          content: {
                  Collapsible(
                      label: { Text("What documents do I need if I want to travel to another EU Member State?") },
                      content: {
                          HStack {
                              Text("cdc")
                              Spacer()
                          }
                          .frame(maxWidth: .infinity)
                          .padding()
                          .background(Color.white)
                      }
                  )
                  .background(Color.secondary)
                  
              }
          )
            .frame(maxWidth: .infinity)
            Spacer()
            
          }
          .padding()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
  }


struct Previews_DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        ///*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
        DestinationView()
    }
}


