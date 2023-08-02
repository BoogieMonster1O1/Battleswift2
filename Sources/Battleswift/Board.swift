import Foundation

public struct Board {
    private var size: (rows: Int, columns: Int)
    private var cells: [[CellState]]

    public init(rows: Int, columns: Int) {
        self.size = (rows, columns)
        self.cells = Array(repeating: Array(repeating: .empty, count: columns), count: rows)
    }

    private func indexFromLetter(_ letter: Character) -> Int {
        return Int(letter.asciiValue! - Character("A").asciiValue!)
    }

    private func indexFromNumber(_ number: String) -> Int {
        return Int(number)!
    }

    public mutating func placeShipFromString(_ shipString: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "([A-Z]+)([0-9]+)([A-Z]+)([0-9]+)", options: [])
        guard let match = regex.firstMatch(in: shipString, options: [], range: NSRange(location: 0, length: shipString.count)) else {
            return false
        }

        let startLetter = Character(shipString[Range(match.range(at: 1), in: shipString)!].uppercased())
        let startNumber = String(shipString[Range(match.range(at: 2), in: shipString)!])
        let endLetter = Character(shipString[Range(match.range(at: 3), in: shipString)!].uppercased())
        let endNumber = String(shipString[Range(match.range(at: 4), in: shipString)!])

        let startRow = indexFromNumber(startNumber)
        let startColumn = indexFromLetter(startLetter)
        let endRow = indexFromNumber(endNumber)
        let endColumn = indexFromLetter(endLetter)

        if startRow == endRow { // Placing the ship horizontally
            let size = abs(endColumn - startColumn) + 1
            return placeShip(at: startRow, column: min(startColumn, endColumn), orientation: .horizontal, size: size)
        } else if startColumn == endColumn { // Placing the ship vertically
            let size = abs(endRow - startRow) + 1
            return placeShip(at: min(startRow, endRow), column: startColumn, orientation: .vertical, size: size)
        } else {
            return false // Invalid input (neither horizontal nor vertical placement)
        }
    }

    public mutating func placeShip(at row: Int, column: Int, orientation: Orientation, size: Int) -> Bool {
        guard row >= 0, row < self.size.rows, column >= 0, column < self.size.columns else {
            return false // Invalid position
        }

        if orientation == .horizontal {
            if column + size - 1 >= self.size.columns {
                return false // Ship doesn't fit horizontally
            }
        } else {
            if row + size - 1 >= self.size.rows {
                return false // Ship doesn't fit vertically
            }
        }

        for i in 0..<size {
            let rowToCheck: Int
            let colToCheck: Int

            if orientation == .horizontal {
                rowToCheck = row
                colToCheck = column + i
            } else {
                rowToCheck = row + i
                colToCheck = column
            }

            guard cells[rowToCheck][colToCheck] == .empty else {
                return false // Cell is already occupied
            }
        }

        for i in 0..<size {
            if orientation == .horizontal {
                cells[row][column + i] = .ship
            } else {
                cells[row + i][column] = .ship
            }
        }

        return true // Ship placed successfully
    }

    mutating func receiveAttack(at row: Int, column: Int) -> CellState {
        guard row >= 0, row < size.rows, column >= 0, column < size.columns else {
            return .empty // Invalid position, treat it as a miss
        }

        let cellState = cells[row][column]
        switch cellState {
        case .empty, .miss:
            cells[row][column] = .miss
        case .ship:
            cells[row][column] = .hit
        case .hit:
            break
        }

        return cellState
    }

    func isGameOver() -> Bool {
        return !cells.flatMap { $0 }.contains(.hit)
    }

    func printBoard() {
        for row in 0..<size.rows {
            var rowString = ""
            for column in 0..<size.columns {
                switch cells[row][column] {
                case .empty:
                    rowString += "O "
                case .ship:
                    rowString += "S "
                case .hit:
                    rowString += "X "
                case .miss:
                    rowString += "M "
                }
            }
            print(rowString)
        }
    }
}
