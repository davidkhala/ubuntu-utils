Vnc server端操作
1. 安装 
  1. `sudo apt install tigervnc-standalone-server`
  1. $ `vncserver -geometry 1280x1024` 
  1. 输入校验密码，用于vnc客户端，然后vncserver会在后台运行

VNC Client段操作
1. Establish SSH tunnel from localhost to remote vnc server
  a. $ `ssh -L 5901:localhost:5901 -i <vncserver private key> opc@<vncserver>`
  b. tunnel会在这个terminal里持续存在，并作为localhost:5901的服务，不要关
2. 打开vnc可视化软件如VNC viewer，连接到localhost:5901






