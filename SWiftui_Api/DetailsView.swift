//
//  DetailsView.swift
//  SWiftui_Api
//
//  Created by Adsum MAC 2 on 05/07/21.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var datas = Int()
    @State var id = Int()
    @State var selectedPost:selectedPost?
    var body: some View {
        
       
        NavigationView{
            //            Text("\(datas)")
            VStack{
                VStack{
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text((selectedPost?.title!)!)
                                    .font(.largeTitle)
                                Text("Swiftui Advance")
                                
                            }
                            Spacer()
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "xmark.circle")
                                    .resizable()
                                    .frame(width: 25, height: 25, alignment: .center)
                                    .foregroundColor(Color.black
                                    )
                            })
                        }
                        .padding()
                        Spacer()
                    }
                    VStack{
                        Image("download")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width - 30, height: 200, alignment: .center)
                            .cornerRadius(25)
                            .padding()
                    }
                    
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.9, alignment: .center)
                .background(Color.red)
                .cornerRadius(20)
                
                
                VStack(alignment: .center){
                    Text((selectedPost?.body!)!)
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .center)
                }.padding()
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        .onAppear(perform: {
            Api().getselectedPosts(ids: datas) { (selectedPost)  in
                self.selectedPost = selectedPost
            }
            
        })

    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}


struct selectedPost : Codable {
    let userId : Int?
    let id : Int?
    let title : String?
    let body : String?

    enum CodingKeys: String, CodingKey {

        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        body = try values.decodeIfPresent(String.self, forKey: .body)
    }

}
