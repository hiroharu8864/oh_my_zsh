oh_my_zsh Cookbook
=================
Install oh-my-zsh to CentOS(vagrant)  
VagrantのCentOS環境にoh-my-zshをインストールする。

PreRequirement
-----
$ vagrant box add base64 CentOS-6.5-x86_64-v20140110.box

```vm.box
   cfg.vm.box = "base64"
```

```json
  "zsh_user":{
    "name":"vagrant",
    "home":"/home/vagrant"
  },
  "run_list":[
    "recipe[oh-my-zsh::default]"
  ]
```

License and Authors
-------------------
Authors: Hiroharu Tanaka
