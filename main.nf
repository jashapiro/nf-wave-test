#!/usr/bin/env nextflow

params.n = 10

// **** Included processes from modules ****
include { hello } from './modules/hello'

workflow {
  names = Channel.of(1..params.n)
  hello(names)
}
