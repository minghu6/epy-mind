-module(proto_tools).

-export([compile_all/0, compile_all/1]).

compile_all() -> compile_all("./src").

compile_all(Dir) ->
    c:cd(Dir),
    ProtoPattern = "./*.proto",
    ProtoFiles = filelib:wildcard(ProtoPattern),
    lib_parallel:pmap(fun (ProtoPath) ->
                  io:format("Compiled proto file: ~s~n", [ProtoPath]),
                  grpc_client:compile(ProtoPath)
              end,
              ProtoFiles,
              erlang:system_info(logical_processors_available) * 10).
