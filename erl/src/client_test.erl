-module(client_test).

-compile(export_all).

test_stream1() ->
    {ok, S1}=hellostreamingworld_multi_greeter_client:say_hello(ctx:new()),
    grpcbox_client:send(S1, #{name => "hi", num_greetings => "3"}),
    grpcbox_client:send(S1, #{name => "Arm", num_greetings => "2"}),
    
    {ok, R1} = grpcbox_client:recv_data(S1),
    io:format("~p~n", [R1]),

    {ok, R2}=grpcbox_client:recv_data(S1),
    io:format("~p~n", [R2]),

    {ok, R3}=grpcbox_client:recv_data(S1),
    io:format("~p~n", [R3]),

    {ok, R4}=grpcbox_client:recv_data(S1),
    io:format("~p~n", [R4]),

    {ok, R5}=grpcbox_client:recv_data(S1),
    io:format("~p~n", [R5]),

    grpcbox_client:close_send(S1).

test_echo_matrix() ->
    {ok, S} = matrixop_matrix_op_client:echo(ctx:new()),
    grpcbox_client:send(S, #{e => [0, 1, 2, 3, 4, 5, 6, 7, 8], col => 3, row => 3}),
    grpcbox_client:recv_data(S).
