//
//  ContentView.swift
//  SWiftui_Api
//
//  Created by Adsum MAC 2 on 05/07/21.
//

import SwiftUI
//
//struct datas {
//    let id = UUID()
//    let title: String
//    let description: String
//}

struct ContentView: View {
    @State var posts:[Post] = []
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    let results = [
//          datas(title: "shubham", description: "hello how are you"),
//        datas(title: "shubham", description: "hello how are you"),
//        datas(title: "shubham", description: "hello how are you"),
//        datas(title: "shubham", description: "hello how are you"),
//        datas(title: "shubham", description: "hello how are you")
//       ]
    let gradient = Gradient(colors: [Color(.random()), Color(.random()), Color(.random()), Color(.random()),Color(.random()), Color(.random())])
    
//    let gradients = Gradient(colors: [.black, .pink])
    var body: some View {
        NavigationView{
        
        VStack{
//            VStack(alignment: .leading){
//                HStack{
//                    Text("Course")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .foregroundColor(.blue)
//                    Spacer()
//                }.padding()
//            }
            
            VStack{
                List(posts, id: \.id)
                 {result in
                    NavigationLink(destination: DetailsView(datas: result.id!)) {
                    VStack{
                        VStack(alignment: .leading){
                            HStack{
                                VStack(alignment:.leading){
                                    Text(result.title!)
                                        .font(.custom("lato", fixedSize: 25.0))
                                        .fontWeight(.bold)
                                    
                                    Text(result.body!)
                                        .font(.custom("lato", fixedSize: 15))
                                        .fontWeight(.semibold)
                                        .padding(.top, 10)
                                    Spacer()
                                }
                                Spacer()
                                VStack{
                                    Image(systemName: "circle")
                                        .resizable()
                                        .frame(width: 60, height: 60, alignment: .center)
                                        .aspectRatio(contentMode: .fill)
                                        
                                        .background(
                                            AngularGradient(gradient: gradient, center: .center, startAngle: .degrees(0), endAngle: .degrees(360 + 360))

                                            )
                                        .cornerRadius(30)
                                    
                                    Spacer()
                                }
                            }.padding()
                            Spacer()
                        }
                    }.frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height/4, alignment: .center)
                    .background(Color(.random()))
                    
                    .cornerRadius(20)
      
                }
                
            }
                .onAppear {
                Api().getPosts { (posts) in
                    self.posts = posts
                }
            }
                
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("Course")
    }
    
    }
   
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
   
}
