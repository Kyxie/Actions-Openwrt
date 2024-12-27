import os
import paramiko
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
        try:
            # Create an SSH client
            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            
            # Connect to the PVE server
            ssh.connect(Constants.pve_host, username=Constants.pve_username, key_filename=Constants.pve_pem_path if Constants.pve_pem_path else None, password=Constants.pve_password)
            
            # Step 4: Define the decompression command (using gzip -d)
            # Decompress the .img.gz file
            decompression_command = f"gzip -d {Constants.pve_image_path}/{os.path.basename(Constants.local_image_path)}"
            
            # Execute the decompression command
            stdin, stdout, stderr = ssh.exec_command(decompression_command)
            exit_status = stdout.channel.recv_exit_status()
            
            if exit_status == 0:
                print("File decompression successful.")
            else:
                print("Error occurred during decompression.")
                print(stderr.read().decode())
            
            # Close the SSH connection
            ssh.close()
        
        except Exception as e:
            print(f"An error occurred during SSH connection: {e}")