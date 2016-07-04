# Alternatives to yamerl_the_fork

## YAML parsers

* [yamler](https://github.com/goertzenator/yamler):
  * Based on libyaml, wrapped in a NIF
  * Support YAML 1.1
  * Faster than yamerl_the_fork
  * Support Erlang atoms, however, single-quoted scalar are treated as atom, which breaks the YAML specifications
  * Don't support Erlang fun()

## JSON parsers

* `mochijson2`, provided by [Mochiweb](https://github.com/mochi/mochiweb):
  * A lot faster than yamerl_the_fork
