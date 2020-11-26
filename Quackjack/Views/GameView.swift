//
//  ContentView.swift
//  Blackjack2
//
//  Created by Matt Stillwell on 11/5/20.
//

import SwiftUI


struct GameView: View {
    
    @State private var betCredits: Int = 10
    @State private var credits: Int = 100
    @State private var result: String = ""
    
    enum GAME_STATE {
        case BACK
        case UNSTARTED
        case PLAYING
        case COMPLETED
        case BROKE
    }
    
    @State private var gameState: GAME_STATE = GAME_STATE.UNSTARTED
//    @State private var isPresented = false
    
    @State private var dealerHand: [Card]
    @State private var playerHand: [Card]
    
    private var deck = Deck()

    
    init() {
        _dealerHand = State(initialValue: [deck.draw(), deck.draw()])
        _playerHand = State(initialValue: [deck.draw(), deck.draw()])
    }
    
    private func flipCard(person: String, num: Int) -> Void {
        if (person == "player") {
            playerHand[num-1].flippedOver.toggle()
        } else {
            dealerHand[num-1].flippedOver.toggle()
        }
    }
    
    private func addCard(person: String, flipped: Bool) -> Void {
        let MAX_NUM_CARDS_POSSIBLE = 11
        var card: Card = deck.draw()
        card.flippedOver = flipped
        
        if (person == "player") {
            if(playerHand.count < MAX_NUM_CARDS_POSSIBLE) {
                playerHand.append(card)
            }
        } else {
            if(dealerHand.count < MAX_NUM_CARDS_POSSIBLE) {
                dealerHand.append(card)
            }
        }
    }
    
    private func discardHand(person: String) -> Void {
        if (person == "player") {
            playerHand = []
        } else {
            dealerHand = []
        }
    }
    
    private func getButtonColor(disabled: Bool) -> Color {
        if disabled {
            return Color.gray.opacity(0.8)
        } else {
            return Color.blue.opacity(0.8)
        }
    }
    
    func onBackButtonClick() -> Void {
        gameState = GAME_STATE.BACK
    }

    func onPlayButtonClick() -> Void {
        if credits > 0 {
            
            gameState = GAME_STATE.PLAYING
            
            flipCard(person: "dealer", num: 1)

            flipCard(person: "player", num: 1)
            flipCard(person: "player", num: 2)
            
            checkPlayerCards()
        }
    }
    
    func onResetButtonClick() -> Void {
        deck.ready()
        deck.shuffle()
        
        playerHand = []
        dealerHand = []
        
        dealerHand.append(deck.draw())
        dealerHand.append(deck.draw())
        playerHand.append(deck.draw())
        playerHand.append(deck.draw())
        
        result = ""
        gameState = GAME_STATE.UNSTARTED
    }
    
    func onDecreaseBetButtonClick() -> Void {
        betCredits -= 5
        if (betCredits < 1) {
            betCredits = 1
        }
    }
    
    func onIncreaseBetButtonClick() -> Void {
        if (betCredits == 1) {
            betCredits += 4
        } else {
            betCredits += 5
        }
        
        if (betCredits > credits) {
            betCredits = credits
        }
        
        if (credits == 0) {
            gameState = GAME_STATE.BROKE
        }
    }
    
    func onHitButtonClick() -> Void {
        addCard(
            person: "player",
            flipped: false
        )
        
        checkPlayerCards()
    }
    
    func onStayButtonClick() -> Void {
        flipCard(person: "dealer", num: 2)
        dealerPlay()
    }
    
    func resetGame() -> Void {
        discardHand(person: "dealer")
        discardHand(person: "player")

        addCard(person: "dealer", flipped: true)
        addCard(person: "dealer", flipped: true)

        addCard(person: "player", flipped: true)
        addCard(person: "player", flipped: true)
        
        gameState = GAME_STATE.UNSTARTED
    }
    
    func getPoints(hand: [Card]) -> Int {
        return (
            hand
                .filter{!$0.flippedOver}
                .map({$0.getPointValue()})
                .reduce(0, +)
        )
    }
    
    func getNumAces(hand: [Card]) -> Int {
        return (
            hand
                .filter{$0.value == "A"}
                .map({$0.getPointValue()})
                .reduce(0, +)
        )
    }
    
    func getPlayerPoints() -> Int {
        var totalSum = getPoints(hand: playerHand)
        let numAces = getNumAces(hand: playerHand)
        
        if totalSum > 21 && numAces > 0 {
            totalSum -= 10
        }
        return totalSum
    }
    
    func getDealerPoints() -> Int {
        var totalSum = getPoints(hand: dealerHand)
        let numAces = getNumAces(hand: dealerHand)
        
        if totalSum > 21 && numAces > 0 {
            totalSum -= 10
        }
        return totalSum
    }
    
