-module(matrix).
-compile(export_all).

print_matrix(MatrixRequest) ->
    L = maps:get(e, MatrixRequest),
    Col = maps:get(col, MatrixRequest),
    print_matrix(L, Col).

print_matrix([], _) ->
    ok;
print_matrix(L, Col) ->
    {L1, Remains} = lists:split(Col, L),
    io:format("~p~n", [L1]),
    print_matrix(Remains, Col).