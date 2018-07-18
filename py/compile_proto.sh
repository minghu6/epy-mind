#! /bin/bash

rm -f ./src/protos/*_pb2*.py

find ./priv/protos -name "*.proto" | while read line; do
    echo -e "compiled proto file: $line"
    python3 -m grpc_tools.protoc -I ./ --python_out=./src $line
    python3 -m grpc_tools.protoc -I ./ --grpc_python_out=./src $line
done