import UIKit
protocol MessageProtocol {
    var messageString: String {get set}
    init(messageString: String)
    func prepareMessage()
}

protocol SenderProtocol {
    var message: MessageProtocol? {get set}
    func sendMessage()
    func verifyMessage()
}

class PlainTextMessage: MessageProtocol {
    var messageString: String
    required init(messageString: String) {
        self.messageString = messageString
    }
    func prepareMessage() {
        //  Nothing to do
    }
}

class AESEncryptedMessage: MessageProtocol {
    var messageString: String
    required init(messageString: String) {
        self.messageString = messageString
    }
    func prepareMessage() {
        self.messageString = "AES: " + self.messageString
    }
}


class DESEncryptedMessage: MessageProtocol {
    var messageString: String
    required init(messageString: String) {
        self.messageString = messageString
    }
    func prepareMessage() {
        self.messageString = "DES: " + self.messageString
    }
}


class EmailSender: SenderProtocol {
    var message: MessageProtocol?
    func sendMessage() {
        print("Sending through E-Mail:")
        print("     \(message!.messageString)")
    }
    func verifyMessage() {
        print("Verifying E-Mail message")
    }
}

class SMSSender: SenderProtocol {
    var message: MessageProtocol?
    func sendMessage() {
        print("Sending through SMS:")
        print("     \(message!.messageString)")
    }
    func verifyMessage() {
        print("Verifying SMS message")
    }
}

struct MessageingBridge {
    static func sendMessage(message: MessageProtocol, sender: SenderProtocol) {
        var sender = sender
        message.prepareMessage()
        sender.message = message
        sender.verifyMessage()
        sender.sendMessage()
    }
    
}


var myMessage = PlainTextMessage(messageString: "Plain Text Message")
var myEncMessage = AESEncryptedMessage(messageString: "Encrypted Message")

MessageingBridge.sendMessage(message: myMessage, sender: SMSSender())

MessageingBridge.sendMessage(message: myMessage, sender: EmailSender())

MessageingBridge.sendMessage(message: myEncMessage, sender: EmailSender())
