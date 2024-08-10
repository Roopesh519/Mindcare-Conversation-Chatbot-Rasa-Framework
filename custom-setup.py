import os
import subprocess

# Define your custom setup tasks
def install_packages():
    # Install additional packages if needed
    subprocess.check_call(["pip", "install", "-r", "Mindcare/requirement.txt"])

def setup_environment():
    # Set environment variables or perform other setup tasks
    os.environ["PORT"] = "8080"  # Example environment variable

if __name__ == "__main__":
    install_packages()
    setup_environment()
