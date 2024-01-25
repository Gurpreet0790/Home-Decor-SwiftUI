//
//  HomeScreen.swift
//  Home-Decor-SwiftUI
//
//  Created by ReetDhillon on 2024-01-25.
//

import SwiftUI

struct HomeScreen: View {
    private let categoriesAry = ["All", "Bed", "Chair", "Sofa", "Dinning", "Kitchen", "Lamp", "Dressing"]
    private let productAry = ["Wishbone Chair", "Mella Soft", "Diane Chair", "Milo Chair" ]
    private let productPriceAry = ["$999", "$432", "$876", "$451"]
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("Bg")
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                ScrollView {
                    VStack(alignment: .leading){
                        TopBarView()
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(0 ..< categoriesAry.count, id: \.self){ i in
                                    // if index == 1 then isACtive == true
                                    CategoryView(isActive: i == selectedIndex, textStr: categoriesAry[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Regular", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach( 0 ..< 4) { index in
                                    NavigationLink(destination: ProductDetailsScreen(),
                                                   label: { ProductCardView(productImage: Image("chair_\(index + 1)"), containerSize: 210, productName: productAry[index], productPrice: productPriceAry[index])})
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Regular", size: 24))
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach( 0 ..< 4) { index in
                                    ProductCardView(productImage: Image("chair_\(index + 1)"), containerSize: 180,productName: productAry[index], productPrice: productPriceAry[index])
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                    }
                }
                
                //Custom Bottom Bar
                
                HStack{
                    BottomBarItemView(itemImage: Image("Home"), action: {})
                    BottomBarItemView(itemImage: Image("favIcon"), action: {})
                    BottomBarItemView(itemImage: Image("cartIcon"), action: {})
                    BottomBarItemView(itemImage: Image("User"), action: {})
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15), radius: 8,x:2, y: 6)
                .frame(maxHeight: .infinity, alignment:  .bottom )
            }
        }
    }
}


#Preview {
    HomeScreen()
}
struct TopBarView: View {
    var body: some View {
        HStack{
            Button(action: {}){
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            Button(action:{ }){
                Image("userImage")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
            
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find the \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Funrniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @State private var searchStr: String = ""

    var body: some View {
        HStack{
            HStack{
                Image("Search")
                    .padding(.trailing,8)
                TextField("Search Furniture", text: $searchStr)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.horizontal)
            
            Button(action: {}) {
                Image("scanIcon")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
                    .padding()
            }
        }
    }
}

struct CategoryView: View {
let isActive: Bool
let textStr: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(textStr)
                .font(.system(size: 12))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.6))
            
            if (isActive) {  Color("Primary")
                    .frame(width: 20, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let productImage : Image
    let containerSize: CGFloat
    let productName: String
    let productPrice: String
    
    var body: some View {
        VStack{
            productImage
                .resizable()
                .frame(width: containerSize, height: 200 * (containerSize/210))
                .cornerRadius(20.0)
            
            Text(productName)
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2)
            {
                ForEach(0 ..< 5){ item in
                    Image("star")
                }
                
                Spacer()
                
                Text(productPrice)
                    .font(.title3)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            
        }
        .frame(width: containerSize)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

struct BottomBarItemView: View {
    let itemImage: Image
    let action: ()-> Void
    var body: some View {
        Button(action:action, label: {
            itemImage
                .frame(maxWidth: .infinity)
        })
    }
}
