//
//  NoListView.swift
//  TodoApp07
//
//  Created by Beatriz Enríquez on 31/01/24.
//

import SwiftUI

struct NoListView: View {
    @State var animate: Bool = false
    var body: some View {
        ScrollView{
            VStack(spacing:20){
                Text("There are no items.")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                
                Text("Be more productive and add some todos to finish them on time !!")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(), label: {
                    Text("Add somenthing 😀")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color("NewColor").opacity(0.5):.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30: 50)
                .shadow(color: animate ? Color("NewColor").opacity(0.5) : .accentColor, radius: animate ? 30: 50, y: animate ? 50:30)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding()
            .onAppear(perform:addAnimation)
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(Animation
                .easeInOut(duration:2.0)
                .repeatForever())
            {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoListView()
}
