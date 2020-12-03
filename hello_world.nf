#!/usr/bin/env nextflow

// Creates a channel giving string values

str = Channel.from('hello', 'hi', 'namaste', 'hola')


process printHello {

   input:
   val str 

   output: 
   stdout into result

   """
   echo $str
   """
}	

result.println()