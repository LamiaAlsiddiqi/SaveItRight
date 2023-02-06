//
//  ContentView.swift
//  Save_It_Right
//
//  Created by Shouq Turki Bin Tuwaym on 05/02/2023.
//

import SwiftUI

struct SectionContent{
    let image:UIImage
    let text:String
}

var values = [
    SectionContent(
        image:UIImage(imageLiteralResourceName: "Jeweleries"),
        text:"Jeweleries"
    ),
    SectionContent(
        image:UIImage(imageLiteralResourceName: "Sport Equipm"),
        text:"Sports Equipments"
    ),
    SectionContent(
        image:UIImage(imageLiteralResourceName: "Electronic Device"),
        text:"Electronic Devices"
    ),
    SectionContent(
        image:UIImage(imageLiteralResourceName: "Houseware"),
        text: "Houseware"
    ),
    SectionContent(
        image:UIImage(imageLiteralResourceName: "Spare Parts"),
        text:"Spare Parts"
    ),
    SectionContent(
        image:UIImage(imageLiteralResourceName: "Others"),
        text:"Others"
    )
]

func fixWidthSize(
    imgSize:CGSize,
    viewSize:CGSize,
    safeArea: EdgeInsets
) -> CGFloat {
    let imgAsp = imgSize.width / imgSize.height
    let viewAsp = ( ( viewSize.width - (14 * 2 + 7) - safeArea.leading - safeArea.trailing ) /  2 ) / 150
    if ( imgAsp > viewAsp
    ){
        return imgSize.width * imgAsp / viewAsp
    }else{
        return imgSize.width
    }
}
func fixHeightSize(
    imgSize:CGSize,
    viewSize:CGSize,
    safeArea: EdgeInsets
) -> CGFloat {
    let imgAsp = imgSize.height / imgSize.width
    let viewAsp = 150 / ( ( viewSize.width - (14 * 2 + 7) - safeArea.leading - safeArea.trailing ) /  2 )
    if ( imgAsp > viewAsp
    ){
        return 150 * imgAsp / viewAsp
    }else{
        return 150
    }
}

struct BoxView: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    let sectionContent: SectionContent
    
    var body: some View {
        //        NavigationLink(destination: SwiftUIView(sourceLink:self.sectionContent.text)){
        
        NavigationLink(destination: Categories(), label: {
            ZStack(alignment: .bottomLeading){
                Image(uiImage: self.sectionContent.image)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        minWidth: fixWidthSize(
                            imgSize: self.sectionContent.image.size,
                            viewSize: UIScreen.main.bounds.size,
                            safeArea: safeAreaInsets
                        ),
                        minHeight: fixHeightSize(
                            imgSize: self.sectionContent.image.size,
                            viewSize: UIScreen.main.bounds.size,
                            safeArea: safeAreaInsets
                        )
                    )
                //                .frame(
                //                    minWidth: 0,
                //                    maxWidth: .infinity
                //                )
                    .frame(
                        width: ( ( UIScreen.main.bounds.size.width - (14 * 2 + 7) - safeAreaInsets.leading - safeAreaInsets.trailing ) /  2 ),
                        height: 150
                    )
                    .clipped()
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 1),
                            Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.0),
                            Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.0),
                            Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.0)
                        ]
                    ),
                    startPoint: .bottom, endPoint: .top
                )
                Text(self.sectionContent.text).foregroundColor(.white)
                    .padding(5)
            }
        })
        .frame(
            minWidth: 0,
            maxWidth: .infinity
        )
        .frame(height: 150)
        .cornerRadius(10)
        .padding(0)
    }
    //        .navigationBarBackButtonHidden(true)
}
//}


struct MainPage: View {
    init() {
        //Use this if NavigationBarTitle is with Large Font
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @State var searchText = ""
    
    
    var body: some View {
        NavigationView{
                
                ScrollView {
                    
                    
                    
                    
                    
                    Text("My Warranties")
                        .font(.title2)
                        .fontWeight(.semibold)
//                        .foregroundColor(.white)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .padding(.trailing, 200.0)
                    
                    ForEach(
                        0 ..< Int(
                            ceil(
                                Double(values.count)/2.0
                            )
                        ),
                        id: \.self
                    ) { i in
                        HStack(spacing: 7) {
                            BoxView(sectionContent: values[i*2])
                            if(i*2+1 < values.count){
                                BoxView(sectionContent: values[i*2+1])
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .padding(14)
                .searchable(text: $searchText, prompt: "Search")
                
                
                
                
                .navigationBarTitle("Warranty", displayMode: .large)
                .navigationBarItems(
                    trailing:
                        NavigationLink( destination: Categories()
                                      )
                    {
                        Image(systemName: "plus")
                            .foregroundColor(Color("Blue2"))
                            .imageScale(.large)
                    }
                )
            }
    }
}


struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
            .preferredColorScheme(.dark)
    }
}

