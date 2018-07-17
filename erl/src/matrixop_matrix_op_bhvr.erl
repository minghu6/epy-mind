%%%-------------------------------------------------------------------
%% @doc Behaviour to implement for grpc service matrixop.MatrixOp.
%% @end
%%%-------------------------------------------------------------------

%% this module was generated on 2018-07-17T07:53:07+00:00 and should not be modified manually

-module(matrixop_matrix_op_bhvr).

%% @doc 
-callback echo(reference(), grpcbox_stream:t()) ->
    ok | grpcbox_stream:grpc_error_response().

%% @doc Unary RPC
-callback op(ctx:ctx(), matrix_op_pb:matrix_op_request()) ->
    {ok, matrix_op_pb:matrix_list()} | grpcbox_stream:grpc_error_response().

