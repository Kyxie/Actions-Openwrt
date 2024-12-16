# Bats

由于我的本机为Windows，需要有一个Linux用于生成`.config`，在`\bats`下创建`settings.yaml`，用于保存Linux的信息

Linux存放git仓库的目录，`.config`也存放在这里：`/home/username/lede`

Linux解压image的目录：`/home/username/images`

```yaml
remote:
  host: ec2-34-228-239-98.compute-1.amazonaws.com
  username: admin
  config_path: /home/{username}/lede/.config
  image_path: /home/{username}/images/openwrt.qcow2

local:
  pem_path: ../../.pem
  config_path: ../
  image_path: ./openwrt-x86-64-generic-ext4-rootfs.img.gz
```

`updateConfig.bat`用于下载Linux生成的`.config`，保存到git仓库主目录（`..\`）

`uploadImage.bat`用于上传`openwrt-x86-64-generic-ext4-rootfs.img.gz`

`downloadImage.bat`用于下载Linux转化之后的`openwrt.qcow2`
