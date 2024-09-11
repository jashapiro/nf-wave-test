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

workflow hello {
  take:
    names
  main:
    say_hello(names)
}
