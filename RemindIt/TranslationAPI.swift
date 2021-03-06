//
//  TranslationAPI.swift
//  RemindIt
//
//  Created by Manel Muñiz on 23/11/2020.
//

import Foundation


enum TranslationAPI {
    func getURL() -> String {
            var urlString = ""
     
            switch self {
            case .detectLanguage:
                urlString = "https://translation.googleapis.com/language/translate/v2/detect"
     
            case .translate:
                urlString = "https://translation.googleapis.com/language/translate/v2"
     
            case .supportedLanguages:
                urlString = "https://translation.googleapis.com/language/translate/v2/languages"
            }
     
            return urlString
        }
    
    func getHTTPMethod() -> String {
            if self == .supportedLanguages {
                return "GET"
            } else {
                return "POST"
            }
        }
}
