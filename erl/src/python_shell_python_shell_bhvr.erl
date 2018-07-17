%%%-------------------------------------------------------------------
%% @doc Behaviour to implement for grpc service python_shell.PythonShell.
%% @end
%%%-------------------------------------------------------------------

%% this module was generated on 2018-07-17T07:53:07+00:00 and should not be modified manually

-module(python_shell_python_shell_bhvr).

%% @doc Unary RPC
-callback eval(ctx:ctx(), python_shell_pb:eval_request()) ->
    {ok, python_shell_pb:string_value()} | grpcbox_stream:grpc_error_response().

