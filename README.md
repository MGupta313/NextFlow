# NextFlow

Getting Started with NextFlow

Nextflow is a bioinformatics workflow manager that enables the development of portable and reproducible workflows.

[Cheat sheet]<https://gist.github.com/MGupta313/0f1c28d27af6b2ed239d95cde0a40c51>

## Terminology and Notes:

### Process

Process looks like a function but is kind of a short script that can be run without specifically calling for it like it's in the case of a function.
```
Processes look like this:

process <name_of_process>

{body of the process

 this contains: commands, input file, output file

}
```
###### Example:
```
 process sayHello {

   """
    echo 'Hello world!' > file

   """

}
```

A process may contain five definition blocks, respectively: _directives, inputs, outputs, when clause and finally the process script_. The syntax is defined as follows:
```
process < name > {

   [ directives ]

   input:
    < process inputs >

   output:
    < process outputs >

   when:
    < condition >

   [script|shell|exec]:
   < user script to be executed >

}
```

**NOTES:** 
1. Processes work in parallel. They don't follow any order.
2. To connect two processes you can use output of one as input for second process. Or you can also use channels.


#### Script

Script block contains the command to be executed.

1. A process can have only one script block. 
2. It must be the last statement of the process. 
3. After the input and output declarations in the process. 
4. The strings are executed as a Bash script.

**To use a script other than Bash**
```
process perlStuff {

    """
    #!/usr/bin/env perl

    print 'Hi there!' . '\n';
    """

}



process pyStuff {

    """
    #!/usr/bin/env python

    x = 'Hello'
    y = 'world!'
    print "%s - %s" % (x,y)
    """

}
```

### Channels

Nextflow is a programming model in which processes communicate through channels.

#### Channel types 
Nextflow distinguish two different kinds of channels: queue channels and value channels.

- Queue channel 
	- A queue channel is a non-blocking unidirectional FIFO queue which connects two processes or operators. 
	- The same queue channel cannot be used more than one time as process output and more then one time as process input.

- Value Channel
	- A value channel a.k.a. singleton channel by definition is bound to a single value and it can be read unlimited times without consuming its content.
	- For this reason a value channel can be used as input by more than one process.

Channels may be created implicitly by the process output(s) declaration or explicitly using the following channel factory methods.

The available factory methods are:

- create

- empty

- from

- fromPath

- fromFilePairs

- fromSRA

- value

- watchPath

### Input block

`<input qualifier> <input name> [from <source channel>] [attributes]`

**_input qualifiers_** declares the type of data to be received.

The qualifiers available are the ones listed below:
- val (any type of value)
- env
- file
- path
- stdin
- tuple (a group of input values)
- each (execute process for each entry in input collection)

### Output block

`<output qualifier> <output name> [into <target channel>, [channel, ...]] [attributes [, ...]]`

The qualifiers available are the ones listed below:
- val (any type of value)
- env
- file
- path
- stdout
- tuple (multiple values over the same channel)

##### Example:
```
#!/usr/bin/env nextflow
 
params.in = "$baseDir/data/sample.fa"
 
/*
 * split a fasta file in multiple files
 */
process splitSequences {
 
    input:
    path 'input.fa' from params.in
 
    output:
    path 'seq_*' into records
 
    """
    awk '/^>/{f="seq_"++d} {print > f}' < input.fa
    """
}
 
/*
 * Simple reverse the sequences
 */
process reverse {
 
    input:
    path x from records
     
    output:
    stdout into result
 
    """
    cat $x | rev
    """
}
 
/*
 * print the channel content
 */
result.subscribe { println it }
```

##### Note:

1. Input from user - `params.<name of parameter>`. Initialized with some value. It can be overridden by adding --in option to script command script.
2. Channel can be created using params.<name>
3. Channel can be input from user or fixed/hardcoded. Like params.range = 100 or methods = ['dna', 'rna', 'prot']
