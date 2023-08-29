//
//  ContentView.swift
//  CatsInterview
//
//  Created by Joshua Ho on 8/22/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CatsViewModel()
    var body: some View {
        VStack {
            if viewModel.cats.count == 0 {
                //Display Button
                if viewModel.status == .initial {
                    Button {
                        viewModel.getCats()
                    } label: {
                        Text("Fetch")
                    }
                } else {
                    Text("Loading Cats...")
                }
            } else {
                //Display List
                HStack {
                    Button {
                        viewModel.doSort = false
                        viewModel.getCats()
                    } label: {
                        Text("Fetch")
                    }
                    Button {
                        viewModel.doSort = true
                        viewModel.getCats()
                    } label: {
                        Text("Sort")
                    }
                }

                List(viewModel.cats) { cat in
                    HStack {
                        AsyncImage(url: URL(string: cat.photo)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(15)
                                .frame(maxWidth: 120, maxHeight: 120)
                        } placeholder: {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 120, maxHeight: 120)
                        }
                        VStack(alignment: .leading) {
                            Text(cat.name)
                                .font(.title)
                                .bold()
                            Text(cat.breed)
                                .foregroundColor(.gray)
                            Text(cat.address)
                                .foregroundColor(.accentColor)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
