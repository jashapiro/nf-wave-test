#!/usr/bin/env nextflow

// **** Included processes from modules ****
params.n = 10

process say_hello{
  container 'public.ecr.aws/openscpca/hello-python:latest'
  input:
    val name
  output:
    path "hello.txt"
  script:
    """
    hello.py $name > hello.txt
    """
}

workflow {
  names = Channel.of(1..params.n)
  say_hello(names)
   .subscribe{
     log.info(it.getText())
   }
}
