//
//  ContentView.swift
//  BullsEye
//
//  Created by Jennie on 12/28/20.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var resizableAlert = false
    @State private var sliderValue = 50.0
    @State private var score = 0
    @State private var game = Game()
    var body: some View {
        var points = self.game.points(sliderValue: Int(sliderValue))
        VStack {
            Text("Round: \(game.round)")
                .font(.title)
                .frame(width: 300, height: 100, alignment: .center)
            VStack {
                Text("🎯🎯Put the bullseye as close as you can to")
                    .kerning(2.0)
                    .bold()
                    .multilineTextAlignment(.center).lineSpacing(4.0)
                    .font(.footnote)
                    
                Text(String(game.target))
                    .kerning(-1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)

                HStack {
                    Text("1")
                        .bold()
                    Slider(value: self.$sliderValue,in:1.0...100)
                        .frame(width: game.sliderSize, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("100")
                        .bold()
                }
                Button(action: {
                    self.alertIsVisible = true
                    
                }) {
                    Text("Hit me")
                }
              
                .alert(isPresented: $alertIsVisible, content: {
                    return Alert(title: Text("The slider value is \(Int(self.sliderValue))"), message: Text("You scored \(points) points this round"), dismissButton: .default(Text("Awesome!!"), action: {game.generateTarget()
                        game.addToScore(numOfPoints: points)
                        game.nextRound()
                        game.generateSize()
                    })
                                
                    )
                })
                
              
                Text( "Your score is: \(game.score)")
                    .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}

