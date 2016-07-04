# yamerl_the_fork Recipe: Error handling

yamerl_the_fork **throws an exception when an error occurs**.

1. Start the yamerl_the_fork application. This is a mandatory step.

  ```erlang
  application:start(yamerl_the_fork).
  ```

2. You're now ready to parse a serialized document:

  * To parse an in-memory string or binary:

    ```erlang
    -include_lib("yamerl_the_fork/include/yamerl_the_fork_errors.hrl").

    % ...

    try
      Documents = yamerl_the_fork_constr:string("Hello!"),
      % Documents is a list of constructed documents.
      Documents
    catch
      throw:#yamerl_the_fork_exception{errors = Errors} ->
        % Do something with the exception.
        Errors
    end.
    ```

As you can see, the `#yamerl_the_fork_exception{}` record embeds all encountered errors:
```erlang
#yamerl_the_fork_exception{
  errors = [] % List of errors.
}.
```

Errors are records where the two first members are always:

1. `type`, either `error` or `warning`;
2. `text`, a human-readable error message.

Following members depend on the error record. Two records are currently defined:
* `#yamerl_the_fork_invalid_option{}`;
* `#yamerl_the_fork_parsing_error{}`.

> For further informations, see:
> * [yamerl_the_fork\_constr module reference](../reference-manual/module-yamerl_the_fork_constr.md);
