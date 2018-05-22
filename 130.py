class Solution(object):
    def solve(self, board):
        """
        :type board: List[List[str]]
        :rtype: void Do not return anything, modify board in-place instead.
        """
        
        def save(board, indx, indy):
            board[indx][indy] = "V"

            if(indx < row-1 and board[indx + 1][indy] == "O"):
                save(board, indx+1, indy)
            if(indy < col-1 and board[indx][indy + 1] == "O"):
                save(board, indx, indy+1)
            if(indx > 0 and board[indx-1][indy] == "O"):
                save(board, indx-1, indy)
            if(indy > 0 and board[indx][indy - 1] == "O"):
                save(board, indx, indy-1)

        if len(board) != 0:    
            row = len(board)
            col = len(board[0])
            for (indx, arr) in enumerate(board):
                for (indy, val) in enumerate(arr):
                    if ( indx == 0 or indx == row-1 or indy == 0 or indy == col-1) and val == "O":
                        save(board, indx, indy)

            for (ind, arr) in enumerate(board):
                board[ind] = ["O" if i == "V" else "X" for i in arr]
    