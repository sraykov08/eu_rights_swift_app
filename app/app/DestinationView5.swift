//
//  DestinationView5.swift
//  app
//
//  Created by Mariana Raykova on 6.07.23.
//
import UIKit
import SwiftUI

func apiCall(){
    guard let url = URL(string: "loalhost:3000/test") else {
        return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body:[String: AnyHashable] = ["user_Id":1, "user_email":"niga@mail.ng", "user_pass":"younig"]
    request.httpBody = try?JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    let task = URLSession.shared.dataTask(with: request){data, _, error in
        guard let data = data, error == nil else{
            return
        }
        do{
            let response = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            print("SUCCSESS: \(response)")
        }
        catch{
            print(error)
        }
    }
    task.resume()
}

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

struct DestinationView5: View {
    @State private var text = ""
    @State private var text1 = ""
    @State private var text2 = ""
    @State private var text3 = ""
    @State private var gender = "Male"
    @State private var ayn = true
    @State var options = ["Male", "Fmale"]
    @State var rad = true
    let URL_SAVE_TEAM = "http://localhost/MyWebService/api/createteam.php"
    var body: some View {
        VStack{
            Form{
                    TextField("email", text: $text)
                    TextField("pass", text: $text1)
                    TextField("confirm pass", text: $text2)
                    Picker(selection: $gender, label: Text("Gender")) {
                        ForEach(options, id: \.self) { item in // 4
                            Text(item) // 5
                        }
                    }
                    TextField("country", text: $text3)
                    Toggle("Are you nigga?", isOn: $ayn)
                //HStack{
                    Button ("niga"){
                        rad=true
                    }
                    .frame (width: 30, height: 30)
                    .background(Color.white)
                    .cornerRadius(100)
                    .foregroundColor(Color.black)
                    .padding()
                    .overlay(RoundedRectangle (cornerRadius: 100)
                        .stroke(Color.black, lineWidth:6)
                        .scaleEffect(0.6)
                    )
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
                //}
                HStack{
                    Button("Submit") {
                        if(text1==text2 && isValidEmail(text)){
                            guard let url = URL(string: "http://localhost/MyWebService/api/createteam.php") else {
                                return
                            }
                            var request = URLRequest(url: url)
                            request.httpMethod = "POST"
                            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                            let body:[String: AnyHashable] = ["user_email":text, "user_pass":text1, "user_gender":gender, "user_country":text3, "user_q":ayn]
                            request.httpBody = try?JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
                            let task = URLSession.shared.dataTask(with: request){data, _, error in
                                guard let data = data, error == nil else{
                                    return
                                }
                                do{
                                    let response = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                                    print("SUCCSESS: \(response)")
                                }
                                catch{
                                    print(error)
                                }
                            }
                            task.resume()
                        }
                        else {
                            print("Passwords doesnt match, or not valid email")
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    Button("Clear", action: { text=""; text1=""; text2=""; text3="" })
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        
    }
}

struct DestinationView5_Previews: PreviewProvider {
    static var previews: some View {
        DestinationView5()
    }
}
