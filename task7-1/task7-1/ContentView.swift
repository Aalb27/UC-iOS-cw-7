//
//  ContentView.swift
//  task7-1
//
//  Created by Abdulaziz Albalool on 23/09/2022.
//

import SwiftUI

struct Castmember: Identifiable {
    let id = UUID()
    let name: String
    let imagename: String
}
struct Movieinfo: Identifiable {
 let id = UUID()
    let title: String
    let imagename: String
    let cast: [Castmember]
    
}

struct ContentView: View {
    
    let movies = [ Movieinfo(
                   title: "bond1",
                   imagename: "bond1", cast: [Castmember(name: "bond", imagename: "bond5")
                                             ,
                                              Castmember(name: "bond", imagename: "bond5")
                                             , Castmember(name: "bond", imagename: "bond5")
                                             , Castmember(name: "bond", imagename: "bond5")])
                        , Movieinfo(
                    title: "bond2",
                    imagename: "bond2", cast: [Castmember(name: "bond", imagename: "bond6"), Castmember(name: "bond", imagename: "bond5"), Castmember(name: "bond", imagename: "bond5"), Castmember(name: "bond", imagename: "bond5"), Castmember(name: "bond", imagename: "bond5")])
                     ,
                    Movieinfo(  title: "bond3",
                                imagename: "bond3", cast: [Castmember(name: "danielcraig", imagename: "danielcraig"), Castmember(name: "danielcraig", imagename: "danielcraig"), Castmember(name: "danielcraig", imagename: "danielcraig") ])   ]
                    
                    
   
    
    
    var body: some View {
        NavigationView{
        List{
            ForEach(movies) { movie in
                NavigationLink(destination: Moviedetail(movie: movie)) {
                Movielistitem(movie: movie)
            }
            }
           
}.navigationTitle("Movies")

        }                .accentColor(.white)

}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Moviedetail: View {
    let movie: Movieinfo
    var body: some View {
        ZStack{
            Color.black
            Image(movie.imagename)
                .resizable()
              
                .opacity(0.5)
                .blur(radius: 10)
                
        VStack{
            Image(movie.imagename)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(5)
                .background(Color.white)
                .clipShape(Circle())
        Text(movie.title)
                .font(.largeTitle)
            Spacer()
            ScrollView(.horizontal) {
            HStack{
                ForEach(movie.cast) {Castmember in
                    VStack{
                        Image(Castmember.imagename)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    Text(Castmember.name)
                }
        }
        }
        }
        }
        .foregroundColor(.white)
} .ignoresSafeArea()
    }
}
struct Movielistitem: View {
    let movie: Movieinfo
    
    var body: some View {
        HStack{
            Image(movie.imagename)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            Text(movie.title)
                .font(.subheadline)
        }
    }
}
