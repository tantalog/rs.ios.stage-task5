import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        var profit = 0
        for i in 0..<prices.count {
            var maxMargin = 0
            for j in i+1 ..< prices.count {
                if prices[j] - prices[i] > maxMargin {
                    maxMargin = prices[j] - prices[i]
                }
            }
            profit += maxMargin
        }
        return profit
    }
}
