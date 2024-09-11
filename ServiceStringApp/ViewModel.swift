//
//  ViewModel.swift
//  ServiceStringApp
//
//  Created by Nuno Mendonça on 09/09/2024.
//

import Foundation
import StringServiceSDK

public class ViewModel: ObservableObject {

    @Published var isStringSentSuccessfuly: Bool? = nil

    private let stringService = StringService()

    func sendString(myString: String) {

        Task {

            do {

                try await stringService.sendString(myString)

                DispatchQueue.main.async {

                    self.isStringSentSuccessfuly = true
                    print("String was sent successfuly.")
                }

            } catch {

                DispatchQueue.main.async {

                    self.isStringSentSuccessfuly = false
                    print("Error on sending the String: \(error.localizedDescription)")
                }
            }
        }
    }
}
