//
//  count2.swift .swift
//  textcounter
//
//  Created by ズェー on 2024/11/14.
//

import SwiftUI

struct count2_swift_: View {
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View{
        ZStack{
            Color.black.opacity(0.06)
            VStack {
                ZStack {
                    
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                        .frame(width: 280,height: 280)
                    
                    Circle()
                        .trim(from: 0, to: self.to)
                        .stroke(Color.red, style: StrokeStyle(lineWidth: 35, lineCap: .round))
                        .frame(width: 280,height: 280)
                        .rotationEffect(.init(degrees: -90))
                    
                    VStack{
                        Text("\(self.count)")
                            .font(.system(size: 65))
                            .fontWeight(.bold)
                        
                        Text("of 15")
                            .font(.title)
                            .padding(.top)
                    }
                }
                HStack(spacing: 20){
                    Button(action: {
                        
                    }) {
                        HStack(spacing: 15){
                            Image(systemName: self.start ? "pause.fill" : "play.fill")
                                .foregroundColor(.white)
                            
                            Text(self.start ? 
"Pause" : "Play")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(Color.red)
                        .clipShape(Capsule())
                        .shadow(radius: 6)
                    }
                    Button(action: {
                        
                    }) {
                        HStack(spacing: 15){
     
                       Image(systemName: "arrow.clockwise")
                                .foregroundColor(.red)
                            
                            Text("Restart")
                                .foregroundColor(.red)
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(
                            
                            Capsule()
                                .stroke(Color.red, lineWidth: 2)
                            
                            
                        )
                        .shadow(radius: 6)
                    }
                    
                }
                .padding(.top,50)
                
            }
        
            }
        .onReceive(self.time) {(_) in
            if self.count != 15 {
                if self.start{
                    self.count += 1
                    print("hello")
                }
            }else{
                
                self.to = 0
                self.start.toggle()
            }
           
        }
        
    }
        
}
    

              



#Preview {
    count2_swift_()
}
