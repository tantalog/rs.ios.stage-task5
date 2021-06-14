import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        guard message.count >= 1 && message.count <= 60 else {
            return ""
        }
        var output = message
        
        while let range = output.range(of: #"[0-9]+\[[a-z]+\]"#, options: .regularExpression){
            var index = range.lowerBound
            var wordMultiplier = ""
            var word = ""
            
            while index != range.upperBound {
                if output[index].isNumber {
                    wordMultiplier.append(output[index])
                } else if output[index].isLetter {
                    word.append(output[index])
                }
                index = output.index(after: index)
            }
            
            let multiplier = Int(wordMultiplier) ?? 0
            if multiplier < 1 || multiplier > 300  {
                return ""
            }
            output.removeSubrange(range)
            output.insert(contentsOf: String.init(repeating: word, count: multiplier), at: range.lowerBound)
        }
        
        if let range = output.range(of: #"[a-z]+"#, options: .regularExpression) {
            return String(output[range.lowerBound ... output.index(before: (range.upperBound))])
        }
        return ""
    }
}
