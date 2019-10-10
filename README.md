# ubuntu-utils

## Notes

- aws-scripts-mon is about to become legacy
  - "--mem-used-incl-cache-buff": 如果包括此选项，则在报告 --mem-util、--mem-used 和 --mem-avail 的指标时，当前用于缓存和缓冲区的内存将计为“已用”。 
- `bash -s`
    If this option is present, or if no arguments remain after option processing, then commands are read from the standard input. This option allows the positional parameters to be set when invoking an interactive shell or when reading input through a pipe.
- Date formatter in shell  
https://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/
- To remove all the contents of the folder but not the folder itself:
  ```
  rm -rf /path/to/directory/*
  ```
## TODO
- skipHostStrict seemingly success with $? == 1
```bash
PTY allocation request failed on channel 0
Hi davidkhala! You've successfully authenticated, but GitHub does not provide shell access.
Connection to github.com closed.

```
