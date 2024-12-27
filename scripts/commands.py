import os
from constants import Constants

class Commands:
    @staticmethod
    def scp_from_menuconfig():
        """Download .config from the menuconfig server to the local directory."""
        command = (
            f"scp -i {Constants.config_pem_path} "
            f"{Constants.config_username}@{Constants.config_host}:{Constants.config_path} ."
        ) if Constants.config_pem_path else (
            f"sshpass -p '{Constants.config_password}' scp "
            f"{Constants.config_username}@{Constants.config_host}:{Constants.config_path} ."
        )
        os.system(command)

    @staticmethod
    def upload_image_to_pve():
        """Upload the local image file to the PVE server."""
        command = (
            f"scp -i {Constants.pve_pem_path} "
            f"{Constants.local_image_path} "
            f"{Constants.pve_username}@{Constants.pve_host}:{Constants.pve_image_path}"
        ) if Constants.pve_pem_path else (
            f"sshpass -p '{Constants.pve_password}' scp "
            f"{Constants.local_image_path} "
            f"{Constants.pve_username}@{Constants.pve_host}:{Constants.pve_image_path}"
        )
        os.system(command)