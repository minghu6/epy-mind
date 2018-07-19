%%%-------------------------------------------------------------------
%% @doc Behaviour to implement for grpc service matrixop.MatrixOp.
%% @end
%%%-------------------------------------------------------------------

%% this module was generated on 2018-07-19T03:09:16+00:00 and should not be modified manually

-module(matrixop_matrix_op_client).

-compile([nowarn_export_all]).
-compile([export_all]).

-include_lib("grpcbox/include/grpcbox.hrl").

-define(SERVICE, 'matrixop.MatrixOp').
-define(PROTO_MODULE, 'matrix_op_pb').
-define(MARSHAL_FUN(T), fun(I) -> ?PROTO_MODULE:encode_msg(I, T) end).
-define(UNMARSHAL_FUN(T), fun(I) -> ?PROTO_MODULE:decode_msg(I, T) end).
-define(DEF(Input, Output), #grpcbox_def{service=?SERVICE,
                                         marshal_fun=?MARSHAL_FUN(Input),
                                         unmarshal_fun=?UNMARSHAL_FUN(Output)}).

%% @doc 
-spec echo(ctx:t()) ->
    {ok, grpclient:stream()} | grpcbox_stream:grpc_error_response().
echo(Ctx) ->
    echo(Ctx, #{}).

-spec echo(ctx:t(), grpcbox_client:options()) ->
    {ok, grpclient:stream()} | grpcbox_stream:grpc_error_response().
echo(Ctx, Options) ->
    grpcbox_client:stream(Ctx, <<"/matrixop.MatrixOp/Echo">>, ?DEF(matrix, matrix), Options).

%% @doc Unary RPC
-spec op(ctx:t(), matrix_op_pb:matrix_op_request()) ->
    {ok, matrix_op_pb:matrix_list(), grpcbox:metadata()} | grpcbox_stream:grpc_error_response().
op(Ctx, Input) ->
    op(Ctx, Input, #{}).

-spec op(ctx:t(), matrix_op_pb:matrix_op_request(), grpcbox_client:options()) ->
    {ok, matrix_op_pb:matrix_list(), grpcbox:metadata()} | grpcbox_stream:grpc_error_response().
op(Ctx, Input, Options) ->
    grpcbox_client:unary(Ctx, <<"/matrixop.MatrixOp/Op">>, Input, ?DEF(matrix_op_request, matrix_list), Options).

