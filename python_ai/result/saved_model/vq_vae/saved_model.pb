��
��
D
AddV2
x"T
y"T
z"T"
Ttype:
2	��
�
ArgMin

input"T
	dimension"Tidx
output"output_type"!
Ttype:
2	
"
Tidxtype0:
2	"
output_typetype0	:
2	
B
AssignVariableOp
resource
value"dtype"
dtypetype�
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
�
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

�
Conv2DBackpropInput
input_sizes
filter"T
out_backprop"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
�
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�
?
Mul
x"T
y"T
z"T"
Ttype:
2	�

NoOp
�
OneHot
indices"TI	
depth
on_value"T
	off_value"T
output"T"
axisint���������"	
Ttype"
TItype0	:
2	
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
8
Pow
x"T
y"T
z"T"
Ttype:
2
	
@
ReadVariableOp
resource
value"dtype"
dtypetype�
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
�
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ��
@
StaticRegexFullMatch	
input

output
"
patternstring
2
StopGradient

input"T
output"T"	
Ttype
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
<
Sub
x"T
y"T
z"T"
Ttype:
2	
�
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
�
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.7.02v2.7.0-rc1-69-gc256c071bb28��
}
embeddings_vqvaeVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@�*!
shared_nameembeddings_vqvae
v
$embeddings_vqvae/Read/ReadVariableOpReadVariableOpembeddings_vqvae*
_output_shapes
:	@�*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
�
vae/encoder/conv2d/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: **
shared_namevae/encoder/conv2d/kernel
�
-vae/encoder/conv2d/kernel/Read/ReadVariableOpReadVariableOpvae/encoder/conv2d/kernel*&
_output_shapes
: *
dtype0
�
vae/encoder/conv2d/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *(
shared_namevae/encoder/conv2d/bias

+vae/encoder/conv2d/bias/Read/ReadVariableOpReadVariableOpvae/encoder/conv2d/bias*
_output_shapes
: *
dtype0
�
vae/encoder/conv2d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*,
shared_namevae/encoder/conv2d_1/kernel
�
/vae/encoder/conv2d_1/kernel/Read/ReadVariableOpReadVariableOpvae/encoder/conv2d_1/kernel*&
_output_shapes
: @*
dtype0
�
vae/encoder/conv2d_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@**
shared_namevae/encoder/conv2d_1/bias
�
-vae/encoder/conv2d_1/bias/Read/ReadVariableOpReadVariableOpvae/encoder/conv2d_1/bias*
_output_shapes
:@*
dtype0
�
vae/encoder/conv2d_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*,
shared_namevae/encoder/conv2d_2/kernel
�
/vae/encoder/conv2d_2/kernel/Read/ReadVariableOpReadVariableOpvae/encoder/conv2d_2/kernel*&
_output_shapes
:@@*
dtype0
�
vae/encoder/conv2d_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@**
shared_namevae/encoder/conv2d_2/bias
�
-vae/encoder/conv2d_2/bias/Read/ReadVariableOpReadVariableOpvae/encoder/conv2d_2/bias*
_output_shapes
:@*
dtype0
�
#vae/decoder/conv2d_transpose/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*4
shared_name%#vae/decoder/conv2d_transpose/kernel
�
7vae/decoder/conv2d_transpose/kernel/Read/ReadVariableOpReadVariableOp#vae/decoder/conv2d_transpose/kernel*&
_output_shapes
: @*
dtype0
�
!vae/decoder/conv2d_transpose/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *2
shared_name#!vae/decoder/conv2d_transpose/bias
�
5vae/decoder/conv2d_transpose/bias/Read/ReadVariableOpReadVariableOp!vae/decoder/conv2d_transpose/bias*
_output_shapes
: *
dtype0
�
%vae/decoder/conv2d_transpose_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*6
shared_name'%vae/decoder/conv2d_transpose_1/kernel
�
9vae/decoder/conv2d_transpose_1/kernel/Read/ReadVariableOpReadVariableOp%vae/decoder/conv2d_transpose_1/kernel*&
_output_shapes
:@@*
dtype0
�
#vae/decoder/conv2d_transpose_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*4
shared_name%#vae/decoder/conv2d_transpose_1/bias
�
7vae/decoder/conv2d_transpose_1/bias/Read/ReadVariableOpReadVariableOp#vae/decoder/conv2d_transpose_1/bias*
_output_shapes
:@*
dtype0
�
%vae/decoder/conv2d_transpose_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *6
shared_name'%vae/decoder/conv2d_transpose_2/kernel
�
9vae/decoder/conv2d_transpose_2/kernel/Read/ReadVariableOpReadVariableOp%vae/decoder/conv2d_transpose_2/kernel*&
_output_shapes
: *
dtype0
�
#vae/decoder/conv2d_transpose_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#vae/decoder/conv2d_transpose_2/bias
�
7vae/decoder/conv2d_transpose_2/bias/Read/ReadVariableOpReadVariableOp#vae/decoder/conv2d_transpose_2/bias*
_output_shapes
:*
dtype0
�
Adam/embeddings_vqvae/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@�*(
shared_nameAdam/embeddings_vqvae/m
�
+Adam/embeddings_vqvae/m/Read/ReadVariableOpReadVariableOpAdam/embeddings_vqvae/m*
_output_shapes
:	@�*
dtype0
�
 Adam/vae/encoder/conv2d/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *1
shared_name" Adam/vae/encoder/conv2d/kernel/m
�
4Adam/vae/encoder/conv2d/kernel/m/Read/ReadVariableOpReadVariableOp Adam/vae/encoder/conv2d/kernel/m*&
_output_shapes
: *
dtype0
�
Adam/vae/encoder/conv2d/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: */
shared_name Adam/vae/encoder/conv2d/bias/m
�
2Adam/vae/encoder/conv2d/bias/m/Read/ReadVariableOpReadVariableOpAdam/vae/encoder/conv2d/bias/m*
_output_shapes
: *
dtype0
�
"Adam/vae/encoder/conv2d_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*3
shared_name$"Adam/vae/encoder/conv2d_1/kernel/m
�
6Adam/vae/encoder/conv2d_1/kernel/m/Read/ReadVariableOpReadVariableOp"Adam/vae/encoder/conv2d_1/kernel/m*&
_output_shapes
: @*
dtype0
�
 Adam/vae/encoder/conv2d_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*1
shared_name" Adam/vae/encoder/conv2d_1/bias/m
�
4Adam/vae/encoder/conv2d_1/bias/m/Read/ReadVariableOpReadVariableOp Adam/vae/encoder/conv2d_1/bias/m*
_output_shapes
:@*
dtype0
�
"Adam/vae/encoder/conv2d_2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*3
shared_name$"Adam/vae/encoder/conv2d_2/kernel/m
�
6Adam/vae/encoder/conv2d_2/kernel/m/Read/ReadVariableOpReadVariableOp"Adam/vae/encoder/conv2d_2/kernel/m*&
_output_shapes
:@@*
dtype0
�
 Adam/vae/encoder/conv2d_2/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*1
shared_name" Adam/vae/encoder/conv2d_2/bias/m
�
4Adam/vae/encoder/conv2d_2/bias/m/Read/ReadVariableOpReadVariableOp Adam/vae/encoder/conv2d_2/bias/m*
_output_shapes
:@*
dtype0
�
*Adam/vae/decoder/conv2d_transpose/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*;
shared_name,*Adam/vae/decoder/conv2d_transpose/kernel/m
�
>Adam/vae/decoder/conv2d_transpose/kernel/m/Read/ReadVariableOpReadVariableOp*Adam/vae/decoder/conv2d_transpose/kernel/m*&
_output_shapes
: @*
dtype0
�
(Adam/vae/decoder/conv2d_transpose/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *9
shared_name*(Adam/vae/decoder/conv2d_transpose/bias/m
�
<Adam/vae/decoder/conv2d_transpose/bias/m/Read/ReadVariableOpReadVariableOp(Adam/vae/decoder/conv2d_transpose/bias/m*
_output_shapes
: *
dtype0
�
,Adam/vae/decoder/conv2d_transpose_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*=
shared_name.,Adam/vae/decoder/conv2d_transpose_1/kernel/m
�
@Adam/vae/decoder/conv2d_transpose_1/kernel/m/Read/ReadVariableOpReadVariableOp,Adam/vae/decoder/conv2d_transpose_1/kernel/m*&
_output_shapes
:@@*
dtype0
�
*Adam/vae/decoder/conv2d_transpose_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*;
shared_name,*Adam/vae/decoder/conv2d_transpose_1/bias/m
�
>Adam/vae/decoder/conv2d_transpose_1/bias/m/Read/ReadVariableOpReadVariableOp*Adam/vae/decoder/conv2d_transpose_1/bias/m*
_output_shapes
:@*
dtype0
�
,Adam/vae/decoder/conv2d_transpose_2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *=
shared_name.,Adam/vae/decoder/conv2d_transpose_2/kernel/m
�
@Adam/vae/decoder/conv2d_transpose_2/kernel/m/Read/ReadVariableOpReadVariableOp,Adam/vae/decoder/conv2d_transpose_2/kernel/m*&
_output_shapes
: *
dtype0
�
*Adam/vae/decoder/conv2d_transpose_2/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*;
shared_name,*Adam/vae/decoder/conv2d_transpose_2/bias/m
�
>Adam/vae/decoder/conv2d_transpose_2/bias/m/Read/ReadVariableOpReadVariableOp*Adam/vae/decoder/conv2d_transpose_2/bias/m*
_output_shapes
:*
dtype0
�
Adam/embeddings_vqvae/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@�*(
shared_nameAdam/embeddings_vqvae/v
�
+Adam/embeddings_vqvae/v/Read/ReadVariableOpReadVariableOpAdam/embeddings_vqvae/v*
_output_shapes
:	@�*
dtype0
�
 Adam/vae/encoder/conv2d/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *1
shared_name" Adam/vae/encoder/conv2d/kernel/v
�
4Adam/vae/encoder/conv2d/kernel/v/Read/ReadVariableOpReadVariableOp Adam/vae/encoder/conv2d/kernel/v*&
_output_shapes
: *
dtype0
�
Adam/vae/encoder/conv2d/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: */
shared_name Adam/vae/encoder/conv2d/bias/v
�
2Adam/vae/encoder/conv2d/bias/v/Read/ReadVariableOpReadVariableOpAdam/vae/encoder/conv2d/bias/v*
_output_shapes
: *
dtype0
�
"Adam/vae/encoder/conv2d_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*3
shared_name$"Adam/vae/encoder/conv2d_1/kernel/v
�
6Adam/vae/encoder/conv2d_1/kernel/v/Read/ReadVariableOpReadVariableOp"Adam/vae/encoder/conv2d_1/kernel/v*&
_output_shapes
: @*
dtype0
�
 Adam/vae/encoder/conv2d_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*1
shared_name" Adam/vae/encoder/conv2d_1/bias/v
�
4Adam/vae/encoder/conv2d_1/bias/v/Read/ReadVariableOpReadVariableOp Adam/vae/encoder/conv2d_1/bias/v*
_output_shapes
:@*
dtype0
�
"Adam/vae/encoder/conv2d_2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*3
shared_name$"Adam/vae/encoder/conv2d_2/kernel/v
�
6Adam/vae/encoder/conv2d_2/kernel/v/Read/ReadVariableOpReadVariableOp"Adam/vae/encoder/conv2d_2/kernel/v*&
_output_shapes
:@@*
dtype0
�
 Adam/vae/encoder/conv2d_2/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*1
shared_name" Adam/vae/encoder/conv2d_2/bias/v
�
4Adam/vae/encoder/conv2d_2/bias/v/Read/ReadVariableOpReadVariableOp Adam/vae/encoder/conv2d_2/bias/v*
_output_shapes
:@*
dtype0
�
*Adam/vae/decoder/conv2d_transpose/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*;
shared_name,*Adam/vae/decoder/conv2d_transpose/kernel/v
�
>Adam/vae/decoder/conv2d_transpose/kernel/v/Read/ReadVariableOpReadVariableOp*Adam/vae/decoder/conv2d_transpose/kernel/v*&
_output_shapes
: @*
dtype0
�
(Adam/vae/decoder/conv2d_transpose/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *9
shared_name*(Adam/vae/decoder/conv2d_transpose/bias/v
�
<Adam/vae/decoder/conv2d_transpose/bias/v/Read/ReadVariableOpReadVariableOp(Adam/vae/decoder/conv2d_transpose/bias/v*
_output_shapes
: *
dtype0
�
,Adam/vae/decoder/conv2d_transpose_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*=
shared_name.,Adam/vae/decoder/conv2d_transpose_1/kernel/v
�
@Adam/vae/decoder/conv2d_transpose_1/kernel/v/Read/ReadVariableOpReadVariableOp,Adam/vae/decoder/conv2d_transpose_1/kernel/v*&
_output_shapes
:@@*
dtype0
�
*Adam/vae/decoder/conv2d_transpose_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*;
shared_name,*Adam/vae/decoder/conv2d_transpose_1/bias/v
�
>Adam/vae/decoder/conv2d_transpose_1/bias/v/Read/ReadVariableOpReadVariableOp*Adam/vae/decoder/conv2d_transpose_1/bias/v*
_output_shapes
:@*
dtype0
�
,Adam/vae/decoder/conv2d_transpose_2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *=
shared_name.,Adam/vae/decoder/conv2d_transpose_2/kernel/v
�
@Adam/vae/decoder/conv2d_transpose_2/kernel/v/Read/ReadVariableOpReadVariableOp,Adam/vae/decoder/conv2d_transpose_2/kernel/v*&
_output_shapes
: *
dtype0
�
*Adam/vae/decoder/conv2d_transpose_2/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*;
shared_name,*Adam/vae/decoder/conv2d_transpose_2/bias/v
�
>Adam/vae/decoder/conv2d_transpose_2/bias/v/Read/ReadVariableOpReadVariableOp*Adam/vae/decoder/conv2d_transpose_2/bias/v*
_output_shapes
:*
dtype0

NoOpNoOp
�F
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*�F
value�FB�F B�F
�
encoder
vector_quantizer
decoder
	optimizer
loss
	variables
trainable_variables
regularization_losses
		keras_api


signatures
r

layer_dict

latent_dim
	variables
trainable_variables
regularization_losses
	keras_api
b

embeddings
	variables
trainable_variables
regularization_losses
	keras_api
t

layer_dict
output_layer
	variables
trainable_variables
regularization_losses
	keras_api
�
iter

beta_1

beta_2
	decay
 learning_ratem{!m|"m}#m~$m%m�&m�'m�(m�)m�*m�+m�,m�v�!v�"v�#v�$v�%v�&v�'v�(v�)v�*v�+v�,v�
 
^
!0
"1
#2
$3
%4
&5
6
'7
(8
)9
*10
+11
,12
^
!0
"1
#2
$3
%4
&5
6
'7
(8
)9
*10
+11
,12
 
�
-non_trainable_variables

.layers
/metrics
0layer_regularization_losses
1layer_metrics
	variables
trainable_variables
regularization_losses
 

2layer_1
3layer_2
h

%kernel
&bias
4	variables
5trainable_variables
6regularization_losses
7	keras_api
*
!0
"1
#2
$3
%4
&5
*
!0
"1
#2
$3
%4
&5
 
�
8non_trainable_variables

9layers
:metrics
;layer_regularization_losses
<layer_metrics
	variables
trainable_variables
regularization_losses
\Z
VARIABLE_VALUEembeddings_vqvae6vector_quantizer/embeddings/.ATTRIBUTES/VARIABLE_VALUE

0

0
 
�
=non_trainable_variables

>layers
?metrics
@layer_regularization_losses
Alayer_metrics
	variables
trainable_variables
regularization_losses

Blayer_1
Clayer_2
h

+kernel
,bias
D	variables
Etrainable_variables
Fregularization_losses
G	keras_api
*
'0
(1
)2
*3
+4
,5
*
'0
(1
)2
*3
+4
,5
 
�
Hnon_trainable_variables

Ilayers
Jmetrics
Klayer_regularization_losses
Llayer_metrics
	variables
trainable_variables
regularization_losses
HF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUEvae/encoder/conv2d/kernel&variables/0/.ATTRIBUTES/VARIABLE_VALUE
SQ
VARIABLE_VALUEvae/encoder/conv2d/bias&variables/1/.ATTRIBUTES/VARIABLE_VALUE
WU
VARIABLE_VALUEvae/encoder/conv2d_1/kernel&variables/2/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUEvae/encoder/conv2d_1/bias&variables/3/.ATTRIBUTES/VARIABLE_VALUE
WU
VARIABLE_VALUEvae/encoder/conv2d_2/kernel&variables/4/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUEvae/encoder/conv2d_2/bias&variables/5/.ATTRIBUTES/VARIABLE_VALUE
_]
VARIABLE_VALUE#vae/decoder/conv2d_transpose/kernel&variables/7/.ATTRIBUTES/VARIABLE_VALUE
][
VARIABLE_VALUE!vae/decoder/conv2d_transpose/bias&variables/8/.ATTRIBUTES/VARIABLE_VALUE
a_
VARIABLE_VALUE%vae/decoder/conv2d_transpose_1/kernel&variables/9/.ATTRIBUTES/VARIABLE_VALUE
`^
VARIABLE_VALUE#vae/decoder/conv2d_transpose_1/bias'variables/10/.ATTRIBUTES/VARIABLE_VALUE
b`
VARIABLE_VALUE%vae/decoder/conv2d_transpose_2/kernel'variables/11/.ATTRIBUTES/VARIABLE_VALUE
`^
VARIABLE_VALUE#vae/decoder/conv2d_transpose_2/bias'variables/12/.ATTRIBUTES/VARIABLE_VALUE
 

0
1
2
 
 
 
h

!kernel
"bias
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
h

#kernel
$bias
Q	variables
Rtrainable_variables
Sregularization_losses
T	keras_api

%0
&1

%0
&1
 
�
Unon_trainable_variables

Vlayers
Wmetrics
Xlayer_regularization_losses
Ylayer_metrics
4	variables
5trainable_variables
6regularization_losses
 

20
31
2
 
 
 
 
 
 
 
 
h

'kernel
(bias
Z	variables
[trainable_variables
\regularization_losses
]	keras_api
h

)kernel
*bias
^	variables
_trainable_variables
`regularization_losses
a	keras_api

+0
,1

+0
,1
 
�
bnon_trainable_variables

clayers
dmetrics
elayer_regularization_losses
flayer_metrics
D	variables
Etrainable_variables
Fregularization_losses
 

B0
C1
2
 
 
 

!0
"1

!0
"1
 
�
gnon_trainable_variables

hlayers
imetrics
jlayer_regularization_losses
klayer_metrics
M	variables
Ntrainable_variables
Oregularization_losses

#0
$1

#0
$1
 
�
lnon_trainable_variables

mlayers
nmetrics
olayer_regularization_losses
player_metrics
Q	variables
Rtrainable_variables
Sregularization_losses
 
 
 
 
 

'0
(1

'0
(1
 
�
qnon_trainable_variables

rlayers
smetrics
tlayer_regularization_losses
ulayer_metrics
Z	variables
[trainable_variables
\regularization_losses

)0
*1

)0
*1
 
�
vnon_trainable_variables

wlayers
xmetrics
ylayer_regularization_losses
zlayer_metrics
^	variables
_trainable_variables
`regularization_losses
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
}
VARIABLE_VALUEAdam/embeddings_vqvae/mRvector_quantizer/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUE Adam/vae/encoder/conv2d/kernel/mBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
vt
VARIABLE_VALUEAdam/vae/encoder/conv2d/bias/mBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUE"Adam/vae/encoder/conv2d_1/kernel/mBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUE Adam/vae/encoder/conv2d_1/bias/mBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUE"Adam/vae/encoder/conv2d_2/kernel/mBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUE Adam/vae/encoder/conv2d_2/bias/mBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE*Adam/vae/decoder/conv2d_transpose/kernel/mBvariables/7/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
�~
VARIABLE_VALUE(Adam/vae/decoder/conv2d_transpose/bias/mBvariables/8/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE,Adam/vae/decoder/conv2d_transpose_1/kernel/mBvariables/9/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE*Adam/vae/decoder/conv2d_transpose_1/bias/mCvariables/10/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE,Adam/vae/decoder/conv2d_transpose_2/kernel/mCvariables/11/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE*Adam/vae/decoder/conv2d_transpose_2/bias/mCvariables/12/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/embeddings_vqvae/vRvector_quantizer/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUE Adam/vae/encoder/conv2d/kernel/vBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
vt
VARIABLE_VALUEAdam/vae/encoder/conv2d/bias/vBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUE"Adam/vae/encoder/conv2d_1/kernel/vBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUE Adam/vae/encoder/conv2d_1/bias/vBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUE"Adam/vae/encoder/conv2d_2/kernel/vBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUE Adam/vae/encoder/conv2d_2/bias/vBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE*Adam/vae/decoder/conv2d_transpose/kernel/vBvariables/7/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
�~
VARIABLE_VALUE(Adam/vae/decoder/conv2d_transpose/bias/vBvariables/8/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE,Adam/vae/decoder/conv2d_transpose_1/kernel/vBvariables/9/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE*Adam/vae/decoder/conv2d_transpose_1/bias/vCvariables/10/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE,Adam/vae/decoder/conv2d_transpose_2/kernel/vCvariables/11/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
��
VARIABLE_VALUE*Adam/vae/decoder/conv2d_transpose_2/bias/vCvariables/12/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
�
serving_default_input_1Placeholder*/
_output_shapes
:���������  *
dtype0*$
shape:���������  
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1vae/encoder/conv2d/kernelvae/encoder/conv2d/biasvae/encoder/conv2d_1/kernelvae/encoder/conv2d_1/biasvae/encoder/conv2d_2/kernelvae/encoder/conv2d_2/biasembeddings_vqvae%vae/decoder/conv2d_transpose_1/kernel#vae/decoder/conv2d_transpose_1/bias#vae/decoder/conv2d_transpose/kernel!vae/decoder/conv2d_transpose/bias%vae/decoder/conv2d_transpose_2/kernel#vae/decoder/conv2d_transpose_2/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  */
_read_only_resource_inputs
	
*8
config_proto(&

CPU

GPU2*0J

  `E8� *-
f(R&
$__inference_signature_wrapper_206795
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename$embeddings_vqvae/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOp-vae/encoder/conv2d/kernel/Read/ReadVariableOp+vae/encoder/conv2d/bias/Read/ReadVariableOp/vae/encoder/conv2d_1/kernel/Read/ReadVariableOp-vae/encoder/conv2d_1/bias/Read/ReadVariableOp/vae/encoder/conv2d_2/kernel/Read/ReadVariableOp-vae/encoder/conv2d_2/bias/Read/ReadVariableOp7vae/decoder/conv2d_transpose/kernel/Read/ReadVariableOp5vae/decoder/conv2d_transpose/bias/Read/ReadVariableOp9vae/decoder/conv2d_transpose_1/kernel/Read/ReadVariableOp7vae/decoder/conv2d_transpose_1/bias/Read/ReadVariableOp9vae/decoder/conv2d_transpose_2/kernel/Read/ReadVariableOp7vae/decoder/conv2d_transpose_2/bias/Read/ReadVariableOp+Adam/embeddings_vqvae/m/Read/ReadVariableOp4Adam/vae/encoder/conv2d/kernel/m/Read/ReadVariableOp2Adam/vae/encoder/conv2d/bias/m/Read/ReadVariableOp6Adam/vae/encoder/conv2d_1/kernel/m/Read/ReadVariableOp4Adam/vae/encoder/conv2d_1/bias/m/Read/ReadVariableOp6Adam/vae/encoder/conv2d_2/kernel/m/Read/ReadVariableOp4Adam/vae/encoder/conv2d_2/bias/m/Read/ReadVariableOp>Adam/vae/decoder/conv2d_transpose/kernel/m/Read/ReadVariableOp<Adam/vae/decoder/conv2d_transpose/bias/m/Read/ReadVariableOp@Adam/vae/decoder/conv2d_transpose_1/kernel/m/Read/ReadVariableOp>Adam/vae/decoder/conv2d_transpose_1/bias/m/Read/ReadVariableOp@Adam/vae/decoder/conv2d_transpose_2/kernel/m/Read/ReadVariableOp>Adam/vae/decoder/conv2d_transpose_2/bias/m/Read/ReadVariableOp+Adam/embeddings_vqvae/v/Read/ReadVariableOp4Adam/vae/encoder/conv2d/kernel/v/Read/ReadVariableOp2Adam/vae/encoder/conv2d/bias/v/Read/ReadVariableOp6Adam/vae/encoder/conv2d_1/kernel/v/Read/ReadVariableOp4Adam/vae/encoder/conv2d_1/bias/v/Read/ReadVariableOp6Adam/vae/encoder/conv2d_2/kernel/v/Read/ReadVariableOp4Adam/vae/encoder/conv2d_2/bias/v/Read/ReadVariableOp>Adam/vae/decoder/conv2d_transpose/kernel/v/Read/ReadVariableOp<Adam/vae/decoder/conv2d_transpose/bias/v/Read/ReadVariableOp@Adam/vae/decoder/conv2d_transpose_1/kernel/v/Read/ReadVariableOp>Adam/vae/decoder/conv2d_transpose_1/bias/v/Read/ReadVariableOp@Adam/vae/decoder/conv2d_transpose_2/kernel/v/Read/ReadVariableOp>Adam/vae/decoder/conv2d_transpose_2/bias/v/Read/ReadVariableOpConst*9
Tin2
02.	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

  `E8� *(
f#R!
__inference__traced_save_207848
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameembeddings_vqvae	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratevae/encoder/conv2d/kernelvae/encoder/conv2d/biasvae/encoder/conv2d_1/kernelvae/encoder/conv2d_1/biasvae/encoder/conv2d_2/kernelvae/encoder/conv2d_2/bias#vae/decoder/conv2d_transpose/kernel!vae/decoder/conv2d_transpose/bias%vae/decoder/conv2d_transpose_1/kernel#vae/decoder/conv2d_transpose_1/bias%vae/decoder/conv2d_transpose_2/kernel#vae/decoder/conv2d_transpose_2/biasAdam/embeddings_vqvae/m Adam/vae/encoder/conv2d/kernel/mAdam/vae/encoder/conv2d/bias/m"Adam/vae/encoder/conv2d_1/kernel/m Adam/vae/encoder/conv2d_1/bias/m"Adam/vae/encoder/conv2d_2/kernel/m Adam/vae/encoder/conv2d_2/bias/m*Adam/vae/decoder/conv2d_transpose/kernel/m(Adam/vae/decoder/conv2d_transpose/bias/m,Adam/vae/decoder/conv2d_transpose_1/kernel/m*Adam/vae/decoder/conv2d_transpose_1/bias/m,Adam/vae/decoder/conv2d_transpose_2/kernel/m*Adam/vae/decoder/conv2d_transpose_2/bias/mAdam/embeddings_vqvae/v Adam/vae/encoder/conv2d/kernel/vAdam/vae/encoder/conv2d/bias/v"Adam/vae/encoder/conv2d_1/kernel/v Adam/vae/encoder/conv2d_1/bias/v"Adam/vae/encoder/conv2d_2/kernel/v Adam/vae/encoder/conv2d_2/bias/v*Adam/vae/decoder/conv2d_transpose/kernel/v(Adam/vae/decoder/conv2d_transpose/bias/v,Adam/vae/decoder/conv2d_transpose_1/kernel/v*Adam/vae/decoder/conv2d_transpose_1/bias/v,Adam/vae/decoder/conv2d_transpose_2/kernel/v*Adam/vae/decoder/conv2d_transpose_2/bias/v*8
Tin1
/2-*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

  `E8� *+
f&R$
"__inference__traced_restore_207990�
�
�
3__inference_conv2d_transpose_1_layer_call_fn_207623

inputs!
unknown:@@
	unknown_0:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *W
fRRP
N__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_206321w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  @: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������  @
 
_user_specified_nameinputs
�
�
__inference_loss_fn_0_207292^
Dvae_encoder_conv2d_kernel_regularizer_square_readvariableop_resource: 
identity��;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp�
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOpReadVariableOpDvae_encoder_conv2d_kernel_regularizer_square_readvariableop_resource*&
_output_shapes
: *
dtype0�
,vae/encoder/conv2d/kernel/Regularizer/SquareSquareCvae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
+vae/encoder/conv2d/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
)vae/encoder/conv2d/kernel/Regularizer/SumSum0vae/encoder/conv2d/kernel/Regularizer/Square:y:04vae/encoder/conv2d/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: p
+vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
)vae/encoder/conv2d/kernel/Regularizer/mulMul4vae/encoder/conv2d/kernel/Regularizer/mul/x:output:02vae/encoder/conv2d/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: k
IdentityIdentity-vae/encoder/conv2d/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp<^vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2z
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp
�
�
B__inference_conv2d_layer_call_and_return_conditional_losses_207473

inputs8
conv2d_readvariableop_resource: -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������   �
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
,vae/encoder/conv2d/kernel/Regularizer/SquareSquareCvae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
+vae/encoder/conv2d/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
)vae/encoder/conv2d/kernel/Regularizer/SumSum0vae/encoder/conv2d/kernel/Regularizer/Square:y:04vae/encoder/conv2d/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: p
+vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
)vae/encoder/conv2d/kernel/Regularizer/mulMul4vae/encoder/conv2d/kernel/Regularizer/mul/x:output:02vae/encoder/conv2d/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������   �
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp<^vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2z
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������  
 
_user_specified_nameinputs
�"
�
L__inference_conv2d_transpose_layer_call_and_return_conditional_losses_206356

inputsB
(conv2d_transpose_readvariableop_resource: @-
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskI
stack/1Const*
_output_shapes
: *
dtype0*
value	B : I
stack/2Const*
_output_shapes
: *
dtype0*
value	B : I
stack/3Const*
_output_shapes
: *
dtype0*
value	B : �
stackPackstrided_slice:output:0stack/1:output:0stack/2:output:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSlicestack:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������   �
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
6vae/decoder/conv2d_transpose/kernel/Regularizer/SquareSquareMvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
5vae/decoder/conv2d_transpose/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3vae/decoder/conv2d_transpose/kernel/Regularizer/SumSum:vae/decoder/conv2d_transpose/kernel/Regularizer/Square:y:0>vae/decoder/conv2d_transpose/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
3vae/decoder/conv2d_transpose/kernel/Regularizer/mulMul>vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0<vae/decoder/conv2d_transpose/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������   �
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpF^vae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpEvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������  @
 
_user_specified_nameinputs
�
�
__inference_loss_fn_4_207430j
Pvae_decoder_conv2d_transpose_1_kernel_regularizer_square_readvariableop_resource:@@
identity��Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpPvae_decoder_conv2d_transpose_1_kernel_regularizer_square_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
8vae/decoder/conv2d_transpose_1/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: w
IdentityIdentity9vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOpH^vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp
�
�
__inference_loss_fn_1_207303`
Fvae_encoder_conv2d_1_kernel_regularizer_square_readvariableop_resource: @
identity��=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp�
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpFvae_encoder_conv2d_1_kernel_regularizer_square_readvariableop_resource*&
_output_shapes
: @*
dtype0�
.vae/encoder/conv2d_1/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
-vae/encoder/conv2d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_1/kernel/Regularizer/SumSum2vae/encoder/conv2d_1/kernel/Regularizer/Square:y:06vae/encoder/conv2d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_1/kernel/Regularizer/mulMul6vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: m
IdentityIdentity/vae/encoder/conv2d_1/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp>^vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2~
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp
�
�
1__inference_conv2d_transpose_layer_call_fn_207520

inputs!
unknown: @
	unknown_0: 
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+��������������������������� *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *U
fPRN
L__inference_conv2d_transpose_layer_call_and_return_conditional_losses_206176�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+��������������������������� `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������@: : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������@
 
_user_specified_nameinputs
��
� 
"__inference__traced_restore_207990
file_prefix4
!assignvariableop_embeddings_vqvae:	@�&
assignvariableop_1_adam_iter:	 (
assignvariableop_2_adam_beta_1: (
assignvariableop_3_adam_beta_2: '
assignvariableop_4_adam_decay: /
%assignvariableop_5_adam_learning_rate: F
,assignvariableop_6_vae_encoder_conv2d_kernel: 8
*assignvariableop_7_vae_encoder_conv2d_bias: H
.assignvariableop_8_vae_encoder_conv2d_1_kernel: @:
,assignvariableop_9_vae_encoder_conv2d_1_bias:@I
/assignvariableop_10_vae_encoder_conv2d_2_kernel:@@;
-assignvariableop_11_vae_encoder_conv2d_2_bias:@Q
7assignvariableop_12_vae_decoder_conv2d_transpose_kernel: @C
5assignvariableop_13_vae_decoder_conv2d_transpose_bias: S
9assignvariableop_14_vae_decoder_conv2d_transpose_1_kernel:@@E
7assignvariableop_15_vae_decoder_conv2d_transpose_1_bias:@S
9assignvariableop_16_vae_decoder_conv2d_transpose_2_kernel: E
7assignvariableop_17_vae_decoder_conv2d_transpose_2_bias:>
+assignvariableop_18_adam_embeddings_vqvae_m:	@�N
4assignvariableop_19_adam_vae_encoder_conv2d_kernel_m: @
2assignvariableop_20_adam_vae_encoder_conv2d_bias_m: P
6assignvariableop_21_adam_vae_encoder_conv2d_1_kernel_m: @B
4assignvariableop_22_adam_vae_encoder_conv2d_1_bias_m:@P
6assignvariableop_23_adam_vae_encoder_conv2d_2_kernel_m:@@B
4assignvariableop_24_adam_vae_encoder_conv2d_2_bias_m:@X
>assignvariableop_25_adam_vae_decoder_conv2d_transpose_kernel_m: @J
<assignvariableop_26_adam_vae_decoder_conv2d_transpose_bias_m: Z
@assignvariableop_27_adam_vae_decoder_conv2d_transpose_1_kernel_m:@@L
>assignvariableop_28_adam_vae_decoder_conv2d_transpose_1_bias_m:@Z
@assignvariableop_29_adam_vae_decoder_conv2d_transpose_2_kernel_m: L
>assignvariableop_30_adam_vae_decoder_conv2d_transpose_2_bias_m:>
+assignvariableop_31_adam_embeddings_vqvae_v:	@�N
4assignvariableop_32_adam_vae_encoder_conv2d_kernel_v: @
2assignvariableop_33_adam_vae_encoder_conv2d_bias_v: P
6assignvariableop_34_adam_vae_encoder_conv2d_1_kernel_v: @B
4assignvariableop_35_adam_vae_encoder_conv2d_1_bias_v:@P
6assignvariableop_36_adam_vae_encoder_conv2d_2_kernel_v:@@B
4assignvariableop_37_adam_vae_encoder_conv2d_2_bias_v:@X
>assignvariableop_38_adam_vae_decoder_conv2d_transpose_kernel_v: @J
<assignvariableop_39_adam_vae_decoder_conv2d_transpose_bias_v: Z
@assignvariableop_40_adam_vae_decoder_conv2d_transpose_1_kernel_v:@@L
>assignvariableop_41_adam_vae_decoder_conv2d_transpose_1_bias_v:@Z
@assignvariableop_42_adam_vae_decoder_conv2d_transpose_2_kernel_v: L
>assignvariableop_43_adam_vae_decoder_conv2d_transpose_2_bias_v:
identity_45��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_14�AssignVariableOp_15�AssignVariableOp_16�AssignVariableOp_17�AssignVariableOp_18�AssignVariableOp_19�AssignVariableOp_2�AssignVariableOp_20�AssignVariableOp_21�AssignVariableOp_22�AssignVariableOp_23�AssignVariableOp_24�AssignVariableOp_25�AssignVariableOp_26�AssignVariableOp_27�AssignVariableOp_28�AssignVariableOp_29�AssignVariableOp_3�AssignVariableOp_30�AssignVariableOp_31�AssignVariableOp_32�AssignVariableOp_33�AssignVariableOp_34�AssignVariableOp_35�AssignVariableOp_36�AssignVariableOp_37�AssignVariableOp_38�AssignVariableOp_39�AssignVariableOp_4�AssignVariableOp_40�AssignVariableOp_41�AssignVariableOp_42�AssignVariableOp_43�AssignVariableOp_5�AssignVariableOp_6�AssignVariableOp_7�AssignVariableOp_8�AssignVariableOp_9�
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:-*
dtype0*�
value�B�-B6vector_quantizer/embeddings/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB'variables/10/.ATTRIBUTES/VARIABLE_VALUEB'variables/11/.ATTRIBUTES/VARIABLE_VALUEB'variables/12/.ATTRIBUTES/VARIABLE_VALUEBRvector_quantizer/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/7/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/8/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/9/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/10/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/11/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/12/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRvector_quantizer/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/7/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/8/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/9/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/10/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/11/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/12/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:-*
dtype0*m
valuedBb-B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*�
_output_shapes�
�:::::::::::::::::::::::::::::::::::::::::::::*;
dtypes1
/2-	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOpAssignVariableOp!assignvariableop_embeddings_vqvaeIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_1AssignVariableOpassignvariableop_1_adam_iterIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_2AssignVariableOpassignvariableop_2_adam_beta_1Identity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_3AssignVariableOpassignvariableop_3_adam_beta_2Identity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_4AssignVariableOpassignvariableop_4_adam_decayIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_5AssignVariableOp%assignvariableop_5_adam_learning_rateIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_6AssignVariableOp,assignvariableop_6_vae_encoder_conv2d_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_7AssignVariableOp*assignvariableop_7_vae_encoder_conv2d_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_8AssignVariableOp.assignvariableop_8_vae_encoder_conv2d_1_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_9AssignVariableOp,assignvariableop_9_vae_encoder_conv2d_1_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_10AssignVariableOp/assignvariableop_10_vae_encoder_conv2d_2_kernelIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_11AssignVariableOp-assignvariableop_11_vae_encoder_conv2d_2_biasIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_12AssignVariableOp7assignvariableop_12_vae_decoder_conv2d_transpose_kernelIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_13AssignVariableOp5assignvariableop_13_vae_decoder_conv2d_transpose_biasIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_14AssignVariableOp9assignvariableop_14_vae_decoder_conv2d_transpose_1_kernelIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_15AssignVariableOp7assignvariableop_15_vae_decoder_conv2d_transpose_1_biasIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_16AssignVariableOp9assignvariableop_16_vae_decoder_conv2d_transpose_2_kernelIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_17AssignVariableOp7assignvariableop_17_vae_decoder_conv2d_transpose_2_biasIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_18AssignVariableOp+assignvariableop_18_adam_embeddings_vqvae_mIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_19AssignVariableOp4assignvariableop_19_adam_vae_encoder_conv2d_kernel_mIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_20AssignVariableOp2assignvariableop_20_adam_vae_encoder_conv2d_bias_mIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_21AssignVariableOp6assignvariableop_21_adam_vae_encoder_conv2d_1_kernel_mIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_22AssignVariableOp4assignvariableop_22_adam_vae_encoder_conv2d_1_bias_mIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_23AssignVariableOp6assignvariableop_23_adam_vae_encoder_conv2d_2_kernel_mIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_24AssignVariableOp4assignvariableop_24_adam_vae_encoder_conv2d_2_bias_mIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_25AssignVariableOp>assignvariableop_25_adam_vae_decoder_conv2d_transpose_kernel_mIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_26AssignVariableOp<assignvariableop_26_adam_vae_decoder_conv2d_transpose_bias_mIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_27AssignVariableOp@assignvariableop_27_adam_vae_decoder_conv2d_transpose_1_kernel_mIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_28AssignVariableOp>assignvariableop_28_adam_vae_decoder_conv2d_transpose_1_bias_mIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_29AssignVariableOp@assignvariableop_29_adam_vae_decoder_conv2d_transpose_2_kernel_mIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_30AssignVariableOp>assignvariableop_30_adam_vae_decoder_conv2d_transpose_2_bias_mIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_31AssignVariableOp+assignvariableop_31_adam_embeddings_vqvae_vIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_32AssignVariableOp4assignvariableop_32_adam_vae_encoder_conv2d_kernel_vIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_33AssignVariableOp2assignvariableop_33_adam_vae_encoder_conv2d_bias_vIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_34AssignVariableOp6assignvariableop_34_adam_vae_encoder_conv2d_1_kernel_vIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_35AssignVariableOp4assignvariableop_35_adam_vae_encoder_conv2d_1_bias_vIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_36AssignVariableOp6assignvariableop_36_adam_vae_encoder_conv2d_2_kernel_vIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_37AssignVariableOp4assignvariableop_37_adam_vae_encoder_conv2d_2_bias_vIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_38AssignVariableOp>assignvariableop_38_adam_vae_decoder_conv2d_transpose_kernel_vIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_39AssignVariableOp<assignvariableop_39_adam_vae_decoder_conv2d_transpose_bias_vIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_40AssignVariableOp@assignvariableop_40_adam_vae_decoder_conv2d_transpose_1_kernel_vIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_41AssignVariableOp>assignvariableop_41_adam_vae_decoder_conv2d_transpose_1_bias_vIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_42AssignVariableOp@assignvariableop_42_adam_vae_decoder_conv2d_transpose_2_kernel_vIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_43AssignVariableOp>assignvariableop_43_adam_vae_decoder_conv2d_transpose_2_bias_vIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 �
Identity_44Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_45IdentityIdentity_44:output:0^NoOp_1*
T0*
_output_shapes
: �
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_45Identity_45:output:0*m
_input_shapes\
Z: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�
�
__inference_loss_fn_3_207419h
Nvae_decoder_conv2d_transpose_kernel_regularizer_square_readvariableop_resource: @
identity��Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp�
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpReadVariableOpNvae_decoder_conv2d_transpose_kernel_regularizer_square_readvariableop_resource*&
_output_shapes
: @*
dtype0�
6vae/decoder/conv2d_transpose/kernel/Regularizer/SquareSquareMvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
5vae/decoder/conv2d_transpose/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3vae/decoder/conv2d_transpose/kernel/Regularizer/SumSum:vae/decoder/conv2d_transpose/kernel/Regularizer/Square:y:0>vae/decoder/conv2d_transpose/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
3vae/decoder/conv2d_transpose/kernel/Regularizer/mulMul>vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0<vae/decoder/conv2d_transpose/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: u
IdentityIdentity7vae/decoder/conv2d_transpose/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOpF^vae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpEvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp
�
�
D__inference_conv2d_1_layer_call_and_return_conditional_losses_205865

inputs8
conv2d_readvariableop_resource: @-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
.vae/encoder/conv2d_1/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
-vae/encoder/conv2d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_1/kernel/Regularizer/SumSum2vae/encoder/conv2d_1/kernel/Regularizer/Square:y:06vae/encoder/conv2d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_1/kernel/Regularizer/mulMul6vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp>^vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������   : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2~
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������   
 
_user_specified_nameinputs
�
�
1__inference_conv2d_transpose_layer_call_fn_207529

inputs!
unknown: @
	unknown_0: 
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������   *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *U
fPRN
L__inference_conv2d_transpose_layer_call_and_return_conditional_losses_206356w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������   `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  @: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������  @
 
_user_specified_nameinputs
�
�
$__inference_vae_layer_call_fn_206827	
input!
unknown: 
	unknown_0: #
	unknown_1: @
	unknown_2:@#
	unknown_3:@@
	unknown_4:@
	unknown_5:	@�#
	unknown_6:@@
	unknown_7:@#
	unknown_8: @
	unknown_9: $

unknown_10: 

unknown_11:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:���������  : */
_read_only_resource_inputs
	
*8
config_proto(&

CPU

GPU2*0J

  `E8� *H
fCRA
?__inference_vae_layer_call_and_return_conditional_losses_206587w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:���������  : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
/
_output_shapes
:���������  

_user_specified_nameinput
��
�
?__inference_vae_layer_call_and_return_conditional_losses_206995	
inputG
-encoder_conv2d_conv2d_readvariableop_resource: <
.encoder_conv2d_biasadd_readvariableop_resource: I
/encoder_conv2d_1_conv2d_readvariableop_resource: @>
0encoder_conv2d_1_biasadd_readvariableop_resource:@I
/encoder_conv2d_2_conv2d_readvariableop_resource:@@>
0encoder_conv2d_2_biasadd_readvariableop_resource:@B
/vector_quantizer_matmul_readvariableop_resource:	@�]
Cdecoder_conv2d_transpose_1_conv2d_transpose_readvariableop_resource:@@H
:decoder_conv2d_transpose_1_biasadd_readvariableop_resource:@[
Adecoder_conv2d_transpose_conv2d_transpose_readvariableop_resource: @F
8decoder_conv2d_transpose_biasadd_readvariableop_resource: ]
Cdecoder_conv2d_transpose_2_conv2d_transpose_readvariableop_resource: H
:decoder_conv2d_transpose_2_biasadd_readvariableop_resource:
identity

identity_1��/decoder/conv2d_transpose/BiasAdd/ReadVariableOp�8decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp�1decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp�:decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp�1decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp�:decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp�%encoder/conv2d/BiasAdd/ReadVariableOp�$encoder/conv2d/Conv2D/ReadVariableOp�'encoder/conv2d_1/BiasAdd/ReadVariableOp�&encoder/conv2d_1/Conv2D/ReadVariableOp�'encoder/conv2d_2/BiasAdd/ReadVariableOp�&encoder/conv2d_2/Conv2D/ReadVariableOp�Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp�Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp�Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp�;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp�=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp�=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp�&vector_quantizer/MatMul/ReadVariableOp�(vector_quantizer/MatMul_1/ReadVariableOp�vector_quantizer/ReadVariableOp�
$encoder/conv2d/Conv2D/ReadVariableOpReadVariableOp-encoder_conv2d_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
encoder/conv2d/Conv2DConv2Dinput,encoder/conv2d/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
�
%encoder/conv2d/BiasAdd/ReadVariableOpReadVariableOp.encoder_conv2d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
encoder/conv2d/BiasAddBiasAddencoder/conv2d/Conv2D:output:0-encoder/conv2d/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   v
encoder/conv2d/ReluReluencoder/conv2d/BiasAdd:output:0*
T0*/
_output_shapes
:���������   �
&encoder/conv2d_1/Conv2D/ReadVariableOpReadVariableOp/encoder_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
encoder/conv2d_1/Conv2DConv2D!encoder/conv2d/Relu:activations:0.encoder/conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
'encoder/conv2d_1/BiasAdd/ReadVariableOpReadVariableOp0encoder_conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
encoder/conv2d_1/BiasAddBiasAdd encoder/conv2d_1/Conv2D:output:0/encoder/conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @z
encoder/conv2d_1/ReluRelu!encoder/conv2d_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
&encoder/conv2d_2/Conv2D/ReadVariableOpReadVariableOp/encoder_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
encoder/conv2d_2/Conv2DConv2D#encoder/conv2d_1/Relu:activations:0.encoder/conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
'encoder/conv2d_2/BiasAdd/ReadVariableOpReadVariableOp0encoder_conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
encoder/conv2d_2/BiasAddBiasAdd encoder/conv2d_2/Conv2D:output:0/encoder/conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @z
encoder/conv2d_2/ReluRelu!encoder/conv2d_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @i
vector_quantizer/ShapeShape#encoder/conv2d_2/Relu:activations:0*
T0*
_output_shapes
:o
vector_quantizer/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   �
vector_quantizer/ReshapeReshape#encoder/conv2d_2/Relu:activations:0'vector_quantizer/Reshape/shape:output:0*
T0*'
_output_shapes
:���������@�
&vector_quantizer/MatMul/ReadVariableOpReadVariableOp/vector_quantizer_matmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
vector_quantizer/MatMulMatMul!vector_quantizer/Reshape:output:0.vector_quantizer/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������[
vector_quantizer/pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vector_quantizer/powPow!vector_quantizer/Reshape:output:0vector_quantizer/pow/y:output:0*
T0*'
_output_shapes
:���������@h
&vector_quantizer/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :�
vector_quantizer/SumSumvector_quantizer/pow:z:0/vector_quantizer/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(�
vector_quantizer/ReadVariableOpReadVariableOp/vector_quantizer_matmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0]
vector_quantizer/pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vector_quantizer/pow_1Pow'vector_quantizer/ReadVariableOp:value:0!vector_quantizer/pow_1/y:output:0*
T0*
_output_shapes
:	@�j
(vector_quantizer/Sum_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B : �
vector_quantizer/Sum_1Sumvector_quantizer/pow_1:z:01vector_quantizer/Sum_1/reduction_indices:output:0*
T0*
_output_shapes	
:��
vector_quantizer/addAddV2vector_quantizer/Sum:output:0vector_quantizer/Sum_1:output:0*
T0*(
_output_shapes
:����������[
vector_quantizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vector_quantizer/mulMulvector_quantizer/mul/x:output:0!vector_quantizer/MatMul:product:0*
T0*(
_output_shapes
:�����������
vector_quantizer/subSubvector_quantizer/add:z:0vector_quantizer/mul:z:0*
T0*(
_output_shapes
:����������c
!vector_quantizer/ArgMin/dimensionConst*
_output_shapes
: *
dtype0*
value	B :�
vector_quantizer/ArgMinArgMinvector_quantizer/sub:z:0*vector_quantizer/ArgMin/dimension:output:0*
T0*#
_output_shapes
:���������f
!vector_quantizer/one_hot/on_valueConst*
_output_shapes
: *
dtype0*
valueB
 *  �?g
"vector_quantizer/one_hot/off_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    a
vector_quantizer/one_hot/depthConst*
_output_shapes
: *
dtype0*
value
B :��
vector_quantizer/one_hotOneHot vector_quantizer/ArgMin:output:0'vector_quantizer/one_hot/depth:output:0*vector_quantizer/one_hot/on_value:output:0+vector_quantizer/one_hot/off_value:output:0*
T0*(
_output_shapes
:�����������
(vector_quantizer/MatMul_1/ReadVariableOpReadVariableOp/vector_quantizer_matmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
vector_quantizer/MatMul_1MatMul!vector_quantizer/one_hot:output:00vector_quantizer/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@*
transpose_b(�
vector_quantizer/Reshape_1Reshape#vector_quantizer/MatMul_1:product:0vector_quantizer/Shape:output:0*
T0*/
_output_shapes
:���������  @�
vector_quantizer/StopGradientStopGradient#vector_quantizer/Reshape_1:output:0*
T0*/
_output_shapes
:���������  @�
vector_quantizer/sub_1Sub&vector_quantizer/StopGradient:output:0#encoder/conv2d_2/Relu:activations:0*
T0*/
_output_shapes
:���������  @]
vector_quantizer/pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vector_quantizer/pow_2Powvector_quantizer/sub_1:z:0!vector_quantizer/pow_2/y:output:0*
T0*/
_output_shapes
:���������  @o
vector_quantizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             {
vector_quantizer/MeanMeanvector_quantizer/pow_2:z:0vector_quantizer/Const:output:0*
T0*
_output_shapes
: ]
vector_quantizer/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �>�
vector_quantizer/mul_1Mul!vector_quantizer/mul_1/x:output:0vector_quantizer/Mean:output:0*
T0*
_output_shapes
: �
vector_quantizer/StopGradient_1StopGradient#encoder/conv2d_2/Relu:activations:0*
T0*/
_output_shapes
:���������  @�
vector_quantizer/sub_2Sub#vector_quantizer/Reshape_1:output:0(vector_quantizer/StopGradient_1:output:0*
T0*/
_output_shapes
:���������  @]
vector_quantizer/pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vector_quantizer/pow_3Powvector_quantizer/sub_2:z:0!vector_quantizer/pow_3/y:output:0*
T0*/
_output_shapes
:���������  @q
vector_quantizer/Const_1Const*
_output_shapes
:*
dtype0*%
valueB"             
vector_quantizer/Mean_1Meanvector_quantizer/pow_3:z:0!vector_quantizer/Const_1:output:0*
T0*
_output_shapes
: ~
vector_quantizer/add_1AddV2vector_quantizer/mul_1:z:0 vector_quantizer/Mean_1:output:0*
T0*
_output_shapes
: �
vector_quantizer/sub_3Sub#vector_quantizer/Reshape_1:output:0#encoder/conv2d_2/Relu:activations:0*
T0*/
_output_shapes
:���������  @�
vector_quantizer/StopGradient_2StopGradientvector_quantizer/sub_3:z:0*
T0*/
_output_shapes
:���������  @�
vector_quantizer/add_2AddV2#encoder/conv2d_2/Relu:activations:0(vector_quantizer/StopGradient_2:output:0*
T0*/
_output_shapes
:���������  @j
 decoder/conv2d_transpose_1/ShapeShapevector_quantizer/add_2:z:0*
T0*
_output_shapes
:x
.decoder/conv2d_transpose_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: z
0decoder/conv2d_transpose_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0decoder/conv2d_transpose_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(decoder/conv2d_transpose_1/strided_sliceStridedSlice)decoder/conv2d_transpose_1/Shape:output:07decoder/conv2d_transpose_1/strided_slice/stack:output:09decoder/conv2d_transpose_1/strided_slice/stack_1:output:09decoder/conv2d_transpose_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskd
"decoder/conv2d_transpose_1/stack/1Const*
_output_shapes
: *
dtype0*
value	B : d
"decoder/conv2d_transpose_1/stack/2Const*
_output_shapes
: *
dtype0*
value	B : d
"decoder/conv2d_transpose_1/stack/3Const*
_output_shapes
: *
dtype0*
value	B :@�
 decoder/conv2d_transpose_1/stackPack1decoder/conv2d_transpose_1/strided_slice:output:0+decoder/conv2d_transpose_1/stack/1:output:0+decoder/conv2d_transpose_1/stack/2:output:0+decoder/conv2d_transpose_1/stack/3:output:0*
N*
T0*
_output_shapes
:z
0decoder/conv2d_transpose_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2decoder/conv2d_transpose_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2decoder/conv2d_transpose_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
*decoder/conv2d_transpose_1/strided_slice_1StridedSlice)decoder/conv2d_transpose_1/stack:output:09decoder/conv2d_transpose_1/strided_slice_1/stack:output:0;decoder/conv2d_transpose_1/strided_slice_1/stack_1:output:0;decoder/conv2d_transpose_1/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
:decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOpReadVariableOpCdecoder_conv2d_transpose_1_conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
+decoder/conv2d_transpose_1/conv2d_transposeConv2DBackpropInput)decoder/conv2d_transpose_1/stack:output:0Bdecoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp:value:0vector_quantizer/add_2:z:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
1decoder/conv2d_transpose_1/BiasAdd/ReadVariableOpReadVariableOp:decoder_conv2d_transpose_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
"decoder/conv2d_transpose_1/BiasAddBiasAdd4decoder/conv2d_transpose_1/conv2d_transpose:output:09decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @�
decoder/conv2d_transpose_1/ReluRelu+decoder/conv2d_transpose_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @{
decoder/conv2d_transpose/ShapeShape-decoder/conv2d_transpose_1/Relu:activations:0*
T0*
_output_shapes
:v
,decoder/conv2d_transpose/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: x
.decoder/conv2d_transpose/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:x
.decoder/conv2d_transpose/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
&decoder/conv2d_transpose/strided_sliceStridedSlice'decoder/conv2d_transpose/Shape:output:05decoder/conv2d_transpose/strided_slice/stack:output:07decoder/conv2d_transpose/strided_slice/stack_1:output:07decoder/conv2d_transpose/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskb
 decoder/conv2d_transpose/stack/1Const*
_output_shapes
: *
dtype0*
value	B : b
 decoder/conv2d_transpose/stack/2Const*
_output_shapes
: *
dtype0*
value	B : b
 decoder/conv2d_transpose/stack/3Const*
_output_shapes
: *
dtype0*
value	B : �
decoder/conv2d_transpose/stackPack/decoder/conv2d_transpose/strided_slice:output:0)decoder/conv2d_transpose/stack/1:output:0)decoder/conv2d_transpose/stack/2:output:0)decoder/conv2d_transpose/stack/3:output:0*
N*
T0*
_output_shapes
:x
.decoder/conv2d_transpose/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: z
0decoder/conv2d_transpose/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0decoder/conv2d_transpose/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(decoder/conv2d_transpose/strided_slice_1StridedSlice'decoder/conv2d_transpose/stack:output:07decoder/conv2d_transpose/strided_slice_1/stack:output:09decoder/conv2d_transpose/strided_slice_1/stack_1:output:09decoder/conv2d_transpose/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
8decoder/conv2d_transpose/conv2d_transpose/ReadVariableOpReadVariableOpAdecoder_conv2d_transpose_conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
)decoder/conv2d_transpose/conv2d_transposeConv2DBackpropInput'decoder/conv2d_transpose/stack:output:0@decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp:value:0-decoder/conv2d_transpose_1/Relu:activations:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
�
/decoder/conv2d_transpose/BiasAdd/ReadVariableOpReadVariableOp8decoder_conv2d_transpose_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
 decoder/conv2d_transpose/BiasAddBiasAdd2decoder/conv2d_transpose/conv2d_transpose:output:07decoder/conv2d_transpose/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   �
decoder/conv2d_transpose/ReluRelu)decoder/conv2d_transpose/BiasAdd:output:0*
T0*/
_output_shapes
:���������   {
 decoder/conv2d_transpose_2/ShapeShape+decoder/conv2d_transpose/Relu:activations:0*
T0*
_output_shapes
:x
.decoder/conv2d_transpose_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: z
0decoder/conv2d_transpose_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0decoder/conv2d_transpose_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(decoder/conv2d_transpose_2/strided_sliceStridedSlice)decoder/conv2d_transpose_2/Shape:output:07decoder/conv2d_transpose_2/strided_slice/stack:output:09decoder/conv2d_transpose_2/strided_slice/stack_1:output:09decoder/conv2d_transpose_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskd
"decoder/conv2d_transpose_2/stack/1Const*
_output_shapes
: *
dtype0*
value	B : d
"decoder/conv2d_transpose_2/stack/2Const*
_output_shapes
: *
dtype0*
value	B : d
"decoder/conv2d_transpose_2/stack/3Const*
_output_shapes
: *
dtype0*
value	B :�
 decoder/conv2d_transpose_2/stackPack1decoder/conv2d_transpose_2/strided_slice:output:0+decoder/conv2d_transpose_2/stack/1:output:0+decoder/conv2d_transpose_2/stack/2:output:0+decoder/conv2d_transpose_2/stack/3:output:0*
N*
T0*
_output_shapes
:z
0decoder/conv2d_transpose_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2decoder/conv2d_transpose_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2decoder/conv2d_transpose_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
*decoder/conv2d_transpose_2/strided_slice_1StridedSlice)decoder/conv2d_transpose_2/stack:output:09decoder/conv2d_transpose_2/strided_slice_1/stack:output:0;decoder/conv2d_transpose_2/strided_slice_1/stack_1:output:0;decoder/conv2d_transpose_2/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
:decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOpReadVariableOpCdecoder_conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
+decoder/conv2d_transpose_2/conv2d_transposeConv2DBackpropInput)decoder/conv2d_transpose_2/stack:output:0Bdecoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp:value:0+decoder/conv2d_transpose/Relu:activations:0*
T0*/
_output_shapes
:���������  *
paddingSAME*
strides
�
1decoder/conv2d_transpose_2/BiasAdd/ReadVariableOpReadVariableOp:decoder_conv2d_transpose_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"decoder/conv2d_transpose_2/BiasAddBiasAdd4decoder/conv2d_transpose_2/conv2d_transpose:output:09decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  �
"decoder/conv2d_transpose_2/SigmoidSigmoid+decoder/conv2d_transpose_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������  �
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOpReadVariableOp-encoder_conv2d_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
,vae/encoder/conv2d/kernel/Regularizer/SquareSquareCvae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
+vae/encoder/conv2d/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
)vae/encoder/conv2d/kernel/Regularizer/SumSum0vae/encoder/conv2d/kernel/Regularizer/Square:y:04vae/encoder/conv2d/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: p
+vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
)vae/encoder/conv2d/kernel/Regularizer/mulMul4vae/encoder/conv2d/kernel/Regularizer/mul/x:output:02vae/encoder/conv2d/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp/encoder_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
.vae/encoder/conv2d_1/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
-vae/encoder/conv2d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_1/kernel/Regularizer/SumSum2vae/encoder/conv2d_1/kernel/Regularizer/Square:y:06vae/encoder/conv2d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_1/kernel/Regularizer/mulMul6vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp/encoder_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
.vae/encoder/conv2d_2/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
-vae/encoder/conv2d_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_2/kernel/Regularizer/SumSum2vae/encoder/conv2d_2/kernel/Regularizer/Square:y:06vae/encoder/conv2d_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_2/kernel/Regularizer/mulMul6vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpReadVariableOpAdecoder_conv2d_transpose_conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
6vae/decoder/conv2d_transpose/kernel/Regularizer/SquareSquareMvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
5vae/decoder/conv2d_transpose/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3vae/decoder/conv2d_transpose/kernel/Regularizer/SumSum:vae/decoder/conv2d_transpose/kernel/Regularizer/Square:y:0>vae/decoder/conv2d_transpose/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
3vae/decoder/conv2d_transpose/kernel/Regularizer/mulMul>vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0<vae/decoder/conv2d_transpose/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpCdecoder_conv2d_transpose_1_conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
8vae/decoder/conv2d_transpose_1/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpCdecoder_conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
8vae/decoder/conv2d_transpose_2/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: }
IdentityIdentity&decoder/conv2d_transpose_2/Sigmoid:y:0^NoOp*
T0*/
_output_shapes
:���������  Z

Identity_1Identityvector_quantizer/add_1:z:0^NoOp*
T0*
_output_shapes
: �	
NoOpNoOp0^decoder/conv2d_transpose/BiasAdd/ReadVariableOp9^decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp2^decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp;^decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp2^decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp;^decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp&^encoder/conv2d/BiasAdd/ReadVariableOp%^encoder/conv2d/Conv2D/ReadVariableOp(^encoder/conv2d_1/BiasAdd/ReadVariableOp'^encoder/conv2d_1/Conv2D/ReadVariableOp(^encoder/conv2d_2/BiasAdd/ReadVariableOp'^encoder/conv2d_2/Conv2D/ReadVariableOpF^vae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpH^vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpH^vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp<^vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp>^vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp>^vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp'^vector_quantizer/MatMul/ReadVariableOp)^vector_quantizer/MatMul_1/ReadVariableOp ^vector_quantizer/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:���������  : : : : : : : : : : : : : 2b
/decoder/conv2d_transpose/BiasAdd/ReadVariableOp/decoder/conv2d_transpose/BiasAdd/ReadVariableOp2t
8decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp8decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp2f
1decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp1decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp2x
:decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp:decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp2f
1decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp1decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp2x
:decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp:decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp2N
%encoder/conv2d/BiasAdd/ReadVariableOp%encoder/conv2d/BiasAdd/ReadVariableOp2L
$encoder/conv2d/Conv2D/ReadVariableOp$encoder/conv2d/Conv2D/ReadVariableOp2R
'encoder/conv2d_1/BiasAdd/ReadVariableOp'encoder/conv2d_1/BiasAdd/ReadVariableOp2P
&encoder/conv2d_1/Conv2D/ReadVariableOp&encoder/conv2d_1/Conv2D/ReadVariableOp2R
'encoder/conv2d_2/BiasAdd/ReadVariableOp'encoder/conv2d_2/BiasAdd/ReadVariableOp2P
&encoder/conv2d_2/Conv2D/ReadVariableOp&encoder/conv2d_2/Conv2D/ReadVariableOp2�
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpEvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp2z
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp2~
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp2~
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp2P
&vector_quantizer/MatMul/ReadVariableOp&vector_quantizer/MatMul/ReadVariableOp2T
(vector_quantizer/MatMul_1/ReadVariableOp(vector_quantizer/MatMul_1/ReadVariableOp2B
vector_quantizer/ReadVariableOpvector_quantizer/ReadVariableOp:V R
/
_output_shapes
:���������  

_user_specified_nameinput
�"
�
N__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_207693

inputsB
(conv2d_transpose_readvariableop_resource:@@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskI
stack/1Const*
_output_shapes
: *
dtype0*
value	B : I
stack/2Const*
_output_shapes
: *
dtype0*
value	B : I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :@�
stackPackstrided_slice:output:0stack/1:output:0stack/2:output:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSlicestack:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
8vae/decoder/conv2d_transpose_1/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpH^vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������  @
 
_user_specified_nameinputs
�
�
D__inference_conv2d_2_layer_call_and_return_conditional_losses_205888

inputs8
conv2d_readvariableop_resource:@@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
.vae/encoder/conv2d_2/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
-vae/encoder/conv2d_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_2/kernel/Regularizer/SumSum2vae/encoder/conv2d_2/kernel/Regularizer/Square:y:06vae/encoder/conv2d_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_2/kernel/Regularizer/mulMul6vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp>^vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2~
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������  @
 
_user_specified_nameinputs
�/
�
C__inference_encoder_layer_call_and_return_conditional_losses_206012
input_1'
conv2d_205978: 
conv2d_205980: )
conv2d_1_205983: @
conv2d_1_205985:@)
conv2d_2_205988:@@
conv2d_2_205990:@
identity��conv2d/StatefulPartitionedCall� conv2d_1/StatefulPartitionedCall� conv2d_2/StatefulPartitionedCall�;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp�=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp�=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp�
conv2d/StatefulPartitionedCallStatefulPartitionedCallinput_1conv2d_205978conv2d_205980*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������   *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *K
fFRD
B__inference_conv2d_layer_call_and_return_conditional_losses_205842�
 conv2d_1/StatefulPartitionedCallStatefulPartitionedCall'conv2d/StatefulPartitionedCall:output:0conv2d_1_205983conv2d_1_205985*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *M
fHRF
D__inference_conv2d_1_layer_call_and_return_conditional_losses_205865�
 conv2d_2/StatefulPartitionedCallStatefulPartitionedCall)conv2d_1/StatefulPartitionedCall:output:0conv2d_2_205988conv2d_2_205990*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *M
fHRF
D__inference_conv2d_2_layer_call_and_return_conditional_losses_205888�
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_205978*&
_output_shapes
: *
dtype0�
,vae/encoder/conv2d/kernel/Regularizer/SquareSquareCvae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
+vae/encoder/conv2d/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
)vae/encoder/conv2d/kernel/Regularizer/SumSum0vae/encoder/conv2d/kernel/Regularizer/Square:y:04vae/encoder/conv2d/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: p
+vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
)vae/encoder/conv2d/kernel/Regularizer/mulMul4vae/encoder/conv2d/kernel/Regularizer/mul/x:output:02vae/encoder/conv2d/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_1_205983*&
_output_shapes
: @*
dtype0�
.vae/encoder/conv2d_1/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
-vae/encoder/conv2d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_1/kernel/Regularizer/SumSum2vae/encoder/conv2d_1/kernel/Regularizer/Square:y:06vae/encoder/conv2d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_1/kernel/Regularizer/mulMul6vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_2_205988*&
_output_shapes
:@@*
dtype0�
.vae/encoder/conv2d_2/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
-vae/encoder/conv2d_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_2/kernel/Regularizer/SumSum2vae/encoder/conv2d_2/kernel/Regularizer/Square:y:06vae/encoder/conv2d_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_2/kernel/Regularizer/mulMul6vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
IdentityIdentity)conv2d_2/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^conv2d/StatefulPartitionedCall!^conv2d_1/StatefulPartitionedCall!^conv2d_2/StatefulPartitionedCall<^vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp>^vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp>^vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  : : : : : : 2@
conv2d/StatefulPartitionedCallconv2d/StatefulPartitionedCall2D
 conv2d_1/StatefulPartitionedCall conv2d_1/StatefulPartitionedCall2D
 conv2d_2/StatefulPartitionedCall conv2d_2/StatefulPartitionedCall2z
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp2~
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp2~
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp:X T
/
_output_shapes
:���������  
!
_user_specified_name	input_1
�)
�
L__inference_vector_quantizer_layer_call_and_return_conditional_losses_206132
input_11
matmul_readvariableop_resource:	@�
identity

identity_1��MatMul/ReadVariableOp�MatMul_1/ReadVariableOp�ReadVariableOp<
ShapeShapeinput_1*
T0*
_output_shapes
:^
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   e
ReshapeReshapeinput_1Reshape/shape:output:0*
T0*'
_output_shapes
:���������@u
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0t
MatMulMatMulReshape:output:0MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������J
pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @^
powPowReshape:output:0pow/y:output:0*
T0*'
_output_shapes
:���������@W
Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :v
SumSumpow:z:0Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(n
ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0L
pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @`
pow_1PowReadVariableOp:value:0pow_1/y:output:0*
T0*
_output_shapes
:	@�Y
Sum_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B : _
Sum_1Sum	pow_1:z:0 Sum_1/reduction_indices:output:0*
T0*
_output_shapes	
:�]
addAddV2Sum:output:0Sum_1:output:0*
T0*(
_output_shapes
:����������J
mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @_
mulMulmul/x:output:0MatMul:product:0*
T0*(
_output_shapes
:����������O
subSubadd:z:0mul:z:0*
T0*(
_output_shapes
:����������R
ArgMin/dimensionConst*
_output_shapes
: *
dtype0*
value	B :b
ArgMinArgMinsub:z:0ArgMin/dimension:output:0*
T0*#
_output_shapes
:���������U
one_hot/on_valueConst*
_output_shapes
: *
dtype0*
valueB
 *  �?V
one_hot/off_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    P
one_hot/depthConst*
_output_shapes
: *
dtype0*
value
B :��
one_hotOneHotArgMin:output:0one_hot/depth:output:0one_hot/on_value:output:0one_hot/off_value:output:0*
T0*(
_output_shapes
:����������w
MatMul_1/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
MatMul_1MatMulone_hot:output:0MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@*
transpose_b(r
	Reshape_1ReshapeMatMul_1:product:0Shape:output:0*
T0*/
_output_shapes
:���������  @j
StopGradientStopGradientReshape_1:output:0*
T0*/
_output_shapes
:���������  @f
sub_1SubStopGradient:output:0input_1*
T0*/
_output_shapes
:���������  @L
pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @c
pow_2Pow	sub_1:z:0pow_2/y:output:0*
T0*/
_output_shapes
:���������  @^
ConstConst*
_output_shapes
:*
dtype0*%
valueB"             H
MeanMean	pow_2:z:0Const:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �>N
mul_1Mulmul_1/x:output:0Mean:output:0*
T0*
_output_shapes
: a
StopGradient_1StopGradientinput_1*
T0*/
_output_shapes
:���������  @s
sub_2SubReshape_1:output:0StopGradient_1:output:0*
T0*/
_output_shapes
:���������  @L
pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @c
pow_3Pow	sub_2:z:0pow_3/y:output:0*
T0*/
_output_shapes
:���������  @`
Const_1Const*
_output_shapes
:*
dtype0*%
valueB"             L
Mean_1Mean	pow_3:z:0Const_1:output:0*
T0*
_output_shapes
: K
add_1AddV2	mul_1:z:0Mean_1:output:0*
T0*
_output_shapes
: c
sub_3SubReshape_1:output:0input_1*
T0*/
_output_shapes
:���������  @c
StopGradient_2StopGradient	sub_3:z:0*
T0*/
_output_shapes
:���������  @j
add_2AddV2input_1StopGradient_2:output:0*
T0*/
_output_shapes
:���������  @`
IdentityIdentity	add_2:z:0^NoOp*
T0*/
_output_shapes
:���������  @I

Identity_1Identity	add_1:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������  @: 2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp2 
ReadVariableOpReadVariableOp:X T
/
_output_shapes
:���������  @
!
_user_specified_name	input_1
�
�
$__inference_signature_wrapper_206795
input_1!
unknown: 
	unknown_0: #
	unknown_1: @
	unknown_2:@#
	unknown_3:@@
	unknown_4:@
	unknown_5:	@�#
	unknown_6:@@
	unknown_7:@#
	unknown_8: @
	unknown_9: $

unknown_10: 

unknown_11:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  */
_read_only_resource_inputs
	
*8
config_proto(&

CPU

GPU2*0J

  `E8� **
f%R#
!__inference__wrapped_model_205818w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:���������  : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:���������  
!
_user_specified_name	input_1
�T
�
?__inference_vae_layer_call_and_return_conditional_losses_206587	
input(
encoder_206519: 
encoder_206521: (
encoder_206523: @
encoder_206525:@(
encoder_206527:@@
encoder_206529:@*
vector_quantizer_206532:	@�(
decoder_206536:@@
decoder_206538:@(
decoder_206540: @
decoder_206542: (
decoder_206544: 
decoder_206546:
identity

identity_1��decoder/StatefulPartitionedCall�encoder/StatefulPartitionedCall�Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp�Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp�Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp�;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp�=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp�=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp�(vector_quantizer/StatefulPartitionedCall�
encoder/StatefulPartitionedCallStatefulPartitionedCallinputencoder_206519encoder_206521encoder_206523encoder_206525encoder_206527encoder_206529*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

  `E8� *L
fGRE
C__inference_encoder_layer_call_and_return_conditional_losses_205913�
(vector_quantizer/StatefulPartitionedCallStatefulPartitionedCall(encoder/StatefulPartitionedCall:output:0vector_quantizer_206532*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:���������  @: *#
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *U
fPRN
L__inference_vector_quantizer_layer_call_and_return_conditional_losses_206067�
decoder/StatefulPartitionedCallStatefulPartitionedCall1vector_quantizer/StatefulPartitionedCall:output:0decoder_206536decoder_206538decoder_206540decoder_206542decoder_206544decoder_206546*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  *(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

  `E8� *L
fGRE
C__inference_decoder_layer_call_and_return_conditional_losses_206416�
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOpReadVariableOpencoder_206519*&
_output_shapes
: *
dtype0�
,vae/encoder/conv2d/kernel/Regularizer/SquareSquareCvae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
+vae/encoder/conv2d/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
)vae/encoder/conv2d/kernel/Regularizer/SumSum0vae/encoder/conv2d/kernel/Regularizer/Square:y:04vae/encoder/conv2d/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: p
+vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
)vae/encoder/conv2d/kernel/Regularizer/mulMul4vae/encoder/conv2d/kernel/Regularizer/mul/x:output:02vae/encoder/conv2d/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpencoder_206523*&
_output_shapes
: @*
dtype0�
.vae/encoder/conv2d_1/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
-vae/encoder/conv2d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_1/kernel/Regularizer/SumSum2vae/encoder/conv2d_1/kernel/Regularizer/Square:y:06vae/encoder/conv2d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_1/kernel/Regularizer/mulMul6vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpencoder_206527*&
_output_shapes
:@@*
dtype0�
.vae/encoder/conv2d_2/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
-vae/encoder/conv2d_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_2/kernel/Regularizer/SumSum2vae/encoder/conv2d_2/kernel/Regularizer/Square:y:06vae/encoder/conv2d_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_2/kernel/Regularizer/mulMul6vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdecoder_206540*&
_output_shapes
: @*
dtype0�
6vae/decoder/conv2d_transpose/kernel/Regularizer/SquareSquareMvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
5vae/decoder/conv2d_transpose/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3vae/decoder/conv2d_transpose/kernel/Regularizer/SumSum:vae/decoder/conv2d_transpose/kernel/Regularizer/Square:y:0>vae/decoder/conv2d_transpose/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
3vae/decoder/conv2d_transpose/kernel/Regularizer/mulMul>vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0<vae/decoder/conv2d_transpose/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdecoder_206536*&
_output_shapes
:@@*
dtype0�
8vae/decoder/conv2d_transpose_1/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdecoder_206544*&
_output_shapes
: *
dtype0�
8vae/decoder/conv2d_transpose_2/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 
IdentityIdentity(decoder/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  q

Identity_1Identity1vector_quantizer/StatefulPartitionedCall:output:1^NoOp*
T0*
_output_shapes
: �
NoOpNoOp ^decoder/StatefulPartitionedCall ^encoder/StatefulPartitionedCallF^vae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpH^vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpH^vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp<^vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp>^vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp>^vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp)^vector_quantizer/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:���������  : : : : : : : : : : : : : 2B
decoder/StatefulPartitionedCalldecoder/StatefulPartitionedCall2B
encoder/StatefulPartitionedCallencoder/StatefulPartitionedCall2�
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpEvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp2z
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp2~
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp2~
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp2T
(vector_quantizer/StatefulPartitionedCall(vector_quantizer/StatefulPartitionedCall:V R
/
_output_shapes
:���������  

_user_specified_nameinput
�
�
3__inference_conv2d_transpose_2_layer_call_fn_207329

inputs!
unknown: 
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *W
fRRP
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_206278�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+��������������������������� : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+��������������������������� 
 
_user_specified_nameinputs
�	
�
(__inference_decoder_layer_call_fn_206431
input_1!
unknown:@@
	unknown_0:@#
	unknown_1: @
	unknown_2: #
	unknown_3: 
	unknown_4:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  *(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

  `E8� *L
fGRE
C__inference_decoder_layer_call_and_return_conditional_losses_206416w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  @: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:���������  @
!
_user_specified_name	input_1
�
�
'__inference_conv2d_layer_call_fn_207456

inputs!
unknown: 
	unknown_0: 
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������   *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *K
fFRD
B__inference_conv2d_layer_call_and_return_conditional_losses_205842w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������   `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������  
 
_user_specified_nameinputs
�,
�
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_207378

inputsB
(conv2d_transpose_readvariableop_resource: -
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+���������������������������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������p
SigmoidSigmoidBiasAdd:output:0*
T0*A
_output_shapes/
-:+����������������������������
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
8vae/decoder/conv2d_transpose_2/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: t
IdentityIdentitySigmoid:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpH^vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+��������������������������� : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:i e
A
_output_shapes/
-:+��������������������������� 
 
_user_specified_nameinputs
�
�
D__inference_conv2d_2_layer_call_and_return_conditional_losses_207281

inputs8
conv2d_readvariableop_resource:@@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
.vae/encoder/conv2d_2/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
-vae/encoder/conv2d_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_2/kernel/Regularizer/SumSum2vae/encoder/conv2d_2/kernel/Regularizer/Square:y:06vae/encoder/conv2d_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_2/kernel/Regularizer/mulMul6vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp>^vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2~
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������  @
 
_user_specified_nameinputs
�
�
__inference_loss_fn_5_207441j
Pvae_decoder_conv2d_transpose_2_kernel_regularizer_square_readvariableop_resource: 
identity��Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp�
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpPvae_decoder_conv2d_transpose_2_kernel_regularizer_square_readvariableop_resource*&
_output_shapes
: *
dtype0�
8vae/decoder/conv2d_transpose_2/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: w
IdentityIdentity9vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOpH^vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp
�T
�
?__inference_vae_layer_call_and_return_conditional_losses_206720
input_1(
encoder_206652: 
encoder_206654: (
encoder_206656: @
encoder_206658:@(
encoder_206660:@@
encoder_206662:@*
vector_quantizer_206665:	@�(
decoder_206669:@@
decoder_206671:@(
decoder_206673: @
decoder_206675: (
decoder_206677: 
decoder_206679:
identity

identity_1��decoder/StatefulPartitionedCall�encoder/StatefulPartitionedCall�Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp�Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp�Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp�;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp�=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp�=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp�(vector_quantizer/StatefulPartitionedCall�
encoder/StatefulPartitionedCallStatefulPartitionedCallinput_1encoder_206652encoder_206654encoder_206656encoder_206658encoder_206660encoder_206662*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

  `E8� *L
fGRE
C__inference_encoder_layer_call_and_return_conditional_losses_205913�
(vector_quantizer/StatefulPartitionedCallStatefulPartitionedCall(encoder/StatefulPartitionedCall:output:0vector_quantizer_206665*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:���������  @: *#
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *U
fPRN
L__inference_vector_quantizer_layer_call_and_return_conditional_losses_206067�
decoder/StatefulPartitionedCallStatefulPartitionedCall1vector_quantizer/StatefulPartitionedCall:output:0decoder_206669decoder_206671decoder_206673decoder_206675decoder_206677decoder_206679*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  *(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

  `E8� *L
fGRE
C__inference_decoder_layer_call_and_return_conditional_losses_206416�
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOpReadVariableOpencoder_206652*&
_output_shapes
: *
dtype0�
,vae/encoder/conv2d/kernel/Regularizer/SquareSquareCvae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
+vae/encoder/conv2d/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
)vae/encoder/conv2d/kernel/Regularizer/SumSum0vae/encoder/conv2d/kernel/Regularizer/Square:y:04vae/encoder/conv2d/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: p
+vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
)vae/encoder/conv2d/kernel/Regularizer/mulMul4vae/encoder/conv2d/kernel/Regularizer/mul/x:output:02vae/encoder/conv2d/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpencoder_206656*&
_output_shapes
: @*
dtype0�
.vae/encoder/conv2d_1/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
-vae/encoder/conv2d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_1/kernel/Regularizer/SumSum2vae/encoder/conv2d_1/kernel/Regularizer/Square:y:06vae/encoder/conv2d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_1/kernel/Regularizer/mulMul6vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpencoder_206660*&
_output_shapes
:@@*
dtype0�
.vae/encoder/conv2d_2/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
-vae/encoder/conv2d_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_2/kernel/Regularizer/SumSum2vae/encoder/conv2d_2/kernel/Regularizer/Square:y:06vae/encoder/conv2d_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_2/kernel/Regularizer/mulMul6vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdecoder_206673*&
_output_shapes
: @*
dtype0�
6vae/decoder/conv2d_transpose/kernel/Regularizer/SquareSquareMvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
5vae/decoder/conv2d_transpose/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3vae/decoder/conv2d_transpose/kernel/Regularizer/SumSum:vae/decoder/conv2d_transpose/kernel/Regularizer/Square:y:0>vae/decoder/conv2d_transpose/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
3vae/decoder/conv2d_transpose/kernel/Regularizer/mulMul>vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0<vae/decoder/conv2d_transpose/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdecoder_206669*&
_output_shapes
:@@*
dtype0�
8vae/decoder/conv2d_transpose_1/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdecoder_206677*&
_output_shapes
: *
dtype0�
8vae/decoder/conv2d_transpose_2/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 
IdentityIdentity(decoder/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  q

Identity_1Identity1vector_quantizer/StatefulPartitionedCall:output:1^NoOp*
T0*
_output_shapes
: �
NoOpNoOp ^decoder/StatefulPartitionedCall ^encoder/StatefulPartitionedCallF^vae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpH^vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpH^vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp<^vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp>^vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp>^vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp)^vector_quantizer/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:���������  : : : : : : : : : : : : : 2B
decoder/StatefulPartitionedCalldecoder/StatefulPartitionedCall2B
encoder/StatefulPartitionedCallencoder/StatefulPartitionedCall2�
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpEvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp2z
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp2~
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp2~
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp2T
(vector_quantizer/StatefulPartitionedCall(vector_quantizer/StatefulPartitionedCall:X T
/
_output_shapes
:���������  
!
_user_specified_name	input_1
�	
�
(__inference_decoder_layer_call_fn_207167	
input!
unknown:@@
	unknown_0:@#
	unknown_1: @
	unknown_2: #
	unknown_3: 
	unknown_4:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  *(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

  `E8� *L
fGRE
C__inference_decoder_layer_call_and_return_conditional_losses_206416w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  @: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
/
_output_shapes
:���������  @

_user_specified_nameinput
�"
�
N__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_206321

inputsB
(conv2d_transpose_readvariableop_resource:@@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskI
stack/1Const*
_output_shapes
: *
dtype0*
value	B : I
stack/2Const*
_output_shapes
: *
dtype0*
value	B : I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :@�
stackPackstrided_slice:output:0stack/1:output:0stack/2:output:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSlicestack:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
8vae/decoder/conv2d_transpose_1/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpH^vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������  @
 
_user_specified_nameinputs
�/
�
C__inference_encoder_layer_call_and_return_conditional_losses_205913	
input'
conv2d_205843: 
conv2d_205845: )
conv2d_1_205866: @
conv2d_1_205868:@)
conv2d_2_205889:@@
conv2d_2_205891:@
identity��conv2d/StatefulPartitionedCall� conv2d_1/StatefulPartitionedCall� conv2d_2/StatefulPartitionedCall�;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp�=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp�=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp�
conv2d/StatefulPartitionedCallStatefulPartitionedCallinputconv2d_205843conv2d_205845*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������   *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *K
fFRD
B__inference_conv2d_layer_call_and_return_conditional_losses_205842�
 conv2d_1/StatefulPartitionedCallStatefulPartitionedCall'conv2d/StatefulPartitionedCall:output:0conv2d_1_205866conv2d_1_205868*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *M
fHRF
D__inference_conv2d_1_layer_call_and_return_conditional_losses_205865�
 conv2d_2/StatefulPartitionedCallStatefulPartitionedCall)conv2d_1/StatefulPartitionedCall:output:0conv2d_2_205889conv2d_2_205891*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *M
fHRF
D__inference_conv2d_2_layer_call_and_return_conditional_losses_205888�
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_205843*&
_output_shapes
: *
dtype0�
,vae/encoder/conv2d/kernel/Regularizer/SquareSquareCvae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
+vae/encoder/conv2d/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
)vae/encoder/conv2d/kernel/Regularizer/SumSum0vae/encoder/conv2d/kernel/Regularizer/Square:y:04vae/encoder/conv2d/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: p
+vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
)vae/encoder/conv2d/kernel/Regularizer/mulMul4vae/encoder/conv2d/kernel/Regularizer/mul/x:output:02vae/encoder/conv2d/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_1_205866*&
_output_shapes
: @*
dtype0�
.vae/encoder/conv2d_1/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
-vae/encoder/conv2d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_1/kernel/Regularizer/SumSum2vae/encoder/conv2d_1/kernel/Regularizer/Square:y:06vae/encoder/conv2d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_1/kernel/Regularizer/mulMul6vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_2_205889*&
_output_shapes
:@@*
dtype0�
.vae/encoder/conv2d_2/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
-vae/encoder/conv2d_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_2/kernel/Regularizer/SumSum2vae/encoder/conv2d_2/kernel/Regularizer/Square:y:06vae/encoder/conv2d_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_2/kernel/Regularizer/mulMul6vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
IdentityIdentity)conv2d_2/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^conv2d/StatefulPartitionedCall!^conv2d_1/StatefulPartitionedCall!^conv2d_2/StatefulPartitionedCall<^vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp>^vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp>^vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  : : : : : : 2@
conv2d/StatefulPartitionedCallconv2d/StatefulPartitionedCall2D
 conv2d_1/StatefulPartitionedCall conv2d_1/StatefulPartitionedCall2D
 conv2d_2/StatefulPartitionedCall conv2d_2/StatefulPartitionedCall2z
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp2~
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp2~
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp:V R
/
_output_shapes
:���������  

_user_specified_nameinput
�
�
__inference_loss_fn_2_207314`
Fvae_encoder_conv2d_2_kernel_regularizer_square_readvariableop_resource:@@
identity��=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp�
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpFvae_encoder_conv2d_2_kernel_regularizer_square_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
.vae/encoder/conv2d_2/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
-vae/encoder/conv2d_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_2/kernel/Regularizer/SumSum2vae/encoder/conv2d_2/kernel/Regularizer/Square:y:06vae/encoder/conv2d_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_2/kernel/Regularizer/mulMul6vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: m
IdentityIdentity/vae/encoder/conv2d_2/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp>^vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2~
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp
�;
�
C__inference_encoder_layer_call_and_return_conditional_losses_207073	
input?
%conv2d_conv2d_readvariableop_resource: 4
&conv2d_biasadd_readvariableop_resource: A
'conv2d_1_conv2d_readvariableop_resource: @6
(conv2d_1_biasadd_readvariableop_resource:@A
'conv2d_2_conv2d_readvariableop_resource:@@6
(conv2d_2_biasadd_readvariableop_resource:@
identity��conv2d/BiasAdd/ReadVariableOp�conv2d/Conv2D/ReadVariableOp�conv2d_1/BiasAdd/ReadVariableOp�conv2d_1/Conv2D/ReadVariableOp�conv2d_2/BiasAdd/ReadVariableOp�conv2d_2/Conv2D/ReadVariableOp�;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp�=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp�=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp�
conv2d/Conv2D/ReadVariableOpReadVariableOp%conv2d_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
conv2d/Conv2DConv2Dinput$conv2d/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
�
conv2d/BiasAdd/ReadVariableOpReadVariableOp&conv2d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
conv2d/BiasAddBiasAddconv2d/Conv2D:output:0%conv2d/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   f
conv2d/ReluReluconv2d/BiasAdd:output:0*
T0*/
_output_shapes
:���������   �
conv2d_1/Conv2D/ReadVariableOpReadVariableOp'conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
conv2d_1/Conv2DConv2Dconv2d/Relu:activations:0&conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
conv2d_1/BiasAdd/ReadVariableOpReadVariableOp(conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
conv2d_1/BiasAddBiasAddconv2d_1/Conv2D:output:0'conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @j
conv2d_1/ReluReluconv2d_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
conv2d_2/Conv2D/ReadVariableOpReadVariableOp'conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
conv2d_2/Conv2DConv2Dconv2d_1/Relu:activations:0&conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
conv2d_2/BiasAdd/ReadVariableOpReadVariableOp(conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
conv2d_2/BiasAddBiasAddconv2d_2/Conv2D:output:0'conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @j
conv2d_2/ReluReluconv2d_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOpReadVariableOp%conv2d_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
,vae/encoder/conv2d/kernel/Regularizer/SquareSquareCvae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
+vae/encoder/conv2d/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
)vae/encoder/conv2d/kernel/Regularizer/SumSum0vae/encoder/conv2d/kernel/Regularizer/Square:y:04vae/encoder/conv2d/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: p
+vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
)vae/encoder/conv2d/kernel/Regularizer/mulMul4vae/encoder/conv2d/kernel/Regularizer/mul/x:output:02vae/encoder/conv2d/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp'conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
.vae/encoder/conv2d_1/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
-vae/encoder/conv2d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_1/kernel/Regularizer/SumSum2vae/encoder/conv2d_1/kernel/Regularizer/Square:y:06vae/encoder/conv2d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_1/kernel/Regularizer/mulMul6vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp'conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
.vae/encoder/conv2d_2/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
-vae/encoder/conv2d_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_2/kernel/Regularizer/SumSum2vae/encoder/conv2d_2/kernel/Regularizer/Square:y:06vae/encoder/conv2d_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_2/kernel/Regularizer/mulMul6vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: r
IdentityIdentityconv2d_2/Relu:activations:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^conv2d/BiasAdd/ReadVariableOp^conv2d/Conv2D/ReadVariableOp ^conv2d_1/BiasAdd/ReadVariableOp^conv2d_1/Conv2D/ReadVariableOp ^conv2d_2/BiasAdd/ReadVariableOp^conv2d_2/Conv2D/ReadVariableOp<^vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp>^vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp>^vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  : : : : : : 2>
conv2d/BiasAdd/ReadVariableOpconv2d/BiasAdd/ReadVariableOp2<
conv2d/Conv2D/ReadVariableOpconv2d/Conv2D/ReadVariableOp2B
conv2d_1/BiasAdd/ReadVariableOpconv2d_1/BiasAdd/ReadVariableOp2@
conv2d_1/Conv2D/ReadVariableOpconv2d_1/Conv2D/ReadVariableOp2B
conv2d_2/BiasAdd/ReadVariableOpconv2d_2/BiasAdd/ReadVariableOp2@
conv2d_2/Conv2D/ReadVariableOpconv2d_2/Conv2D/ReadVariableOp2z
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp2~
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp2~
=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_2/kernel/Regularizer/Square/ReadVariableOp:V R
/
_output_shapes
:���������  

_user_specified_nameinput
�b
�
__inference__traced_save_207848
file_prefix/
+savev2_embeddings_vqvae_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop8
4savev2_vae_encoder_conv2d_kernel_read_readvariableop6
2savev2_vae_encoder_conv2d_bias_read_readvariableop:
6savev2_vae_encoder_conv2d_1_kernel_read_readvariableop8
4savev2_vae_encoder_conv2d_1_bias_read_readvariableop:
6savev2_vae_encoder_conv2d_2_kernel_read_readvariableop8
4savev2_vae_encoder_conv2d_2_bias_read_readvariableopB
>savev2_vae_decoder_conv2d_transpose_kernel_read_readvariableop@
<savev2_vae_decoder_conv2d_transpose_bias_read_readvariableopD
@savev2_vae_decoder_conv2d_transpose_1_kernel_read_readvariableopB
>savev2_vae_decoder_conv2d_transpose_1_bias_read_readvariableopD
@savev2_vae_decoder_conv2d_transpose_2_kernel_read_readvariableopB
>savev2_vae_decoder_conv2d_transpose_2_bias_read_readvariableop6
2savev2_adam_embeddings_vqvae_m_read_readvariableop?
;savev2_adam_vae_encoder_conv2d_kernel_m_read_readvariableop=
9savev2_adam_vae_encoder_conv2d_bias_m_read_readvariableopA
=savev2_adam_vae_encoder_conv2d_1_kernel_m_read_readvariableop?
;savev2_adam_vae_encoder_conv2d_1_bias_m_read_readvariableopA
=savev2_adam_vae_encoder_conv2d_2_kernel_m_read_readvariableop?
;savev2_adam_vae_encoder_conv2d_2_bias_m_read_readvariableopI
Esavev2_adam_vae_decoder_conv2d_transpose_kernel_m_read_readvariableopG
Csavev2_adam_vae_decoder_conv2d_transpose_bias_m_read_readvariableopK
Gsavev2_adam_vae_decoder_conv2d_transpose_1_kernel_m_read_readvariableopI
Esavev2_adam_vae_decoder_conv2d_transpose_1_bias_m_read_readvariableopK
Gsavev2_adam_vae_decoder_conv2d_transpose_2_kernel_m_read_readvariableopI
Esavev2_adam_vae_decoder_conv2d_transpose_2_bias_m_read_readvariableop6
2savev2_adam_embeddings_vqvae_v_read_readvariableop?
;savev2_adam_vae_encoder_conv2d_kernel_v_read_readvariableop=
9savev2_adam_vae_encoder_conv2d_bias_v_read_readvariableopA
=savev2_adam_vae_encoder_conv2d_1_kernel_v_read_readvariableop?
;savev2_adam_vae_encoder_conv2d_1_bias_v_read_readvariableopA
=savev2_adam_vae_encoder_conv2d_2_kernel_v_read_readvariableop?
;savev2_adam_vae_encoder_conv2d_2_bias_v_read_readvariableopI
Esavev2_adam_vae_decoder_conv2d_transpose_kernel_v_read_readvariableopG
Csavev2_adam_vae_decoder_conv2d_transpose_bias_v_read_readvariableopK
Gsavev2_adam_vae_decoder_conv2d_transpose_1_kernel_v_read_readvariableopI
Esavev2_adam_vae_decoder_conv2d_transpose_1_bias_v_read_readvariableopK
Gsavev2_adam_vae_decoder_conv2d_transpose_2_kernel_v_read_readvariableopI
Esavev2_adam_vae_decoder_conv2d_transpose_2_bias_v_read_readvariableop
savev2_const

identity_1��MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : �
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: �
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:-*
dtype0*�
value�B�-B6vector_quantizer/embeddings/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB'variables/10/.ATTRIBUTES/VARIABLE_VALUEB'variables/11/.ATTRIBUTES/VARIABLE_VALUEB'variables/12/.ATTRIBUTES/VARIABLE_VALUEBRvector_quantizer/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/7/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/8/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/9/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/10/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/11/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/12/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRvector_quantizer/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/7/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/8/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/9/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/10/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/11/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/12/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:-*
dtype0*m
valuedBb-B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0+savev2_embeddings_vqvae_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop4savev2_vae_encoder_conv2d_kernel_read_readvariableop2savev2_vae_encoder_conv2d_bias_read_readvariableop6savev2_vae_encoder_conv2d_1_kernel_read_readvariableop4savev2_vae_encoder_conv2d_1_bias_read_readvariableop6savev2_vae_encoder_conv2d_2_kernel_read_readvariableop4savev2_vae_encoder_conv2d_2_bias_read_readvariableop>savev2_vae_decoder_conv2d_transpose_kernel_read_readvariableop<savev2_vae_decoder_conv2d_transpose_bias_read_readvariableop@savev2_vae_decoder_conv2d_transpose_1_kernel_read_readvariableop>savev2_vae_decoder_conv2d_transpose_1_bias_read_readvariableop@savev2_vae_decoder_conv2d_transpose_2_kernel_read_readvariableop>savev2_vae_decoder_conv2d_transpose_2_bias_read_readvariableop2savev2_adam_embeddings_vqvae_m_read_readvariableop;savev2_adam_vae_encoder_conv2d_kernel_m_read_readvariableop9savev2_adam_vae_encoder_conv2d_bias_m_read_readvariableop=savev2_adam_vae_encoder_conv2d_1_kernel_m_read_readvariableop;savev2_adam_vae_encoder_conv2d_1_bias_m_read_readvariableop=savev2_adam_vae_encoder_conv2d_2_kernel_m_read_readvariableop;savev2_adam_vae_encoder_conv2d_2_bias_m_read_readvariableopEsavev2_adam_vae_decoder_conv2d_transpose_kernel_m_read_readvariableopCsavev2_adam_vae_decoder_conv2d_transpose_bias_m_read_readvariableopGsavev2_adam_vae_decoder_conv2d_transpose_1_kernel_m_read_readvariableopEsavev2_adam_vae_decoder_conv2d_transpose_1_bias_m_read_readvariableopGsavev2_adam_vae_decoder_conv2d_transpose_2_kernel_m_read_readvariableopEsavev2_adam_vae_decoder_conv2d_transpose_2_bias_m_read_readvariableop2savev2_adam_embeddings_vqvae_v_read_readvariableop;savev2_adam_vae_encoder_conv2d_kernel_v_read_readvariableop9savev2_adam_vae_encoder_conv2d_bias_v_read_readvariableop=savev2_adam_vae_encoder_conv2d_1_kernel_v_read_readvariableop;savev2_adam_vae_encoder_conv2d_1_bias_v_read_readvariableop=savev2_adam_vae_encoder_conv2d_2_kernel_v_read_readvariableop;savev2_adam_vae_encoder_conv2d_2_bias_v_read_readvariableopEsavev2_adam_vae_decoder_conv2d_transpose_kernel_v_read_readvariableopCsavev2_adam_vae_decoder_conv2d_transpose_bias_v_read_readvariableopGsavev2_adam_vae_decoder_conv2d_transpose_1_kernel_v_read_readvariableopEsavev2_adam_vae_decoder_conv2d_transpose_1_bias_v_read_readvariableopGsavev2_adam_vae_decoder_conv2d_transpose_2_kernel_v_read_readvariableopEsavev2_adam_vae_decoder_conv2d_transpose_2_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *;
dtypes1
/2-	�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*�
_input_shapes�
�: :	@�: : : : : : : : @:@:@@:@: @: :@@:@: ::	@�: : : @:@:@@:@: @: :@@:@: ::	@�: : : @:@:@@:@: @: :@@:@: :: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:%!

_output_shapes
:	@�:

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :,(
&
_output_shapes
: : 

_output_shapes
: :,	(
&
_output_shapes
: @: 


_output_shapes
:@:,(
&
_output_shapes
:@@: 

_output_shapes
:@:,(
&
_output_shapes
: @: 

_output_shapes
: :,(
&
_output_shapes
:@@: 

_output_shapes
:@:,(
&
_output_shapes
: : 

_output_shapes
::%!

_output_shapes
:	@�:,(
&
_output_shapes
: : 

_output_shapes
: :,(
&
_output_shapes
: @: 

_output_shapes
:@:,(
&
_output_shapes
:@@: 

_output_shapes
:@:,(
&
_output_shapes
: @: 

_output_shapes
: :,(
&
_output_shapes
:@@: 

_output_shapes
:@:,(
&
_output_shapes
: : 

_output_shapes
::% !

_output_shapes
:	@�:,!(
&
_output_shapes
: : "

_output_shapes
: :,#(
&
_output_shapes
: @: $

_output_shapes
:@:,%(
&
_output_shapes
:@@: &

_output_shapes
:@:,'(
&
_output_shapes
: @: (

_output_shapes
: :,)(
&
_output_shapes
:@@: *

_output_shapes
:@:,+(
&
_output_shapes
: : ,

_output_shapes
::-

_output_shapes
: 
�	
�
(__inference_encoder_layer_call_fn_205928
input_1!
unknown: 
	unknown_0: #
	unknown_1: @
	unknown_2:@#
	unknown_3:@@
	unknown_4:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

  `E8� *L
fGRE
C__inference_encoder_layer_call_and_return_conditional_losses_205913w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:���������  
!
_user_specified_name	input_1
�
�
1__inference_vector_quantizer_layer_call_fn_207081
x
unknown:	@�
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallxunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:���������  @: *#
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *U
fPRN
L__inference_vector_quantizer_layer_call_and_return_conditional_losses_206067w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������  @: 22
StatefulPartitionedCallStatefulPartitionedCall:R N
/
_output_shapes
:���������  @

_user_specified_namex
�t
�
C__inference_decoder_layer_call_and_return_conditional_losses_207249	
inputU
;conv2d_transpose_1_conv2d_transpose_readvariableop_resource:@@@
2conv2d_transpose_1_biasadd_readvariableop_resource:@S
9conv2d_transpose_conv2d_transpose_readvariableop_resource: @>
0conv2d_transpose_biasadd_readvariableop_resource: U
;conv2d_transpose_2_conv2d_transpose_readvariableop_resource: @
2conv2d_transpose_2_biasadd_readvariableop_resource:
identity��'conv2d_transpose/BiasAdd/ReadVariableOp�0conv2d_transpose/conv2d_transpose/ReadVariableOp�)conv2d_transpose_1/BiasAdd/ReadVariableOp�2conv2d_transpose_1/conv2d_transpose/ReadVariableOp�)conv2d_transpose_2/BiasAdd/ReadVariableOp�2conv2d_transpose_2/conv2d_transpose/ReadVariableOp�Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp�Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp�Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpM
conv2d_transpose_1/ShapeShapeinput*
T0*
_output_shapes
:p
&conv2d_transpose_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
 conv2d_transpose_1/strided_sliceStridedSlice!conv2d_transpose_1/Shape:output:0/conv2d_transpose_1/strided_slice/stack:output:01conv2d_transpose_1/strided_slice/stack_1:output:01conv2d_transpose_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
conv2d_transpose_1/stack/1Const*
_output_shapes
: *
dtype0*
value	B : \
conv2d_transpose_1/stack/2Const*
_output_shapes
: *
dtype0*
value	B : \
conv2d_transpose_1/stack/3Const*
_output_shapes
: *
dtype0*
value	B :@�
conv2d_transpose_1/stackPack)conv2d_transpose_1/strided_slice:output:0#conv2d_transpose_1/stack/1:output:0#conv2d_transpose_1/stack/2:output:0#conv2d_transpose_1/stack/3:output:0*
N*
T0*
_output_shapes
:r
(conv2d_transpose_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*conv2d_transpose_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*conv2d_transpose_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
"conv2d_transpose_1/strided_slice_1StridedSlice!conv2d_transpose_1/stack:output:01conv2d_transpose_1/strided_slice_1/stack:output:03conv2d_transpose_1/strided_slice_1/stack_1:output:03conv2d_transpose_1/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
2conv2d_transpose_1/conv2d_transpose/ReadVariableOpReadVariableOp;conv2d_transpose_1_conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
#conv2d_transpose_1/conv2d_transposeConv2DBackpropInput!conv2d_transpose_1/stack:output:0:conv2d_transpose_1/conv2d_transpose/ReadVariableOp:value:0input*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
)conv2d_transpose_1/BiasAdd/ReadVariableOpReadVariableOp2conv2d_transpose_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
conv2d_transpose_1/BiasAddBiasAdd,conv2d_transpose_1/conv2d_transpose:output:01conv2d_transpose_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @~
conv2d_transpose_1/ReluRelu#conv2d_transpose_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @k
conv2d_transpose/ShapeShape%conv2d_transpose_1/Relu:activations:0*
T0*
_output_shapes
:n
$conv2d_transpose/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: p
&conv2d_transpose/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:p
&conv2d_transpose/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
conv2d_transpose/strided_sliceStridedSliceconv2d_transpose/Shape:output:0-conv2d_transpose/strided_slice/stack:output:0/conv2d_transpose/strided_slice/stack_1:output:0/conv2d_transpose/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskZ
conv2d_transpose/stack/1Const*
_output_shapes
: *
dtype0*
value	B : Z
conv2d_transpose/stack/2Const*
_output_shapes
: *
dtype0*
value	B : Z
conv2d_transpose/stack/3Const*
_output_shapes
: *
dtype0*
value	B : �
conv2d_transpose/stackPack'conv2d_transpose/strided_slice:output:0!conv2d_transpose/stack/1:output:0!conv2d_transpose/stack/2:output:0!conv2d_transpose/stack/3:output:0*
N*
T0*
_output_shapes
:p
&conv2d_transpose/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
 conv2d_transpose/strided_slice_1StridedSliceconv2d_transpose/stack:output:0/conv2d_transpose/strided_slice_1/stack:output:01conv2d_transpose/strided_slice_1/stack_1:output:01conv2d_transpose/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
0conv2d_transpose/conv2d_transpose/ReadVariableOpReadVariableOp9conv2d_transpose_conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
!conv2d_transpose/conv2d_transposeConv2DBackpropInputconv2d_transpose/stack:output:08conv2d_transpose/conv2d_transpose/ReadVariableOp:value:0%conv2d_transpose_1/Relu:activations:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
�
'conv2d_transpose/BiasAdd/ReadVariableOpReadVariableOp0conv2d_transpose_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
conv2d_transpose/BiasAddBiasAdd*conv2d_transpose/conv2d_transpose:output:0/conv2d_transpose/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   z
conv2d_transpose/ReluRelu!conv2d_transpose/BiasAdd:output:0*
T0*/
_output_shapes
:���������   k
conv2d_transpose_2/ShapeShape#conv2d_transpose/Relu:activations:0*
T0*
_output_shapes
:p
&conv2d_transpose_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
 conv2d_transpose_2/strided_sliceStridedSlice!conv2d_transpose_2/Shape:output:0/conv2d_transpose_2/strided_slice/stack:output:01conv2d_transpose_2/strided_slice/stack_1:output:01conv2d_transpose_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
conv2d_transpose_2/stack/1Const*
_output_shapes
: *
dtype0*
value	B : \
conv2d_transpose_2/stack/2Const*
_output_shapes
: *
dtype0*
value	B : \
conv2d_transpose_2/stack/3Const*
_output_shapes
: *
dtype0*
value	B :�
conv2d_transpose_2/stackPack)conv2d_transpose_2/strided_slice:output:0#conv2d_transpose_2/stack/1:output:0#conv2d_transpose_2/stack/2:output:0#conv2d_transpose_2/stack/3:output:0*
N*
T0*
_output_shapes
:r
(conv2d_transpose_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*conv2d_transpose_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*conv2d_transpose_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
"conv2d_transpose_2/strided_slice_1StridedSlice!conv2d_transpose_2/stack:output:01conv2d_transpose_2/strided_slice_1/stack:output:03conv2d_transpose_2/strided_slice_1/stack_1:output:03conv2d_transpose_2/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
2conv2d_transpose_2/conv2d_transpose/ReadVariableOpReadVariableOp;conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
#conv2d_transpose_2/conv2d_transposeConv2DBackpropInput!conv2d_transpose_2/stack:output:0:conv2d_transpose_2/conv2d_transpose/ReadVariableOp:value:0#conv2d_transpose/Relu:activations:0*
T0*/
_output_shapes
:���������  *
paddingSAME*
strides
�
)conv2d_transpose_2/BiasAdd/ReadVariableOpReadVariableOp2conv2d_transpose_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
conv2d_transpose_2/BiasAddBiasAdd,conv2d_transpose_2/conv2d_transpose:output:01conv2d_transpose_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  �
conv2d_transpose_2/SigmoidSigmoid#conv2d_transpose_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������  �
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpReadVariableOp9conv2d_transpose_conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
6vae/decoder/conv2d_transpose/kernel/Regularizer/SquareSquareMvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
5vae/decoder/conv2d_transpose/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3vae/decoder/conv2d_transpose/kernel/Regularizer/SumSum:vae/decoder/conv2d_transpose/kernel/Regularizer/Square:y:0>vae/decoder/conv2d_transpose/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
3vae/decoder/conv2d_transpose/kernel/Regularizer/mulMul>vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0<vae/decoder/conv2d_transpose/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp;conv2d_transpose_1_conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
8vae/decoder/conv2d_transpose_1/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp;conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
8vae/decoder/conv2d_transpose_2/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: u
IdentityIdentityconv2d_transpose_2/Sigmoid:y:0^NoOp*
T0*/
_output_shapes
:���������  �
NoOpNoOp(^conv2d_transpose/BiasAdd/ReadVariableOp1^conv2d_transpose/conv2d_transpose/ReadVariableOp*^conv2d_transpose_1/BiasAdd/ReadVariableOp3^conv2d_transpose_1/conv2d_transpose/ReadVariableOp*^conv2d_transpose_2/BiasAdd/ReadVariableOp3^conv2d_transpose_2/conv2d_transpose/ReadVariableOpF^vae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpH^vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpH^vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  @: : : : : : 2R
'conv2d_transpose/BiasAdd/ReadVariableOp'conv2d_transpose/BiasAdd/ReadVariableOp2d
0conv2d_transpose/conv2d_transpose/ReadVariableOp0conv2d_transpose/conv2d_transpose/ReadVariableOp2V
)conv2d_transpose_1/BiasAdd/ReadVariableOp)conv2d_transpose_1/BiasAdd/ReadVariableOp2h
2conv2d_transpose_1/conv2d_transpose/ReadVariableOp2conv2d_transpose_1/conv2d_transpose/ReadVariableOp2V
)conv2d_transpose_2/BiasAdd/ReadVariableOp)conv2d_transpose_2/BiasAdd/ReadVariableOp2h
2conv2d_transpose_2/conv2d_transpose/ReadVariableOp2conv2d_transpose_2/conv2d_transpose/ReadVariableOp2�
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpEvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:V R
/
_output_shapes
:���������  @

_user_specified_nameinput
�)
�
L__inference_vector_quantizer_layer_call_and_return_conditional_losses_206067
x1
matmul_readvariableop_resource:	@�
identity

identity_1��MatMul/ReadVariableOp�MatMul_1/ReadVariableOp�ReadVariableOp6
ShapeShapex*
T0*
_output_shapes
:^
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   _
ReshapeReshapexReshape/shape:output:0*
T0*'
_output_shapes
:���������@u
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0t
MatMulMatMulReshape:output:0MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������J
pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @^
powPowReshape:output:0pow/y:output:0*
T0*'
_output_shapes
:���������@W
Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :v
SumSumpow:z:0Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(n
ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0L
pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @`
pow_1PowReadVariableOp:value:0pow_1/y:output:0*
T0*
_output_shapes
:	@�Y
Sum_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B : _
Sum_1Sum	pow_1:z:0 Sum_1/reduction_indices:output:0*
T0*
_output_shapes	
:�]
addAddV2Sum:output:0Sum_1:output:0*
T0*(
_output_shapes
:����������J
mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @_
mulMulmul/x:output:0MatMul:product:0*
T0*(
_output_shapes
:����������O
subSubadd:z:0mul:z:0*
T0*(
_output_shapes
:����������R
ArgMin/dimensionConst*
_output_shapes
: *
dtype0*
value	B :b
ArgMinArgMinsub:z:0ArgMin/dimension:output:0*
T0*#
_output_shapes
:���������U
one_hot/on_valueConst*
_output_shapes
: *
dtype0*
valueB
 *  �?V
one_hot/off_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    P
one_hot/depthConst*
_output_shapes
: *
dtype0*
value
B :��
one_hotOneHotArgMin:output:0one_hot/depth:output:0one_hot/on_value:output:0one_hot/off_value:output:0*
T0*(
_output_shapes
:����������w
MatMul_1/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
MatMul_1MatMulone_hot:output:0MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@*
transpose_b(r
	Reshape_1ReshapeMatMul_1:product:0Shape:output:0*
T0*/
_output_shapes
:���������  @j
StopGradientStopGradientReshape_1:output:0*
T0*/
_output_shapes
:���������  @`
sub_1SubStopGradient:output:0x*
T0*/
_output_shapes
:���������  @L
pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @c
pow_2Pow	sub_1:z:0pow_2/y:output:0*
T0*/
_output_shapes
:���������  @^
ConstConst*
_output_shapes
:*
dtype0*%
valueB"             H
MeanMean	pow_2:z:0Const:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �>N
mul_1Mulmul_1/x:output:0Mean:output:0*
T0*
_output_shapes
: [
StopGradient_1StopGradientx*
T0*/
_output_shapes
:���������  @s
sub_2SubReshape_1:output:0StopGradient_1:output:0*
T0*/
_output_shapes
:���������  @L
pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @c
pow_3Pow	sub_2:z:0pow_3/y:output:0*
T0*/
_output_shapes
:���������  @`
Const_1Const*
_output_shapes
:*
dtype0*%
valueB"             L
Mean_1Mean	pow_3:z:0Const_1:output:0*
T0*
_output_shapes
: K
add_1AddV2	mul_1:z:0Mean_1:output:0*
T0*
_output_shapes
: ]
sub_3SubReshape_1:output:0x*
T0*/
_output_shapes
:���������  @c
StopGradient_2StopGradient	sub_3:z:0*
T0*/
_output_shapes
:���������  @d
add_2AddV2xStopGradient_2:output:0*
T0*/
_output_shapes
:���������  @`
IdentityIdentity	add_2:z:0^NoOp*
T0*/
_output_shapes
:���������  @I

Identity_1Identity	add_1:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������  @: 2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp2 
ReadVariableOpReadVariableOp:R N
/
_output_shapes
:���������  @

_user_specified_namex
�	
�
(__inference_encoder_layer_call_fn_207030	
input!
unknown: 
	unknown_0: #
	unknown_1: @
	unknown_2:@#
	unknown_3:@@
	unknown_4:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

  `E8� *L
fGRE
C__inference_encoder_layer_call_and_return_conditional_losses_205913w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
/
_output_shapes
:���������  

_user_specified_nameinput
�
�
1__inference_vector_quantizer_layer_call_fn_206073
input_1
unknown:	@�
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:���������  @: *#
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *U
fPRN
L__inference_vector_quantizer_layer_call_and_return_conditional_losses_206067w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������  @: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:���������  @
!
_user_specified_name	input_1
�"
�
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_207408

inputsB
(conv2d_transpose_readvariableop_resource: -
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskI
stack/1Const*
_output_shapes
: *
dtype0*
value	B : I
stack/2Const*
_output_shapes
: *
dtype0*
value	B : I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :�
stackPackstrided_slice:output:0stack/1:output:0stack/2:output:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSlicestack:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*/
_output_shapes
:���������  *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  ^
SigmoidSigmoidBiasAdd:output:0*
T0*/
_output_shapes
:���������  �
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
8vae/decoder/conv2d_transpose_2/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentitySigmoid:y:0^NoOp*
T0*/
_output_shapes
:���������  �
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpH^vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������   : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������   
 
_user_specified_nameinputs
�5
�
C__inference_decoder_layer_call_and_return_conditional_losses_206416	
input3
conv2d_transpose_1_206322:@@'
conv2d_transpose_1_206324:@1
conv2d_transpose_206357: @%
conv2d_transpose_206359: 3
conv2d_transpose_2_206392: '
conv2d_transpose_2_206394:
identity��(conv2d_transpose/StatefulPartitionedCall�*conv2d_transpose_1/StatefulPartitionedCall�*conv2d_transpose_2/StatefulPartitionedCall�Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp�Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp�Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp�
*conv2d_transpose_1/StatefulPartitionedCallStatefulPartitionedCallinputconv2d_transpose_1_206322conv2d_transpose_1_206324*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *W
fRRP
N__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_206321�
(conv2d_transpose/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_1/StatefulPartitionedCall:output:0conv2d_transpose_206357conv2d_transpose_206359*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������   *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *U
fPRN
L__inference_conv2d_transpose_layer_call_and_return_conditional_losses_206356�
*conv2d_transpose_2/StatefulPartitionedCallStatefulPartitionedCall1conv2d_transpose/StatefulPartitionedCall:output:0conv2d_transpose_2_206392conv2d_transpose_2_206394*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *W
fRRP
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_206391�
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_transpose_206357*&
_output_shapes
: @*
dtype0�
6vae/decoder/conv2d_transpose/kernel/Regularizer/SquareSquareMvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
5vae/decoder/conv2d_transpose/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3vae/decoder/conv2d_transpose/kernel/Regularizer/SumSum:vae/decoder/conv2d_transpose/kernel/Regularizer/Square:y:0>vae/decoder/conv2d_transpose/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
3vae/decoder/conv2d_transpose/kernel/Regularizer/mulMul>vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0<vae/decoder/conv2d_transpose/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_transpose_1_206322*&
_output_shapes
:@@*
dtype0�
8vae/decoder/conv2d_transpose_1/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_transpose_2_206392*&
_output_shapes
: *
dtype0�
8vae/decoder/conv2d_transpose_2/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
IdentityIdentity3conv2d_transpose_2/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  �
NoOpNoOp)^conv2d_transpose/StatefulPartitionedCall+^conv2d_transpose_1/StatefulPartitionedCall+^conv2d_transpose_2/StatefulPartitionedCallF^vae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpH^vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpH^vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  @: : : : : : 2T
(conv2d_transpose/StatefulPartitionedCall(conv2d_transpose/StatefulPartitionedCall2X
*conv2d_transpose_1/StatefulPartitionedCall*conv2d_transpose_1/StatefulPartitionedCall2X
*conv2d_transpose_2/StatefulPartitionedCall*conv2d_transpose_2/StatefulPartitionedCall2�
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpEvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:V R
/
_output_shapes
:���������  @

_user_specified_nameinput
�"
�
L__inference_conv2d_transpose_layer_call_and_return_conditional_losses_207599

inputsB
(conv2d_transpose_readvariableop_resource: @-
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskI
stack/1Const*
_output_shapes
: *
dtype0*
value	B : I
stack/2Const*
_output_shapes
: *
dtype0*
value	B : I
stack/3Const*
_output_shapes
: *
dtype0*
value	B : �
stackPackstrided_slice:output:0stack/1:output:0stack/2:output:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSlicestack:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������   �
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
6vae/decoder/conv2d_transpose/kernel/Regularizer/SquareSquareMvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
5vae/decoder/conv2d_transpose/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3vae/decoder/conv2d_transpose/kernel/Regularizer/SumSum:vae/decoder/conv2d_transpose/kernel/Regularizer/Square:y:0>vae/decoder/conv2d_transpose/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
3vae/decoder/conv2d_transpose/kernel/Regularizer/mulMul>vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0<vae/decoder/conv2d_transpose/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������   �
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpF^vae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpEvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������  @
 
_user_specified_nameinputs
�,
�
L__inference_conv2d_transpose_layer_call_and_return_conditional_losses_206176

inputsB
(conv2d_transpose_readvariableop_resource: @-
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B : y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+��������������������������� *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+��������������������������� j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+��������������������������� �
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
6vae/decoder/conv2d_transpose/kernel/Regularizer/SquareSquareMvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
5vae/decoder/conv2d_transpose/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3vae/decoder/conv2d_transpose/kernel/Regularizer/SumSum:vae/decoder/conv2d_transpose/kernel/Regularizer/Square:y:0>vae/decoder/conv2d_transpose/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
3vae/decoder/conv2d_transpose/kernel/Regularizer/mulMul>vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0<vae/decoder/conv2d_transpose/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: {
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+��������������������������� �
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpF^vae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpEvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp:i e
A
_output_shapes/
-:+���������������������������@
 
_user_specified_nameinputs
�
�
3__inference_conv2d_transpose_1_layer_call_fn_207614

inputs!
unknown:@@
	unknown_0:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������@*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *W
fRRP
N__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_206227�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������@: : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������@
 
_user_specified_nameinputs
�
�
$__inference_vae_layer_call_fn_206617
input_1!
unknown: 
	unknown_0: #
	unknown_1: @
	unknown_2:@#
	unknown_3:@@
	unknown_4:@
	unknown_5:	@�#
	unknown_6:@@
	unknown_7:@#
	unknown_8: @
	unknown_9: $

unknown_10: 

unknown_11:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:���������  : */
_read_only_resource_inputs
	
*8
config_proto(&

CPU

GPU2*0J

  `E8� *H
fCRA
?__inference_vae_layer_call_and_return_conditional_losses_206587w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:���������  : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:���������  
!
_user_specified_name	input_1
�
�
3__inference_conv2d_transpose_2_layer_call_fn_207338

inputs!
unknown: 
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *W
fRRP
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_206391w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������   : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������   
 
_user_specified_nameinputs
�
�
D__inference_conv2d_1_layer_call_and_return_conditional_losses_207505

inputs8
conv2d_readvariableop_resource: @-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
.vae/encoder/conv2d_1/kernel/Regularizer/SquareSquareEvae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
-vae/encoder/conv2d_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
+vae/encoder/conv2d_1/kernel/Regularizer/SumSum2vae/encoder/conv2d_1/kernel/Regularizer/Square:y:06vae/encoder/conv2d_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: r
-vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
+vae/encoder/conv2d_1/kernel/Regularizer/mulMul6vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:04vae/encoder/conv2d_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp>^vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������   : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2~
=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp=vae/encoder/conv2d_1/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������   
 
_user_specified_nameinputs
�,
�
N__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_206227

inputsB
(conv2d_transpose_readvariableop_resource:@@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :@y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+���������������������������@*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������@j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+���������������������������@�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
8vae/decoder/conv2d_transpose_1/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: {
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������@�
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpH^vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp:i e
A
_output_shapes/
-:+���������������������������@
 
_user_specified_nameinputs
�)
�
L__inference_vector_quantizer_layer_call_and_return_conditional_losses_207132
x1
matmul_readvariableop_resource:	@�
identity

identity_1��MatMul/ReadVariableOp�MatMul_1/ReadVariableOp�ReadVariableOp6
ShapeShapex*
T0*
_output_shapes
:^
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   _
ReshapeReshapexReshape/shape:output:0*
T0*'
_output_shapes
:���������@u
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0t
MatMulMatMulReshape:output:0MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������J
pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @^
powPowReshape:output:0pow/y:output:0*
T0*'
_output_shapes
:���������@W
Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :v
SumSumpow:z:0Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(n
ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0L
pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @`
pow_1PowReadVariableOp:value:0pow_1/y:output:0*
T0*
_output_shapes
:	@�Y
Sum_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B : _
Sum_1Sum	pow_1:z:0 Sum_1/reduction_indices:output:0*
T0*
_output_shapes	
:�]
addAddV2Sum:output:0Sum_1:output:0*
T0*(
_output_shapes
:����������J
mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @_
mulMulmul/x:output:0MatMul:product:0*
T0*(
_output_shapes
:����������O
subSubadd:z:0mul:z:0*
T0*(
_output_shapes
:����������R
ArgMin/dimensionConst*
_output_shapes
: *
dtype0*
value	B :b
ArgMinArgMinsub:z:0ArgMin/dimension:output:0*
T0*#
_output_shapes
:���������U
one_hot/on_valueConst*
_output_shapes
: *
dtype0*
valueB
 *  �?V
one_hot/off_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    P
one_hot/depthConst*
_output_shapes
: *
dtype0*
value
B :��
one_hotOneHotArgMin:output:0one_hot/depth:output:0one_hot/on_value:output:0one_hot/off_value:output:0*
T0*(
_output_shapes
:����������w
MatMul_1/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
MatMul_1MatMulone_hot:output:0MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@*
transpose_b(r
	Reshape_1ReshapeMatMul_1:product:0Shape:output:0*
T0*/
_output_shapes
:���������  @j
StopGradientStopGradientReshape_1:output:0*
T0*/
_output_shapes
:���������  @`
sub_1SubStopGradient:output:0x*
T0*/
_output_shapes
:���������  @L
pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @c
pow_2Pow	sub_1:z:0pow_2/y:output:0*
T0*/
_output_shapes
:���������  @^
ConstConst*
_output_shapes
:*
dtype0*%
valueB"             H
MeanMean	pow_2:z:0Const:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �>N
mul_1Mulmul_1/x:output:0Mean:output:0*
T0*
_output_shapes
: [
StopGradient_1StopGradientx*
T0*/
_output_shapes
:���������  @s
sub_2SubReshape_1:output:0StopGradient_1:output:0*
T0*/
_output_shapes
:���������  @L
pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @c
pow_3Pow	sub_2:z:0pow_3/y:output:0*
T0*/
_output_shapes
:���������  @`
Const_1Const*
_output_shapes
:*
dtype0*%
valueB"             L
Mean_1Mean	pow_3:z:0Const_1:output:0*
T0*
_output_shapes
: K
add_1AddV2	mul_1:z:0Mean_1:output:0*
T0*
_output_shapes
: ]
sub_3SubReshape_1:output:0x*
T0*/
_output_shapes
:���������  @c
StopGradient_2StopGradient	sub_3:z:0*
T0*/
_output_shapes
:���������  @d
add_2AddV2xStopGradient_2:output:0*
T0*/
_output_shapes
:���������  @`
IdentityIdentity	add_2:z:0^NoOp*
T0*/
_output_shapes
:���������  @I

Identity_1Identity	add_1:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������  @: 2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp2 
ReadVariableOpReadVariableOp:R N
/
_output_shapes
:���������  @

_user_specified_namex
�5
�
C__inference_decoder_layer_call_and_return_conditional_losses_206512
input_13
conv2d_transpose_1_206478:@@'
conv2d_transpose_1_206480:@1
conv2d_transpose_206483: @%
conv2d_transpose_206485: 3
conv2d_transpose_2_206488: '
conv2d_transpose_2_206490:
identity��(conv2d_transpose/StatefulPartitionedCall�*conv2d_transpose_1/StatefulPartitionedCall�*conv2d_transpose_2/StatefulPartitionedCall�Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp�Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp�Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp�
*conv2d_transpose_1/StatefulPartitionedCallStatefulPartitionedCallinput_1conv2d_transpose_1_206478conv2d_transpose_1_206480*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *W
fRRP
N__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_206321�
(conv2d_transpose/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_1/StatefulPartitionedCall:output:0conv2d_transpose_206483conv2d_transpose_206485*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������   *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *U
fPRN
L__inference_conv2d_transpose_layer_call_and_return_conditional_losses_206356�
*conv2d_transpose_2/StatefulPartitionedCallStatefulPartitionedCall1conv2d_transpose/StatefulPartitionedCall:output:0conv2d_transpose_2_206488conv2d_transpose_2_206490*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *W
fRRP
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_206391�
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_transpose_206483*&
_output_shapes
: @*
dtype0�
6vae/decoder/conv2d_transpose/kernel/Regularizer/SquareSquareMvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
5vae/decoder/conv2d_transpose/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3vae/decoder/conv2d_transpose/kernel/Regularizer/SumSum:vae/decoder/conv2d_transpose/kernel/Regularizer/Square:y:0>vae/decoder/conv2d_transpose/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
3vae/decoder/conv2d_transpose/kernel/Regularizer/mulMul>vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0<vae/decoder/conv2d_transpose/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_transpose_1_206478*&
_output_shapes
:@@*
dtype0�
8vae/decoder/conv2d_transpose_1/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_transpose_2_206488*&
_output_shapes
: *
dtype0�
8vae/decoder/conv2d_transpose_2/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: �
IdentityIdentity3conv2d_transpose_2/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  �
NoOpNoOp)^conv2d_transpose/StatefulPartitionedCall+^conv2d_transpose_1/StatefulPartitionedCall+^conv2d_transpose_2/StatefulPartitionedCallF^vae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpH^vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpH^vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  @: : : : : : 2T
(conv2d_transpose/StatefulPartitionedCall(conv2d_transpose/StatefulPartitionedCall2X
*conv2d_transpose_1/StatefulPartitionedCall*conv2d_transpose_1/StatefulPartitionedCall2X
*conv2d_transpose_2/StatefulPartitionedCall*conv2d_transpose_2/StatefulPartitionedCall2�
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpEvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:X T
/
_output_shapes
:���������  @
!
_user_specified_name	input_1
�
�
B__inference_conv2d_layer_call_and_return_conditional_losses_205842

inputs8
conv2d_readvariableop_resource: -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������   �
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
,vae/encoder/conv2d/kernel/Regularizer/SquareSquareCvae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
+vae/encoder/conv2d/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
)vae/encoder/conv2d/kernel/Regularizer/SumSum0vae/encoder/conv2d/kernel/Regularizer/Square:y:04vae/encoder/conv2d/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: p
+vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
)vae/encoder/conv2d/kernel/Regularizer/mulMul4vae/encoder/conv2d/kernel/Regularizer/mul/x:output:02vae/encoder/conv2d/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������   �
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp<^vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2z
;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp;vae/encoder/conv2d/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������  
 
_user_specified_nameinputs
�"
�
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_206391

inputsB
(conv2d_transpose_readvariableop_resource: -
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskI
stack/1Const*
_output_shapes
: *
dtype0*
value	B : I
stack/2Const*
_output_shapes
: *
dtype0*
value	B : I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :�
stackPackstrided_slice:output:0stack/1:output:0stack/2:output:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSlicestack:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*/
_output_shapes
:���������  *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  ^
SigmoidSigmoidBiasAdd:output:0*
T0*/
_output_shapes
:���������  �
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
8vae/decoder/conv2d_transpose_2/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentitySigmoid:y:0^NoOp*
T0*/
_output_shapes
:���������  �
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpH^vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������   : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:W S
/
_output_shapes
:���������   
 
_user_specified_nameinputs
ù
�
!__inference__wrapped_model_205818
input_1K
1vae_encoder_conv2d_conv2d_readvariableop_resource: @
2vae_encoder_conv2d_biasadd_readvariableop_resource: M
3vae_encoder_conv2d_1_conv2d_readvariableop_resource: @B
4vae_encoder_conv2d_1_biasadd_readvariableop_resource:@M
3vae_encoder_conv2d_2_conv2d_readvariableop_resource:@@B
4vae_encoder_conv2d_2_biasadd_readvariableop_resource:@F
3vae_vector_quantizer_matmul_readvariableop_resource:	@�a
Gvae_decoder_conv2d_transpose_1_conv2d_transpose_readvariableop_resource:@@L
>vae_decoder_conv2d_transpose_1_biasadd_readvariableop_resource:@_
Evae_decoder_conv2d_transpose_conv2d_transpose_readvariableop_resource: @J
<vae_decoder_conv2d_transpose_biasadd_readvariableop_resource: a
Gvae_decoder_conv2d_transpose_2_conv2d_transpose_readvariableop_resource: L
>vae_decoder_conv2d_transpose_2_biasadd_readvariableop_resource:
identity��3vae/decoder/conv2d_transpose/BiasAdd/ReadVariableOp�<vae/decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp�5vae/decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp�>vae/decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp�5vae/decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp�>vae/decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp�)vae/encoder/conv2d/BiasAdd/ReadVariableOp�(vae/encoder/conv2d/Conv2D/ReadVariableOp�+vae/encoder/conv2d_1/BiasAdd/ReadVariableOp�*vae/encoder/conv2d_1/Conv2D/ReadVariableOp�+vae/encoder/conv2d_2/BiasAdd/ReadVariableOp�*vae/encoder/conv2d_2/Conv2D/ReadVariableOp�*vae/vector_quantizer/MatMul/ReadVariableOp�,vae/vector_quantizer/MatMul_1/ReadVariableOp�#vae/vector_quantizer/ReadVariableOp�
(vae/encoder/conv2d/Conv2D/ReadVariableOpReadVariableOp1vae_encoder_conv2d_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
vae/encoder/conv2d/Conv2DConv2Dinput_10vae/encoder/conv2d/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
�
)vae/encoder/conv2d/BiasAdd/ReadVariableOpReadVariableOp2vae_encoder_conv2d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
vae/encoder/conv2d/BiasAddBiasAdd"vae/encoder/conv2d/Conv2D:output:01vae/encoder/conv2d/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   ~
vae/encoder/conv2d/ReluRelu#vae/encoder/conv2d/BiasAdd:output:0*
T0*/
_output_shapes
:���������   �
*vae/encoder/conv2d_1/Conv2D/ReadVariableOpReadVariableOp3vae_encoder_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
vae/encoder/conv2d_1/Conv2DConv2D%vae/encoder/conv2d/Relu:activations:02vae/encoder/conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
+vae/encoder/conv2d_1/BiasAdd/ReadVariableOpReadVariableOp4vae_encoder_conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
vae/encoder/conv2d_1/BiasAddBiasAdd$vae/encoder/conv2d_1/Conv2D:output:03vae/encoder/conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @�
vae/encoder/conv2d_1/ReluRelu%vae/encoder/conv2d_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
*vae/encoder/conv2d_2/Conv2D/ReadVariableOpReadVariableOp3vae_encoder_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
vae/encoder/conv2d_2/Conv2DConv2D'vae/encoder/conv2d_1/Relu:activations:02vae/encoder/conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
+vae/encoder/conv2d_2/BiasAdd/ReadVariableOpReadVariableOp4vae_encoder_conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
vae/encoder/conv2d_2/BiasAddBiasAdd$vae/encoder/conv2d_2/Conv2D:output:03vae/encoder/conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @�
vae/encoder/conv2d_2/ReluRelu%vae/encoder/conv2d_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @q
vae/vector_quantizer/ShapeShape'vae/encoder/conv2d_2/Relu:activations:0*
T0*
_output_shapes
:s
"vae/vector_quantizer/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   �
vae/vector_quantizer/ReshapeReshape'vae/encoder/conv2d_2/Relu:activations:0+vae/vector_quantizer/Reshape/shape:output:0*
T0*'
_output_shapes
:���������@�
*vae/vector_quantizer/MatMul/ReadVariableOpReadVariableOp3vae_vector_quantizer_matmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
vae/vector_quantizer/MatMulMatMul%vae/vector_quantizer/Reshape:output:02vae/vector_quantizer/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������_
vae/vector_quantizer/pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vae/vector_quantizer/powPow%vae/vector_quantizer/Reshape:output:0#vae/vector_quantizer/pow/y:output:0*
T0*'
_output_shapes
:���������@l
*vae/vector_quantizer/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :�
vae/vector_quantizer/SumSumvae/vector_quantizer/pow:z:03vae/vector_quantizer/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(�
#vae/vector_quantizer/ReadVariableOpReadVariableOp3vae_vector_quantizer_matmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0a
vae/vector_quantizer/pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vae/vector_quantizer/pow_1Pow+vae/vector_quantizer/ReadVariableOp:value:0%vae/vector_quantizer/pow_1/y:output:0*
T0*
_output_shapes
:	@�n
,vae/vector_quantizer/Sum_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B : �
vae/vector_quantizer/Sum_1Sumvae/vector_quantizer/pow_1:z:05vae/vector_quantizer/Sum_1/reduction_indices:output:0*
T0*
_output_shapes	
:��
vae/vector_quantizer/addAddV2!vae/vector_quantizer/Sum:output:0#vae/vector_quantizer/Sum_1:output:0*
T0*(
_output_shapes
:����������_
vae/vector_quantizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vae/vector_quantizer/mulMul#vae/vector_quantizer/mul/x:output:0%vae/vector_quantizer/MatMul:product:0*
T0*(
_output_shapes
:�����������
vae/vector_quantizer/subSubvae/vector_quantizer/add:z:0vae/vector_quantizer/mul:z:0*
T0*(
_output_shapes
:����������g
%vae/vector_quantizer/ArgMin/dimensionConst*
_output_shapes
: *
dtype0*
value	B :�
vae/vector_quantizer/ArgMinArgMinvae/vector_quantizer/sub:z:0.vae/vector_quantizer/ArgMin/dimension:output:0*
T0*#
_output_shapes
:���������j
%vae/vector_quantizer/one_hot/on_valueConst*
_output_shapes
: *
dtype0*
valueB
 *  �?k
&vae/vector_quantizer/one_hot/off_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    e
"vae/vector_quantizer/one_hot/depthConst*
_output_shapes
: *
dtype0*
value
B :��
vae/vector_quantizer/one_hotOneHot$vae/vector_quantizer/ArgMin:output:0+vae/vector_quantizer/one_hot/depth:output:0.vae/vector_quantizer/one_hot/on_value:output:0/vae/vector_quantizer/one_hot/off_value:output:0*
T0*(
_output_shapes
:�����������
,vae/vector_quantizer/MatMul_1/ReadVariableOpReadVariableOp3vae_vector_quantizer_matmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
vae/vector_quantizer/MatMul_1MatMul%vae/vector_quantizer/one_hot:output:04vae/vector_quantizer/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@*
transpose_b(�
vae/vector_quantizer/Reshape_1Reshape'vae/vector_quantizer/MatMul_1:product:0#vae/vector_quantizer/Shape:output:0*
T0*/
_output_shapes
:���������  @�
!vae/vector_quantizer/StopGradientStopGradient'vae/vector_quantizer/Reshape_1:output:0*
T0*/
_output_shapes
:���������  @�
vae/vector_quantizer/sub_1Sub*vae/vector_quantizer/StopGradient:output:0'vae/encoder/conv2d_2/Relu:activations:0*
T0*/
_output_shapes
:���������  @a
vae/vector_quantizer/pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vae/vector_quantizer/pow_2Powvae/vector_quantizer/sub_1:z:0%vae/vector_quantizer/pow_2/y:output:0*
T0*/
_output_shapes
:���������  @s
vae/vector_quantizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
vae/vector_quantizer/MeanMeanvae/vector_quantizer/pow_2:z:0#vae/vector_quantizer/Const:output:0*
T0*
_output_shapes
: a
vae/vector_quantizer/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �>�
vae/vector_quantizer/mul_1Mul%vae/vector_quantizer/mul_1/x:output:0"vae/vector_quantizer/Mean:output:0*
T0*
_output_shapes
: �
#vae/vector_quantizer/StopGradient_1StopGradient'vae/encoder/conv2d_2/Relu:activations:0*
T0*/
_output_shapes
:���������  @�
vae/vector_quantizer/sub_2Sub'vae/vector_quantizer/Reshape_1:output:0,vae/vector_quantizer/StopGradient_1:output:0*
T0*/
_output_shapes
:���������  @a
vae/vector_quantizer/pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vae/vector_quantizer/pow_3Powvae/vector_quantizer/sub_2:z:0%vae/vector_quantizer/pow_3/y:output:0*
T0*/
_output_shapes
:���������  @u
vae/vector_quantizer/Const_1Const*
_output_shapes
:*
dtype0*%
valueB"             �
vae/vector_quantizer/Mean_1Meanvae/vector_quantizer/pow_3:z:0%vae/vector_quantizer/Const_1:output:0*
T0*
_output_shapes
: �
vae/vector_quantizer/add_1AddV2vae/vector_quantizer/mul_1:z:0$vae/vector_quantizer/Mean_1:output:0*
T0*
_output_shapes
: �
vae/vector_quantizer/sub_3Sub'vae/vector_quantizer/Reshape_1:output:0'vae/encoder/conv2d_2/Relu:activations:0*
T0*/
_output_shapes
:���������  @�
#vae/vector_quantizer/StopGradient_2StopGradientvae/vector_quantizer/sub_3:z:0*
T0*/
_output_shapes
:���������  @�
vae/vector_quantizer/add_2AddV2'vae/encoder/conv2d_2/Relu:activations:0,vae/vector_quantizer/StopGradient_2:output:0*
T0*/
_output_shapes
:���������  @r
$vae/decoder/conv2d_transpose_1/ShapeShapevae/vector_quantizer/add_2:z:0*
T0*
_output_shapes
:|
2vae/decoder/conv2d_transpose_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: ~
4vae/decoder/conv2d_transpose_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:~
4vae/decoder/conv2d_transpose_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
,vae/decoder/conv2d_transpose_1/strided_sliceStridedSlice-vae/decoder/conv2d_transpose_1/Shape:output:0;vae/decoder/conv2d_transpose_1/strided_slice/stack:output:0=vae/decoder/conv2d_transpose_1/strided_slice/stack_1:output:0=vae/decoder/conv2d_transpose_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskh
&vae/decoder/conv2d_transpose_1/stack/1Const*
_output_shapes
: *
dtype0*
value	B : h
&vae/decoder/conv2d_transpose_1/stack/2Const*
_output_shapes
: *
dtype0*
value	B : h
&vae/decoder/conv2d_transpose_1/stack/3Const*
_output_shapes
: *
dtype0*
value	B :@�
$vae/decoder/conv2d_transpose_1/stackPack5vae/decoder/conv2d_transpose_1/strided_slice:output:0/vae/decoder/conv2d_transpose_1/stack/1:output:0/vae/decoder/conv2d_transpose_1/stack/2:output:0/vae/decoder/conv2d_transpose_1/stack/3:output:0*
N*
T0*
_output_shapes
:~
4vae/decoder/conv2d_transpose_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: �
6vae/decoder/conv2d_transpose_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
6vae/decoder/conv2d_transpose_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
.vae/decoder/conv2d_transpose_1/strided_slice_1StridedSlice-vae/decoder/conv2d_transpose_1/stack:output:0=vae/decoder/conv2d_transpose_1/strided_slice_1/stack:output:0?vae/decoder/conv2d_transpose_1/strided_slice_1/stack_1:output:0?vae/decoder/conv2d_transpose_1/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
>vae/decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOpReadVariableOpGvae_decoder_conv2d_transpose_1_conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
/vae/decoder/conv2d_transpose_1/conv2d_transposeConv2DBackpropInput-vae/decoder/conv2d_transpose_1/stack:output:0Fvae/decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp:value:0vae/vector_quantizer/add_2:z:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
5vae/decoder/conv2d_transpose_1/BiasAdd/ReadVariableOpReadVariableOp>vae_decoder_conv2d_transpose_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
&vae/decoder/conv2d_transpose_1/BiasAddBiasAdd8vae/decoder/conv2d_transpose_1/conv2d_transpose:output:0=vae/decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @�
#vae/decoder/conv2d_transpose_1/ReluRelu/vae/decoder/conv2d_transpose_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
"vae/decoder/conv2d_transpose/ShapeShape1vae/decoder/conv2d_transpose_1/Relu:activations:0*
T0*
_output_shapes
:z
0vae/decoder/conv2d_transpose/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2vae/decoder/conv2d_transpose/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2vae/decoder/conv2d_transpose/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
*vae/decoder/conv2d_transpose/strided_sliceStridedSlice+vae/decoder/conv2d_transpose/Shape:output:09vae/decoder/conv2d_transpose/strided_slice/stack:output:0;vae/decoder/conv2d_transpose/strided_slice/stack_1:output:0;vae/decoder/conv2d_transpose/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
$vae/decoder/conv2d_transpose/stack/1Const*
_output_shapes
: *
dtype0*
value	B : f
$vae/decoder/conv2d_transpose/stack/2Const*
_output_shapes
: *
dtype0*
value	B : f
$vae/decoder/conv2d_transpose/stack/3Const*
_output_shapes
: *
dtype0*
value	B : �
"vae/decoder/conv2d_transpose/stackPack3vae/decoder/conv2d_transpose/strided_slice:output:0-vae/decoder/conv2d_transpose/stack/1:output:0-vae/decoder/conv2d_transpose/stack/2:output:0-vae/decoder/conv2d_transpose/stack/3:output:0*
N*
T0*
_output_shapes
:|
2vae/decoder/conv2d_transpose/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: ~
4vae/decoder/conv2d_transpose/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:~
4vae/decoder/conv2d_transpose/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
,vae/decoder/conv2d_transpose/strided_slice_1StridedSlice+vae/decoder/conv2d_transpose/stack:output:0;vae/decoder/conv2d_transpose/strided_slice_1/stack:output:0=vae/decoder/conv2d_transpose/strided_slice_1/stack_1:output:0=vae/decoder/conv2d_transpose/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
<vae/decoder/conv2d_transpose/conv2d_transpose/ReadVariableOpReadVariableOpEvae_decoder_conv2d_transpose_conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
-vae/decoder/conv2d_transpose/conv2d_transposeConv2DBackpropInput+vae/decoder/conv2d_transpose/stack:output:0Dvae/decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp:value:01vae/decoder/conv2d_transpose_1/Relu:activations:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
�
3vae/decoder/conv2d_transpose/BiasAdd/ReadVariableOpReadVariableOp<vae_decoder_conv2d_transpose_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
$vae/decoder/conv2d_transpose/BiasAddBiasAdd6vae/decoder/conv2d_transpose/conv2d_transpose:output:0;vae/decoder/conv2d_transpose/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   �
!vae/decoder/conv2d_transpose/ReluRelu-vae/decoder/conv2d_transpose/BiasAdd:output:0*
T0*/
_output_shapes
:���������   �
$vae/decoder/conv2d_transpose_2/ShapeShape/vae/decoder/conv2d_transpose/Relu:activations:0*
T0*
_output_shapes
:|
2vae/decoder/conv2d_transpose_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: ~
4vae/decoder/conv2d_transpose_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:~
4vae/decoder/conv2d_transpose_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
,vae/decoder/conv2d_transpose_2/strided_sliceStridedSlice-vae/decoder/conv2d_transpose_2/Shape:output:0;vae/decoder/conv2d_transpose_2/strided_slice/stack:output:0=vae/decoder/conv2d_transpose_2/strided_slice/stack_1:output:0=vae/decoder/conv2d_transpose_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskh
&vae/decoder/conv2d_transpose_2/stack/1Const*
_output_shapes
: *
dtype0*
value	B : h
&vae/decoder/conv2d_transpose_2/stack/2Const*
_output_shapes
: *
dtype0*
value	B : h
&vae/decoder/conv2d_transpose_2/stack/3Const*
_output_shapes
: *
dtype0*
value	B :�
$vae/decoder/conv2d_transpose_2/stackPack5vae/decoder/conv2d_transpose_2/strided_slice:output:0/vae/decoder/conv2d_transpose_2/stack/1:output:0/vae/decoder/conv2d_transpose_2/stack/2:output:0/vae/decoder/conv2d_transpose_2/stack/3:output:0*
N*
T0*
_output_shapes
:~
4vae/decoder/conv2d_transpose_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: �
6vae/decoder/conv2d_transpose_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
6vae/decoder/conv2d_transpose_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
.vae/decoder/conv2d_transpose_2/strided_slice_1StridedSlice-vae/decoder/conv2d_transpose_2/stack:output:0=vae/decoder/conv2d_transpose_2/strided_slice_1/stack:output:0?vae/decoder/conv2d_transpose_2/strided_slice_1/stack_1:output:0?vae/decoder/conv2d_transpose_2/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
>vae/decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOpReadVariableOpGvae_decoder_conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
/vae/decoder/conv2d_transpose_2/conv2d_transposeConv2DBackpropInput-vae/decoder/conv2d_transpose_2/stack:output:0Fvae/decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp:value:0/vae/decoder/conv2d_transpose/Relu:activations:0*
T0*/
_output_shapes
:���������  *
paddingSAME*
strides
�
5vae/decoder/conv2d_transpose_2/BiasAdd/ReadVariableOpReadVariableOp>vae_decoder_conv2d_transpose_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
&vae/decoder/conv2d_transpose_2/BiasAddBiasAdd8vae/decoder/conv2d_transpose_2/conv2d_transpose:output:0=vae/decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  �
&vae/decoder/conv2d_transpose_2/SigmoidSigmoid/vae/decoder/conv2d_transpose_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������  �
IdentityIdentity*vae/decoder/conv2d_transpose_2/Sigmoid:y:0^NoOp*
T0*/
_output_shapes
:���������  �
NoOpNoOp4^vae/decoder/conv2d_transpose/BiasAdd/ReadVariableOp=^vae/decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp6^vae/decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp?^vae/decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp6^vae/decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp?^vae/decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp*^vae/encoder/conv2d/BiasAdd/ReadVariableOp)^vae/encoder/conv2d/Conv2D/ReadVariableOp,^vae/encoder/conv2d_1/BiasAdd/ReadVariableOp+^vae/encoder/conv2d_1/Conv2D/ReadVariableOp,^vae/encoder/conv2d_2/BiasAdd/ReadVariableOp+^vae/encoder/conv2d_2/Conv2D/ReadVariableOp+^vae/vector_quantizer/MatMul/ReadVariableOp-^vae/vector_quantizer/MatMul_1/ReadVariableOp$^vae/vector_quantizer/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:���������  : : : : : : : : : : : : : 2j
3vae/decoder/conv2d_transpose/BiasAdd/ReadVariableOp3vae/decoder/conv2d_transpose/BiasAdd/ReadVariableOp2|
<vae/decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp<vae/decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp2n
5vae/decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp5vae/decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp2�
>vae/decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp>vae/decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp2n
5vae/decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp5vae/decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp2�
>vae/decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp>vae/decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp2V
)vae/encoder/conv2d/BiasAdd/ReadVariableOp)vae/encoder/conv2d/BiasAdd/ReadVariableOp2T
(vae/encoder/conv2d/Conv2D/ReadVariableOp(vae/encoder/conv2d/Conv2D/ReadVariableOp2Z
+vae/encoder/conv2d_1/BiasAdd/ReadVariableOp+vae/encoder/conv2d_1/BiasAdd/ReadVariableOp2X
*vae/encoder/conv2d_1/Conv2D/ReadVariableOp*vae/encoder/conv2d_1/Conv2D/ReadVariableOp2Z
+vae/encoder/conv2d_2/BiasAdd/ReadVariableOp+vae/encoder/conv2d_2/BiasAdd/ReadVariableOp2X
*vae/encoder/conv2d_2/Conv2D/ReadVariableOp*vae/encoder/conv2d_2/Conv2D/ReadVariableOp2X
*vae/vector_quantizer/MatMul/ReadVariableOp*vae/vector_quantizer/MatMul/ReadVariableOp2\
,vae/vector_quantizer/MatMul_1/ReadVariableOp,vae/vector_quantizer/MatMul_1/ReadVariableOp2J
#vae/vector_quantizer/ReadVariableOp#vae/vector_quantizer/ReadVariableOp:X T
/
_output_shapes
:���������  
!
_user_specified_name	input_1
�,
�
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_206278

inputsB
(conv2d_transpose_readvariableop_resource: -
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+���������������������������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������p
SigmoidSigmoidBiasAdd:output:0*
T0*A
_output_shapes/
-:+����������������������������
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
8vae/decoder/conv2d_transpose_2/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: �
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: t
IdentityIdentitySigmoid:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpH^vae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+��������������������������� : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_2/kernel/Regularizer/Square/ReadVariableOp:i e
A
_output_shapes/
-:+��������������������������� 
 
_user_specified_nameinputs
�,
�
L__inference_conv2d_transpose_layer_call_and_return_conditional_losses_207569

inputsB
(conv2d_transpose_readvariableop_resource: @-
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B : y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+��������������������������� *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+��������������������������� j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+��������������������������� �
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
6vae/decoder/conv2d_transpose/kernel/Regularizer/SquareSquareMvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
: @�
5vae/decoder/conv2d_transpose/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
3vae/decoder/conv2d_transpose/kernel/Regularizer/SumSum:vae/decoder/conv2d_transpose/kernel/Regularizer/Square:y:0>vae/decoder/conv2d_transpose/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: z
5vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
3vae/decoder/conv2d_transpose/kernel/Regularizer/mulMul>vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0<vae/decoder/conv2d_transpose/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: {
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+��������������������������� �
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpF^vae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Evae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOpEvae/decoder/conv2d_transpose/kernel/Regularizer/Square/ReadVariableOp:i e
A
_output_shapes/
-:+���������������������������@
 
_user_specified_nameinputs
�
�
)__inference_conv2d_2_layer_call_fn_207264

inputs!
unknown:@@
	unknown_0:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *M
fHRF
D__inference_conv2d_2_layer_call_and_return_conditional_losses_205888w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  @: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������  @
 
_user_specified_nameinputs
�
�
)__inference_conv2d_1_layer_call_fn_207488

inputs!
unknown: @
	unknown_0:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

  `E8� *M
fHRF
D__inference_conv2d_1_layer_call_and_return_conditional_losses_205865w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������   : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������   
 
_user_specified_nameinputs
�,
�
N__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_207663

inputsB
(conv2d_transpose_readvariableop_resource:@@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :@y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+���������������������������@*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������@j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+���������������������������@�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
8vae/decoder/conv2d_transpose_1/kernel/Regularizer/SquareSquareOvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*&
_output_shapes
:@@�
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/SumSum<vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square:y:0@vae/decoder/conv2d_transpose_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: |
7vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *��8�
5vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMul@vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0>vae/decoder/conv2d_transpose_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: {
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������@�
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpH^vae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Gvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOpGvae/decoder/conv2d_transpose_1/kernel/Regularizer/Square/ReadVariableOp:i e
A
_output_shapes/
-:+���������������������������@
 
_user_specified_nameinputs"�L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
C
input_18
serving_default_input_1:0���������  D
output_18
StatefulPartitionedCall:0���������  tensorflow/serving/predict:��
�
encoder
vector_quantizer
decoder
	optimizer
loss
	variables
trainable_variables
regularization_losses
		keras_api


signatures
�__call__
+�&call_and_return_all_conditional_losses
�_default_save_signature"
_tf_keras_model
�

layer_dict

latent_dim
	variables
trainable_variables
regularization_losses
	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_model
�

embeddings
	variables
trainable_variables
regularization_losses
	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_model
�

layer_dict
output_layer
	variables
trainable_variables
regularization_losses
	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_model
�
iter

beta_1

beta_2
	decay
 learning_ratem{!m|"m}#m~$m%m�&m�'m�(m�)m�*m�+m�,m�v�!v�"v�#v�$v�%v�&v�'v�(v�)v�*v�+v�,v�"
	optimizer
 "
trackable_dict_wrapper
~
!0
"1
#2
$3
%4
&5
6
'7
(8
)9
*10
+11
,12"
trackable_list_wrapper
~
!0
"1
#2
$3
%4
&5
6
'7
(8
)9
*10
+11
,12"
trackable_list_wrapper
 "
trackable_list_wrapper
�
-non_trainable_variables

.layers
/metrics
0layer_regularization_losses
1layer_metrics
	variables
trainable_variables
regularization_losses
�__call__
�_default_save_signature
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
-
�serving_default"
signature_map
:
2layer_1
3layer_2"
trackable_dict_wrapper
�

%kernel
&bias
4	variables
5trainable_variables
6regularization_losses
7	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
J
!0
"1
#2
$3
%4
&5"
trackable_list_wrapper
J
!0
"1
#2
$3
%4
&5"
trackable_list_wrapper
8
�0
�1
�2"
trackable_list_wrapper
�
8non_trainable_variables

9layers
:metrics
;layer_regularization_losses
<layer_metrics
	variables
trainable_variables
regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
#:!	@�2embeddings_vqvae
'
0"
trackable_list_wrapper
'
0"
trackable_list_wrapper
 "
trackable_list_wrapper
�
=non_trainable_variables

>layers
?metrics
@layer_regularization_losses
Alayer_metrics
	variables
trainable_variables
regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
:
Blayer_1
Clayer_2"
trackable_dict_wrapper
�

+kernel
,bias
D	variables
Etrainable_variables
Fregularization_losses
G	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
J
'0
(1
)2
*3
+4
,5"
trackable_list_wrapper
J
'0
(1
)2
*3
+4
,5"
trackable_list_wrapper
8
�0
�1
�2"
trackable_list_wrapper
�
Hnon_trainable_variables

Ilayers
Jmetrics
Klayer_regularization_losses
Llayer_metrics
	variables
trainable_variables
regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
3:1 2vae/encoder/conv2d/kernel
%:# 2vae/encoder/conv2d/bias
5:3 @2vae/encoder/conv2d_1/kernel
':%@2vae/encoder/conv2d_1/bias
5:3@@2vae/encoder/conv2d_2/kernel
':%@2vae/encoder/conv2d_2/bias
=:; @2#vae/decoder/conv2d_transpose/kernel
/:- 2!vae/decoder/conv2d_transpose/bias
?:=@@2%vae/decoder/conv2d_transpose_1/kernel
1:/@2#vae/decoder/conv2d_transpose_1/bias
?:= 2%vae/decoder/conv2d_transpose_2/kernel
1:/2#vae/decoder/conv2d_transpose_2/bias
 "
trackable_list_wrapper
5
0
1
2"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�

!kernel
"bias
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

#kernel
$bias
Q	variables
Rtrainable_variables
Sregularization_losses
T	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
.
%0
&1"
trackable_list_wrapper
.
%0
&1"
trackable_list_wrapper
(
�0"
trackable_list_wrapper
�
Unon_trainable_variables

Vlayers
Wmetrics
Xlayer_regularization_losses
Ylayer_metrics
4	variables
5trainable_variables
6regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
5
20
31
2"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�

'kernel
(bias
Z	variables
[trainable_variables
\regularization_losses
]	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

)kernel
*bias
^	variables
_trainable_variables
`regularization_losses
a	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
.
+0
,1"
trackable_list_wrapper
.
+0
,1"
trackable_list_wrapper
(
�0"
trackable_list_wrapper
�
bnon_trainable_variables

clayers
dmetrics
elayer_regularization_losses
flayer_metrics
D	variables
Etrainable_variables
Fregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
5
B0
C1
2"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
!0
"1"
trackable_list_wrapper
.
!0
"1"
trackable_list_wrapper
(
�0"
trackable_list_wrapper
�
gnon_trainable_variables

hlayers
imetrics
jlayer_regularization_losses
klayer_metrics
M	variables
Ntrainable_variables
Oregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
.
#0
$1"
trackable_list_wrapper
.
#0
$1"
trackable_list_wrapper
(
�0"
trackable_list_wrapper
�
lnon_trainable_variables

mlayers
nmetrics
olayer_regularization_losses
player_metrics
Q	variables
Rtrainable_variables
Sregularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
(
�0"
trackable_list_wrapper
 "
trackable_dict_wrapper
.
'0
(1"
trackable_list_wrapper
.
'0
(1"
trackable_list_wrapper
(
�0"
trackable_list_wrapper
�
qnon_trainable_variables

rlayers
smetrics
tlayer_regularization_losses
ulayer_metrics
Z	variables
[trainable_variables
\regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
.
)0
*1"
trackable_list_wrapper
.
)0
*1"
trackable_list_wrapper
(
�0"
trackable_list_wrapper
�
vnon_trainable_variables

wlayers
xmetrics
ylayer_regularization_losses
zlayer_metrics
^	variables
_trainable_variables
`regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
(
�0"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
(
�0"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
(
�0"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
(
�0"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
(
�0"
trackable_list_wrapper
 "
trackable_dict_wrapper
(:&	@�2Adam/embeddings_vqvae/m
8:6 2 Adam/vae/encoder/conv2d/kernel/m
*:( 2Adam/vae/encoder/conv2d/bias/m
::8 @2"Adam/vae/encoder/conv2d_1/kernel/m
,:*@2 Adam/vae/encoder/conv2d_1/bias/m
::8@@2"Adam/vae/encoder/conv2d_2/kernel/m
,:*@2 Adam/vae/encoder/conv2d_2/bias/m
B:@ @2*Adam/vae/decoder/conv2d_transpose/kernel/m
4:2 2(Adam/vae/decoder/conv2d_transpose/bias/m
D:B@@2,Adam/vae/decoder/conv2d_transpose_1/kernel/m
6:4@2*Adam/vae/decoder/conv2d_transpose_1/bias/m
D:B 2,Adam/vae/decoder/conv2d_transpose_2/kernel/m
6:42*Adam/vae/decoder/conv2d_transpose_2/bias/m
(:&	@�2Adam/embeddings_vqvae/v
8:6 2 Adam/vae/encoder/conv2d/kernel/v
*:( 2Adam/vae/encoder/conv2d/bias/v
::8 @2"Adam/vae/encoder/conv2d_1/kernel/v
,:*@2 Adam/vae/encoder/conv2d_1/bias/v
::8@@2"Adam/vae/encoder/conv2d_2/kernel/v
,:*@2 Adam/vae/encoder/conv2d_2/bias/v
B:@ @2*Adam/vae/decoder/conv2d_transpose/kernel/v
4:2 2(Adam/vae/decoder/conv2d_transpose/bias/v
D:B@@2,Adam/vae/decoder/conv2d_transpose_1/kernel/v
6:4@2*Adam/vae/decoder/conv2d_transpose_1/bias/v
D:B 2,Adam/vae/decoder/conv2d_transpose_2/kernel/v
6:42*Adam/vae/decoder/conv2d_transpose_2/bias/v
�2�
$__inference_vae_layer_call_fn_206617
$__inference_vae_layer_call_fn_206827�
���
FullArgSpec
args�
jself
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
?__inference_vae_layer_call_and_return_conditional_losses_206995
?__inference_vae_layer_call_and_return_conditional_losses_206720�
���
FullArgSpec
args�
jself
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
!__inference__wrapped_model_205818input_1"�
���
FullArgSpec
args� 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
(__inference_encoder_layer_call_fn_205928
(__inference_encoder_layer_call_fn_207030�
���
FullArgSpec
args�
jself
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
C__inference_encoder_layer_call_and_return_conditional_losses_207073
C__inference_encoder_layer_call_and_return_conditional_losses_206012�
���
FullArgSpec
args�
jself
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
1__inference_vector_quantizer_layer_call_fn_206073
1__inference_vector_quantizer_layer_call_fn_207081�
���
FullArgSpec
args�
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
L__inference_vector_quantizer_layer_call_and_return_conditional_losses_207132
L__inference_vector_quantizer_layer_call_and_return_conditional_losses_206132�
���
FullArgSpec
args�
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
(__inference_decoder_layer_call_fn_206431
(__inference_decoder_layer_call_fn_207167�
���
FullArgSpec
args�
jself
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
C__inference_decoder_layer_call_and_return_conditional_losses_207249
C__inference_decoder_layer_call_and_return_conditional_losses_206512�
���
FullArgSpec
args�
jself
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
$__inference_signature_wrapper_206795input_1"�
���
FullArgSpec
args� 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
)__inference_conv2d_2_layer_call_fn_207264�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
D__inference_conv2d_2_layer_call_and_return_conditional_losses_207281�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
__inference_loss_fn_0_207292�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_1_207303�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_2_207314�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
3__inference_conv2d_transpose_2_layer_call_fn_207329
3__inference_conv2d_transpose_2_layer_call_fn_207338�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_207378
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_207408�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
__inference_loss_fn_3_207419�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_4_207430�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_5_207441�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
'__inference_conv2d_layer_call_fn_207456�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
B__inference_conv2d_layer_call_and_return_conditional_losses_207473�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
)__inference_conv2d_1_layer_call_fn_207488�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
D__inference_conv2d_1_layer_call_and_return_conditional_losses_207505�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
1__inference_conv2d_transpose_layer_call_fn_207520
1__inference_conv2d_transpose_layer_call_fn_207529�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
L__inference_conv2d_transpose_layer_call_and_return_conditional_losses_207569
L__inference_conv2d_transpose_layer_call_and_return_conditional_losses_207599�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
3__inference_conv2d_transpose_1_layer_call_fn_207614
3__inference_conv2d_transpose_1_layer_call_fn_207623�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
N__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_207663
N__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_207693�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 �
!__inference__wrapped_model_205818�!"#$%&)*'(+,8�5
.�+
)�&
input_1���������  
� ";�8
6
output_1*�'
output_1���������  �
D__inference_conv2d_1_layer_call_and_return_conditional_losses_207505l#$7�4
-�*
(�%
inputs���������   
� "-�*
#� 
0���������  @
� �
)__inference_conv2d_1_layer_call_fn_207488_#$7�4
-�*
(�%
inputs���������   
� " ����������  @�
D__inference_conv2d_2_layer_call_and_return_conditional_losses_207281l%&7�4
-�*
(�%
inputs���������  @
� "-�*
#� 
0���������  @
� �
)__inference_conv2d_2_layer_call_fn_207264_%&7�4
-�*
(�%
inputs���������  @
� " ����������  @�
B__inference_conv2d_layer_call_and_return_conditional_losses_207473l!"7�4
-�*
(�%
inputs���������  
� "-�*
#� 
0���������   
� �
'__inference_conv2d_layer_call_fn_207456_!"7�4
-�*
(�%
inputs���������  
� " ����������   �
N__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_207663�)*I�F
?�<
:�7
inputs+���������������������������@
� "?�<
5�2
0+���������������������������@
� �
N__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_207693l)*7�4
-�*
(�%
inputs���������  @
� "-�*
#� 
0���������  @
� �
3__inference_conv2d_transpose_1_layer_call_fn_207614�)*I�F
?�<
:�7
inputs+���������������������������@
� "2�/+���������������������������@�
3__inference_conv2d_transpose_1_layer_call_fn_207623_)*7�4
-�*
(�%
inputs���������  @
� " ����������  @�
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_207378�+,I�F
?�<
:�7
inputs+��������������������������� 
� "?�<
5�2
0+���������������������������
� �
N__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_207408l+,7�4
-�*
(�%
inputs���������   
� "-�*
#� 
0���������  
� �
3__inference_conv2d_transpose_2_layer_call_fn_207329�+,I�F
?�<
:�7
inputs+��������������������������� 
� "2�/+����������������������������
3__inference_conv2d_transpose_2_layer_call_fn_207338_+,7�4
-�*
(�%
inputs���������   
� " ����������  �
L__inference_conv2d_transpose_layer_call_and_return_conditional_losses_207569�'(I�F
?�<
:�7
inputs+���������������������������@
� "?�<
5�2
0+��������������������������� 
� �
L__inference_conv2d_transpose_layer_call_and_return_conditional_losses_207599l'(7�4
-�*
(�%
inputs���������  @
� "-�*
#� 
0���������   
� �
1__inference_conv2d_transpose_layer_call_fn_207520�'(I�F
?�<
:�7
inputs+���������������������������@
� "2�/+��������������������������� �
1__inference_conv2d_transpose_layer_call_fn_207529_'(7�4
-�*
(�%
inputs���������  @
� " ����������   �
C__inference_decoder_layer_call_and_return_conditional_losses_206512q)*'(+,8�5
.�+
)�&
input_1���������  @
� "-�*
#� 
0���������  
� �
C__inference_decoder_layer_call_and_return_conditional_losses_207249o)*'(+,6�3
,�)
'�$
input���������  @
� "-�*
#� 
0���������  
� �
(__inference_decoder_layer_call_fn_206431d)*'(+,8�5
.�+
)�&
input_1���������  @
� " ����������  �
(__inference_decoder_layer_call_fn_207167b)*'(+,6�3
,�)
'�$
input���������  @
� " ����������  �
C__inference_encoder_layer_call_and_return_conditional_losses_206012q!"#$%&8�5
.�+
)�&
input_1���������  
� "-�*
#� 
0���������  @
� �
C__inference_encoder_layer_call_and_return_conditional_losses_207073o!"#$%&6�3
,�)
'�$
input���������  
� "-�*
#� 
0���������  @
� �
(__inference_encoder_layer_call_fn_205928d!"#$%&8�5
.�+
)�&
input_1���������  
� " ����������  @�
(__inference_encoder_layer_call_fn_207030b!"#$%&6�3
,�)
'�$
input���������  
� " ����������  @;
__inference_loss_fn_0_207292!�

� 
� "� ;
__inference_loss_fn_1_207303#�

� 
� "� ;
__inference_loss_fn_2_207314%�

� 
� "� ;
__inference_loss_fn_3_207419'�

� 
� "� ;
__inference_loss_fn_4_207430)�

� 
� "� ;
__inference_loss_fn_5_207441+�

� 
� "� �
$__inference_signature_wrapper_206795�!"#$%&)*'(+,C�@
� 
9�6
4
input_1)�&
input_1���������  ";�8
6
output_1*�'
output_1���������  �
?__inference_vae_layer_call_and_return_conditional_losses_206720�!"#$%&)*'(+,8�5
.�+
)�&
input_1���������  
� ";�8
#� 
0���������  
�
�	
1/0 �
?__inference_vae_layer_call_and_return_conditional_losses_206995�!"#$%&)*'(+,6�3
,�)
'�$
input���������  
� ";�8
#� 
0���������  
�
�	
1/0 �
$__inference_vae_layer_call_fn_206617k!"#$%&)*'(+,8�5
.�+
)�&
input_1���������  
� " ����������  �
$__inference_vae_layer_call_fn_206827i!"#$%&)*'(+,6�3
,�)
'�$
input���������  
� " ����������  �
L__inference_vector_quantizer_layer_call_and_return_conditional_losses_206132z8�5
.�+
)�&
input_1���������  @
� ";�8
#� 
0���������  @
�
�	
1/0 �
L__inference_vector_quantizer_layer_call_and_return_conditional_losses_207132t2�/
(�%
#� 
x���������  @
� ";�8
#� 
0���������  @
�
�	
1/0 �
1__inference_vector_quantizer_layer_call_fn_206073_8�5
.�+
)�&
input_1���������  @
� " ����������  @�
1__inference_vector_quantizer_layer_call_fn_207081Y2�/
(�%
#� 
x���������  @
� " ����������  @