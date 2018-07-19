%%%-------------------------------------------------------------------
%% @doc Behaviour to implement for grpc service python_shell.PythonShell.
%% @end
%%%-------------------------------------------------------------------

%% this module was generated on 2018-07-19T03:09:16+00:00 and should not be modified manually

-module(python_shell_python_shell_client).

-compile([nowarn_export_all]).
-compile([export_all]).

-include_lib("grpcbox/include/grpcbox.hrl").

-define(SERVICE, 'python_shell.PythonShell').
-define(PROTO_MODULE, 'python_shell_pb').
-define(MARSHAL_FUN(T), fun(I) -> ?PROTO_MODULE:encode_msg(I, T) end).
-define(UNMARSHAL_FUN(T), fun(I) -> ?PROTO_MODULE:decode_msg(I, T) end).
-define(DEF(Input, Output), #grpcbox_def{service=?SERVICE,
                                         marshal_fun=?MARSHAL_FUN(Input),
                                         unmarshal_fun=?UNMARSHAL_FUN(Output)}).

%% @doc Unary RPC
-spec eval(ctx:t(), python_shell_pb:eval_request()) ->
    {ok, python_shell_pb:string_value(), grpcbox:metadata()} | grpcbox_stream:grpc_error_response().
eval(Ctx, Input) ->
    eval(Ctx, Input, #{}).

-spec eval(ctx:t(), python_shell_pb:eval_request(), grpcbox_client:options()) ->
    {ok, python_shell_pb:string_value(), grpcbox:metadata()} | grpcbox_stream:grpc_error_response().
eval(Ctx, Input, Options) ->
    grpcbox_client:unary(Ctx, <<"/python_shell.PythonShell/Eval">>, Input, ?DEF(eval_request, string_value), Options).

