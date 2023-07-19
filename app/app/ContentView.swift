//
//  ContentView.swift
//  app
//
//  Created by Mariana Raykova on 6.07.23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            //NavigationLink(destination: DestinationView()) {
            //       Image("img2")
            //         .padding()
            //}
            //.navigationTitle("Home")
            //.navigationBarBackButtonHidden(true)
            ZStack{
                Color.black.ignoresSafeArea()
                VStack{
                    Menu() {
                        Button("Cancel", role: .destructive){
                            
                        }
                    } label: {
                        Label(" ", systemImage: "list.bullet.circle")
                    }
                    .frame(width: 400, height: 20, alignment: .trailing)
                    Form{
                        TextField("email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .padding()
                            .frame(width: 300, height: 50)
                            .cornerRadius(10)
                        Button("submit") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                    }
                    HStack{
                        NavigationLink(destination: DestinationView()){
                            Image("img1")
                        }
                        .frame(width: 191, height: 130)
                        .foregroundColor(.white)
                        
                        NavigationLink(destination: DestinationView1()){
                            Image("img2")
                        }
                        .frame(width: 191, height: 130)
                        .foregroundColor(.white)
                    }
                    HStack{
                        NavigationLink(destination: DestinationView2()){
                            Image("img3")
                        }
                        .frame(width: 191, height: 130)
                        .foregroundColor(.white)
                        NavigationLink(destination: DestinationView3()){
                            Image("img4")
                        }
                        .frame(width: 191, height: 130)
                        .foregroundColor(.white)
                    }
                    HStack{
                        NavigationLink(destination: DestinationView4()){
                            Image("img5")
                        }
                        .frame(width: 191, height: 130)
                        .foregroundColor(.white)
                        NavigationLink(destination: DestinationView5()){
                            Image("img6")
                        }
                        .frame(width: 191, height: 130)
                        .foregroundColor(.white)
                    }
                    //.frame(width: 400, height: 300)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
