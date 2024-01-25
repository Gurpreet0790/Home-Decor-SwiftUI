//
//  ProductDetailsScreen.swift
//  Home-Decor-SwiftUI
//
//  Created by ReetDhillon on 2024-01-25.
//

import SwiftUI

struct ProductDetailsScreen: View {
    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                Image("chair_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                DescriptionView()
                    .offset(y: -40)
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack{
                Text("$999")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .foregroundColor(Color("Primary"))
                        .fontWeight(.semibold)
                })
                
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButtonView(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDots")
        )
    }
}


#Preview {
    ProductDetailsScreen()
}
struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Wishbone Chair")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            HStack(spacing: 4){
                ForEach(0 ..< 5){ item in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading,8)
                Spacer()
            }
            Text("Description")
                .padding(.vertical, 8)
                .fontWeight(.medium)
            
            Text("The Wishbone Chair is a premium reproduction of one of the most classic designs from the mid-century modern era. A rare combination of natural and practical, its misleadingly complex construction stems from the designer's extensive knowledge of wood. ")
                .lineSpacing(8.0)
                .opacity(6)
            
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Height: 120 cm")
                        .opacity(0.6)
                    Text("Wide: 85 cm")
                        .opacity(0.6)
                    Text("Diameters: 75 cm")
                        .opacity(0.6)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                VStack(alignment: .leading){
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Jati wood, Canvas, \nAmazing Love")
                        .opacity(0.6)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
           
            .padding(.vertical)
            
            HStack{
                VStack(alignment: .leading){
                    Text("Colors")
                        .fontWeight(.semibold)
                    
                    HStack{
                        ColorsDotView(color: .white)
                        ColorsDotView(color: .black)
                        ColorsDotView(color: Color("Primary"))
                    }
                }
                Spacer()
                
                VStack( alignment: .leading){
                    Text("Quantity")
                        .fontWeight(.semibold)
                    
                    HStack {
                        Button(action: {}){
                            Image(systemName: "minus")
                                .padding(.all, 8)
                        }
                        .frame(width: 28, height: 28)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        .clipShape(Circle())
                        
                        
                        Text("1")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        Button(action: {}){
                            Image(systemName: "plus")
                                .padding(.all, 8)
                        }
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        .background(Color("Primary"))
                        .clipShape(Circle())
                    }
                }
            }
            
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40.0)
    }
}

struct ColorsDotView: View {
    let color: Color
    var body: some View {
        Color(color)
            .frame(width: 24, height:24)
            .clipShape(Circle())
    }
}

struct CustomBackButtonView: View {
    let action: ()-> Void
    var body: some View {
        Button(action: action, label:{
            Image(systemName: "chevron.backward")
                .padding(.all,12)
                .background(Color.white)
                .cornerRadius(8.0)
                .foregroundColor(Color.black)
        })
    }
}
