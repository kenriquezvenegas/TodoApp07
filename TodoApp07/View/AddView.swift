//
//  AddView.swift
//  TodoApp07
//
//  Created by Beatriz Enríquez on 31/01/24.
//

import SwiftUI

struct AddView: View {
    //dismiss a view
    @Environment(\.presentationMode ) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                TextField("Type something here....", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 0.621, saturation: 0.048, brightness: 0.916))
                    .cornerRadius(10)
                    
                Button(action: saveButtonTapped, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth: 250)
                        .background(Color.accentColor)
                        .cornerRadius(30)
                })
            }
            .padding()
            .navigationTitle("Add an Item")
            .alert(isPresented: $showAlert,content: getAlert)
        }
    }
    
    func saveButtonTapped(){
        if (textIsValid()){
            listViewModel.addItem(textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    
    func textIsValid() -> Bool{
        if textFieldText.count < 3 {
            alertTitle = "Your to do item should contain at least 3 characters 😟."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    AddView()
}
