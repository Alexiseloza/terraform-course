  #!/bin/bash
   echo "this is a TEST messagge" >~/mensaje.txt
   yum update -y
   yum install httpd -y 
   systemctl enable httpd
   systemctl start httpd

