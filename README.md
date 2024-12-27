# Scripts

A Linux machine is required to generate the `.config` file if your local PC's operating system is not Linux. Create a new file named `Constants.py` under the `\scripts` directory to store configuration details for the Linux and PVE servers.

```python
# ./scripts/constants.py
class Constants:
    # menuconfig_server, this is the server for generating .config file
    config_host = 'your_linux_host'
    config_username = 'admin'
    # If using .pem, keep this to `None`
    config_password = None
    # If using password, keep this to `None`
    config_pem_path = 'path_to_key.pem'
    # .config path
    config_path = f'/home/{config_username}/lede/.config'

    # PVE
    pve_host = 'your_pve_host'
    pve_username = 'root'
    pve_password = 'your_pve_password'
    pve_pem_path = None
    # Default image folder in PVE
    pve_image_path = f'/home/{pve_username}/var/lib/vz/template/iso/'

    # Local Machine, your PC
    # Suggest moving the downloaded image from GitHub Release to the project folder
    local_image_path = '../openwrt-x86-64-generic-ext4-rootfs.img.gz'
```
