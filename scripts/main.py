from commands import Commands

def main():
    """Control script to execute specific commands."""
    print("Choose an operation:")
    print("1. Download .config from menuconfig server")
    print("2. Upload image to PVE server")
    choice = input("Enter your choice (1/2): ")

    if choice == '1':
        print("Downloading .config from menuconfig server...")
        Commands.scp_from_menuconfig()
        print("Download complete.")
    elif choice == '2':
        print("Uploading image to PVE server...")
        Commands.upload_image_to_pve()
        print("Upload complete.")
    else:
        print("Invalid choice. Exiting.")

if __name__ == '__main__':
    main()