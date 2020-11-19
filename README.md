# NextFlow

Getting Started with NextFlow

Nextflow is a bioinformatics workflow manager that enables the development of portable and reproducible workflows.

## Terminology and Notes:


### Channels

Nextflow is a programming model in which processes communicate through channels.

### Process

Process looks like a function but is kind of a short script that can be run without specifically calling for it like it's in the case of a function.

Processes look like this:

`process sayHello {`
``
`   """`
`    echo 'Hello world!' > file`
`    """`
``
`}`

`process <name_of_process>`
`{body of the process`
` this contains: commands, input file, output file`
` `
`}`


1. Processes work in parallel. They don't follow any order.
2. To connect two processes you can use output of one as input for second process. Or you can also use channels.