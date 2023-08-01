extends Resource

var function_string_key = {0:"Ne",1:"Ni",2:"Se",3:"Si",4:"Fe",5:"Fi",6:"Te",7:"Ti"}
enum Function {NE=0, NI=1, SE=2, SI=3, FE=4,FI=5,TE=6,TI=7}
enum Animal {BLAST,CONSUME,SLEEP,PLAY}

@export var main: Function
@export var second: Function
@export var third: Function
@export var fourth: Function

func get_functions():
	return [main,second,third,fourth]

func get_function_name(fn:Function):
	return function_string_key[fn]
