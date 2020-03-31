from collections import Counter
class Solution(object):
    def isValidSudoku(self, board):
        """
        :type board: List[List[str]]
        :rtype: bool
        """
        for row in range(len(board)):
            #the rows
            c = Counter(board[row])
            del c['.']
            if sum(c.values()) != len(set(c)):
                return False
            # the columns
            column_list = [board[0][row], board[1][row], board[2][row], board[3][row], board[4][row], board[5][row],
                           board[6][row], board[7][row], board[8][row]]
            c = Counter(column_list)
            del c['.']
            if sum(c.values()) != len(set(c)):
                return False
        for row in range(3):
            for column in range(3):
                square = [board[3*row][3*column], board[3*row][3*column+1], board[3*row][3*column+2], board[3*row+1][3*column],
                          board[3*row+1][3*column+1], board[3*row+1][3*column+2], board[3*row+2][3*column], board[3*row+2][3*column+1],
                          board[3*row+2][3*column+2]]
                c = Counter(square)
                del c['.']
                if sum(c.values()) != len(set(c)):
                    return False
        return True