    func checkPlayerCards() -> Void {
        let totalSum = getPlayerPoints()
        
        if(totalSum > 21) {
            result = "You lose"
            credits -= betCredits

//            resetGame()
            gameState = GAME_STATE.COMPLETED
        }
        
        if(betCredits > credits) {
            betCredits = credits
        }
        
        if (credits == 0) {
            gameState = GAME_STATE.BROKE
        }
    }
    
    func dealerPlay() -> Void {
        var totalSum = getDealerPoints()
        
        while(totalSum < 17) {
            addCard(person: "dealer", flipped: false)
            totalSum = getDealerPoints()
        }
        
        let playerTotalSum = getPlayerPoints()
        
        if (totalSum > 21) {
            result = "You win!"
            credits += (betCredits * 2)
        } else if (totalSum > playerTotalSum) {
            result = "You lose"
            credits -= betCredits
        } else if (totalSum == playerTotalSum) {
            result = "Draw"
        } else {
            result = "You win!"
            credits += (betCredits * 2)
        }
        
        if(betCredits > credits) {
            betCredits = credits
        }
        
        if (credits == 0) {
            gameState = GAME_STATE.BROKE
        } else {
            gameState = GAME_STATE.COMPLETED
        }
    }
    
    
    var body: some View {
        Group {
            if (gameState == GAME_STATE.BACK) {
               StartMenuView()
            } else {
                NavigationView {
                    pageBody
                }
                .padding(.top, 0.0)
            }
        }

    }
    
    var pageBody: some View {

            ZStack {
                
               BackgroundView()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack {
                            Button(action: onBackButtonClick, label: {
                                Text("Bjack")
                                    .foregroundColor(.white)
                                        .padding(.all, 10)
                                        .padding([.leading, .trailing], 20)
                                    .background(Color.red, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(20)
                            })
                        }}
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Button(action: onBackButtonClick, label: {
                                Text("other")
                                    .foregroundColor(.white)
                            })
                        }}
                }
                
                
                // Content
                VStack {

    //                // Title
    //                Text("Blackjack")
    //                    .bold()
    //                    .padding()
    //                    .font(.title)
                    
                    // Dealer Hand
                    HandView (
                        hand: $dealerHand
                    )
                    
                    // Player Hand
                    HandView (
                        hand: $playerHand
                    )
                    
                    // Result
                    Text("\(result)")
                        .foregroundColor(.black)

                    // Bet Credits
                    Text("Bet: \(betCredits)")
                        .foregroundColor(.black)
                    
                    
                    // Credits
                    Text("Credits: \(credits)")
                        .foregroundColor(.black)
                    
    //                Button("Present!") {
    //                    self.isPresented.toggle()
    //                }
    //                .fullScreenCover(isPresented: $isPresented, content: FullScreenModalView.init)
                
                    
                    HStack {
                        // Play Button
                        Button(action: onPlayButtonClick,
                        label: {
                            Text("Play")
                        })
                        .disabled(gameState != GAME_STATE.UNSTARTED)
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 20)
                        .background(getButtonColor(disabled: gameState != GAME_STATE.UNSTARTED), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(20)
                        
                        
                        // Reset Button
                        Button(action: onResetButtonClick,
                        label: {
                            Text("Reset")
                        })
                        .disabled(gameState != GAME_STATE.COMPLETED)
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 20)
                        .background(getButtonColor(disabled: gameState != GAME_STATE.COMPLETED), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(20)
                    }
                    
                    
                    // Bet Settings
                    HStack {

                        Button(action: onDecreaseBetButtonClick,
                        label: {
                            Text("Decrease Bet")
                        })
                        .disabled(gameState != GAME_STATE.UNSTARTED)
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 20)
                        .background(getButtonColor(disabled: gameState != GAME_STATE.UNSTARTED), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(20)
                        
                        Button(action: onIncreaseBetButtonClick,
                        label: {
                            Text("Increase Bet")
                        })
                        .disabled(gameState != GAME_STATE.UNSTARTED)
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 20)
                        .background(getButtonColor(disabled: gameState != GAME_STATE.UNSTARTED), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(20)
                        
                    }
                    
                    
                    
                    
                    // Player Options
                    HStack {
                        
                        Button(action: onHitButtonClick,
                        label: {
                            Text("Hit")
                        })
                        .disabled(gameState != GAME_STATE.PLAYING)
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 20)
                        .background(getButtonColor(disabled: gameState != GAME_STATE.PLAYING), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(20)
                        
                        Button(action: onStayButtonClick,
                        label: {
                            Text("Stay")
                        })
                        .disabled(gameState != GAME_STATE.PLAYING)
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 20)
                        .background(getButtonColor(disabled: gameState != GAME_STATE.PLAYING), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(20)
                        
                    }
                    
                }
                .animation(.default)
                .offset(x: 0, y: -50)
            }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
