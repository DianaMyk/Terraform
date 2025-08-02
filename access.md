# Homer Dashboard Access
Homer is configured for local network access only and requires SSH port forwarding for remote access.
Option 1: SSH Port Forwardin
Command:
ssh -i ~/.ssh/HC_key.pem -L 8080:localhost:8080 {$user}@{$server-ip}
Steps:
Open terminal on your local machine
Run the SSH command above
Enter your SSH password/key when prompted
Keep the SSH session open
Open browser and go to: http://localhost:8080

Option 2: Background SSH Tunnel
For persistent access without keeping terminal open:
ssh -i ~/.ssh/HC_key.pem -L 8080:localhost:8080 -N -f {$user}@{$server-ip}
To stop the background tunnel:
Find the process
ps aux | grep "ssh.*8080"
Kill the process 
kill PID


# VictoriaLogs Access
VictoriaLogs is configured for internet access and can be accessed directly or via SSH tunnel.
Direct Internet Access
URL: http://{$server-ip}:9428