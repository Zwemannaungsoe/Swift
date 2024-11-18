//
//  count.swift
//  textcounter
//
//  Created by ズェー on 2024/11/13.
//
import SwiftUI
import Foundation

struct count: View {
    // properties
    var font: Font = .largeTitle
    var weight: Font.Weight = .regular
    @State var value: Int = 111
    @State var count = 0;
    
    var body: some View {
       
            
            VStack(alignment: .center, spacing: 50){
            
                if let countImage = generateImageFromText("\(count)") {
                                Image(uiImage: countImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                            }
                
                HStack{
                    Button{
                        count += 1
                        
                    }label: {
                        Text("Start")
                            .bold()
                            
                    }
                    .padding()
                    .background(LinearGradient(colors: [.black,.black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .foregroundColor(.white)
                    
                    Button{
                        count = 0
                    }label: {
                        Text("Restart")
                    }
                    .padding()
                    .background(LinearGradient(colors: [.black,.black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .foregroundColor(.white)
                    Button {
                                if count > 0 {
                                        count -= 1
                                    }
                                } label: {
                                    Text("Decrease")
                                }
                                .padding()
                                .background(LinearGradient(colors: [.black, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .foregroundColor(.white)
                            }
                
                }
               
            
            }
        func generateImageFromText(_ text: String) -> UIImage? {
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 40),
                    .foregroundColor: UIColor.black
                ]
                let textSize = text.size(withAttributes: attributes)
                UIGraphicsBeginImageContextWithOptions(textSize, false, 0)
                text.draw(at: CGPoint(x: 0, y: 0), withAttributes: attributes)
                let image = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                return image
            }
        
    }




#Preview {
    count()
}
