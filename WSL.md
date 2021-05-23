### WSL & Docker consuming too much RAM?

1. In your user folder create a file named ```.wslconfig```
2. Edit ```.wslconfig``` and add:

  ```
  [wsl2]
  memory=4GB # Limits VM memory in WSL 2 to 4 GB
  processors=5 # Makes the WSL 2 VM use two virtual processors
  ```

3. Save and exit ```.wslconfig```
4. Fire up PowerShell with Admin rights
5. In powershell enter:
  ```
  Restart-Service LxssManager
  ```
6. Restart Docker
