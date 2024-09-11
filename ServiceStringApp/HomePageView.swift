//
//  ContentView.swift
//  ServiceStringApp
//
//  Created by Nuno Mendonça on 09/09/2024.
//

import SwiftUI

struct HomePageView: View {

    @StateObject var viewModel = ViewModel()

    var body: some View {

        VStack {

            self.stateImage()
                .imageScale(.large)
                .foregroundStyle(.tint)

            self.stateText()
        }
        .padding()
        .onAppear {

            self.viewModel.sendString(myString: "teste")
        }
    }
}

private extension HomePageView {

    func stateImage() -> Image {

        switch self.viewModel.isStringSentSuccessfuly {

        case true:
            return Image(systemName: "checkmark.seal.fill")

        case false:
            return Image(systemName: "x.square.fill")

        default:
            return Image(systemName: "clock.fill")
        }
    }

    func stateText() -> Text {

        switch self.viewModel.isStringSentSuccessfuly {

        case true:
            return Text("String was sent Sucessfully")

        case false:
            return Text("String was not sent Successfully.")

        default:
            return Text("Sending the String...")
        }
    }
}

#Preview {

    HomePageView()
}
