% define the heuristic function for the game of Connect Four
heuristic(Board, Player, Value) :-
    % initialize the heuristic value to 0
    Value is 0,
    % find all possible moves on the current board
    findall((I,J), valid_move(Board, I, J), Moves),
    % calculate the heuristic value for each possible move
    % and add it to the total heuristic value
    maplist(move_value(Board, Player), Moves, MoveValues),
    sumlist(MoveValues, Value).

% define the move_value/3 predicate that calculates the heuristic
% value for a given move on the board
move_value(Board, Player, (I,J), Value) :-
    % make the move on the board
    make_move(Board, Player, I, J, NewBoard),
    % calculate the number of possible wins for the current player
    % after making the move
    wins(Player, NewBoard, NumWins),
    % calculate the number of possible wins for the opponent player
    % after making the move
    wins(Opponent, NewBoard, NumLosses),
    % calculate the heuristic value for the move
    Value is NumWins - NumLosses.

% define the wins/3 predicate that calculates the number of possible
% wins for a given player on the given board
wins(Player, Board, NumWins) :-
    % initialize the number of wins to 0
    NumWins is 0,
    % find all horizontal, vertical, and diagonal lines on the board
    findall(Line, (horizontal(Board, Line), member(Player, Line)), Horizontals),
    findall(Line, (vertical(Board, Line), member(Player, Line)), Verticals),
    findall(Line, (diagonal(Board, Line), member(Player, Line)), Diagonals),
    % calculate the number of wins in each direction
    length(Horizontals, NumHorizontals),
    length(Verticals, NumVerticals),
    length(Diagonals, NumDiagonals),
    % sum the number of wins in each direction to get the total number of wins
    NumWins is NumHorizontals + NumVerticals + NumDiagonals.

% define the horizontal/2 predicate that extracts all horizontal lines
% from the given board
horizontal(Board, Line) :-
    member(Line, Board).

% define the vertical/2 predicate that extracts all vertical lines
% from the given board
vertical(Board, Line) :-
    transpose(Board, ColumnBoard),
    member(Line, ColumnBoard).

% define the diagonal/2 predicate that extracts all diagonal lines
% from the given board
diagonal(Board, Line) :-
    diagonalize(Board, DiagonalBoard),
    member(Line, DiagonalBoard).
