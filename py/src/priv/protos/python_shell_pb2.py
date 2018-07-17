# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: priv/protos/python_shell.proto

import sys
_b=sys.version_info[0]<3 and (lambda x:x) or (lambda x:x.encode('latin1'))
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
from google.protobuf import descriptor_pb2
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='priv/protos/python_shell.proto',
  package='python_shell',
  syntax='proto3',
  serialized_pb=_b('\n\x1epriv/protos/python_shell.proto\x12\x0cpython_shell\"\x1c\n\x0bStringValue\x12\r\n\x05value\x18\x01 \x01(\t\")\n\x0b\x45valRequest\x12\x0c\n\x04\x65xec\x18\x01 \x01(\t\x12\x0c\n\x04\x65val\x18\x02 \x01(\t2M\n\x0bPythonShell\x12>\n\x04\x45val\x12\x19.python_shell.EvalRequest\x1a\x19.python_shell.StringValue\"\x00\x62\x06proto3')
)




_STRINGVALUE = _descriptor.Descriptor(
  name='StringValue',
  full_name='python_shell.StringValue',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='value', full_name='python_shell.StringValue.value', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=48,
  serialized_end=76,
)


_EVALREQUEST = _descriptor.Descriptor(
  name='EvalRequest',
  full_name='python_shell.EvalRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='exec', full_name='python_shell.EvalRequest.exec', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='eval', full_name='python_shell.EvalRequest.eval', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=78,
  serialized_end=119,
)

DESCRIPTOR.message_types_by_name['StringValue'] = _STRINGVALUE
DESCRIPTOR.message_types_by_name['EvalRequest'] = _EVALREQUEST
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

StringValue = _reflection.GeneratedProtocolMessageType('StringValue', (_message.Message,), dict(
  DESCRIPTOR = _STRINGVALUE,
  __module__ = 'priv.protos.python_shell_pb2'
  # @@protoc_insertion_point(class_scope:python_shell.StringValue)
  ))
_sym_db.RegisterMessage(StringValue)

EvalRequest = _reflection.GeneratedProtocolMessageType('EvalRequest', (_message.Message,), dict(
  DESCRIPTOR = _EVALREQUEST,
  __module__ = 'priv.protos.python_shell_pb2'
  # @@protoc_insertion_point(class_scope:python_shell.EvalRequest)
  ))
_sym_db.RegisterMessage(EvalRequest)



_PYTHONSHELL = _descriptor.ServiceDescriptor(
  name='PythonShell',
  full_name='python_shell.PythonShell',
  file=DESCRIPTOR,
  index=0,
  options=None,
  serialized_start=121,
  serialized_end=198,
  methods=[
  _descriptor.MethodDescriptor(
    name='Eval',
    full_name='python_shell.PythonShell.Eval',
    index=0,
    containing_service=None,
    input_type=_EVALREQUEST,
    output_type=_STRINGVALUE,
    options=None,
  ),
])
_sym_db.RegisterServiceDescriptor(_PYTHONSHELL)

DESCRIPTOR.services_by_name['PythonShell'] = _PYTHONSHELL

# @@protoc_insertion_point(module_scope)