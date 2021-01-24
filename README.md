# ubuntu-utils

Ubuntu utils
  - common utils for all Linux Distro have been split and migrated to [linux-utils](https://github.com/davidkhala/linux-utils)

## Notes
pipi
- aws-scripts-mon is about to become legacy
  - "--mem-used-incl-cache-buff": 如果包括此选项，则在报告 --mem-util、--mem-used 和 --mem-avail 的指标时，当前用于缓存和缓冲区的内存将计为“已用”。 
- manage linux processes https://www.howtogeek.com/107217/how-to-manage-processes-from-the-linux-terminal-10-commands-you-need-to-know/
- tail
  - follow pipeline: `tail -f`
  - get last line: `tail -1`
## TODO
- skipHostStrict seemingly success with $? == 1
```bash
PTY allocation request failed on channel 0
Hi davidkhala! You've successfully authenticated, but GitHub does not provide shell access.
Connection to github.com closed.

```
