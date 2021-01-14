import NaturalLanguage
import Foundation
import CoreML

var str = "Hello, playground"

extension String {
    func predictLanguage() -> String {
        let locale = Locale(identifier: "en_US")
        // Spanish
        //let locale = Locale(identifier: "es")
        // Gujarati
        //let locale = Locale(identifier: "gu")


        let recognizer = NLLanguageRecognizer()
        recognizer.processString(self)
        
        let language = recognizer.dominantLanguage
        
        //let lang: String = language!.rawValue
        
        return locale.localizedString(forLanguageCode: language!.rawValue) ?? "unknown"
    }
}

let text = ["My hovercraft is full of eels",
            "Mijn hovercraft zit vol palingen",
            "我的氣墊船充滿了鰻魚",
            "Mit luftpudefartøj er fyldt med ål",
            "Το χόβερκραφτ μου είναι γεμάτο χέλια",
            "제 호버크래프트가 장어로 가득해요",
            "Mi aerodeslizador está lleno de anguilas",
            "Mein Luftkissenfahrzeug ist voller Aale"]

for string in text {
    print("\(string) is in \(string.predictLanguage())")
}
