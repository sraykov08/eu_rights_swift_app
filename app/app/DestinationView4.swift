//
//  DestinationView4.swift
//  app
//
//  Created by Mariana Raykova on 6.07.23.
//

import SwiftUI

struct DestinationView4: View {
    @State var rad = true
    var body: some View {HStack{
        Button (action: {rad=true }){
            Text ("  ")
                .frame (width: 30, height: 30)
                .background(Color.white)
                .cornerRadius(100)
                .foregroundColor(Color.black)
                .padding()
                .overlay(RoundedRectangle (cornerRadius: 100)
                    .stroke(Color.black, lineWidth:6)
                    .scaleEffect(0.6)
                )
            Text("")
        }
        Button (action: {rad=false }){
            Text ("   ")
                .frame (width: 30, height: 30)
                .background(Color.white)
                .cornerRadius(100)
                .foregroundColor(Color.black)
                .padding()
                .overlay(RoundedRectangle (cornerRadius: 100)
                    .stroke(Color.black, lineWidth:6)
                    .scaleEffect(0.6)
                )
        }
    }
    }
}

struct DestinationView4_Previews: PreviewProvider {
    static var previews: some View {
        DestinationView4()
    }
}
