//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Santhosh Srinivas on 29/05/25.
//

import SwiftUI


struct CapsuleText: View{
    var text: String
    
    var body: some View{
        VStack{
            Text(text)
                .font(.largeTitle)
                .padding()
//                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(Capsule())
        }
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius:10))
    }
}

struct WaterMark: ViewModifier{
    var text: String
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing){
            content
            
            Text(text)
                .foregroundColor(.white)
                .background(.black)
                .padding(5)
                .font(.caption)
        }
    }
}

extension View{
    func watermarked(with text: String) -> some View{
        modifier(WaterMark(text: text))
    }
}

struct ProminentTitles: ViewModifier{
    var title: String
    
    func body(content: Content) -> some View {
        VStack(spacing: 10){
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .background(.white)
            content
        }
    }
}

extension View{
    func prominentTitled(with title: String) -> some View{
        modifier(ProminentTitles(title: title))
    }
}
// UIHostingController  is what is behind the the SwiftUI framework
struct ContentView: View {
    
    @State private var switchColor = true
    var motto1: some View {
        Text("Draco dormiens")
    }
    let motto2 = Text("nunquam titillandus")
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    // @ViewBuilder does the same job as the var body some view.
    var body: some View {
        VStack {
            Button("Hello World"){
                print(type(of: self.body))
                print("Button Clicked")
            }
            .modifier(Title())
            .watermarked(with: "Santhosh Content")
            Text("Hello, world!")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
            Button("Switch Color"){
                switchColor.toggle()
            }
            .foregroundColor(switchColor ? .white : .black)
            .background(switchColor ? .black : .white)
            VStack{
                Text("Gryffindor")
                    .font(.largeTitle)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .padding(10)
            .font(.title)
            .blur(radius: 2)
            motto1
                .foregroundStyle(.green)
            motto2
                .foregroundStyle(.white)
            spells
                .prominentTitled(with: "Spells")
            CapsuleText(text: "Hi Santhosh")
                .foregroundColor(.cyan)
            CapsuleText(text: "New Text")
                .foregroundColor(.yellow)
            // we can break up views by using structs and calling them.
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(.secondary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
