# Install OpenShift
# sudo mkdir -p /opt/software/openshift
# cd /opt/software/openshift/
# sudo wget https://github.com/openshift/origin/archive/v1.3.0.tar.gz
# 
# sudo tar -xvf v1.3.0.tar.gz
# sudo rm v1.3.0.tar.gz
# 
# sudo ln -s /opt/software/openshift/origin-1.3.0/ current

# I was not able to get the above to work.  Let's try the Docker Approach:
sudo docker run -d --name "origin" \
        --privileged --pid=host --net=host \
        -v /:/rootfs:ro -v /var/run:/var/run:rw -v /sys:/sys -v /var/lib/docker:/var/lib/docker:rw \
        -v /var/lib/origin/openshift.local.volumes:/var/lib/origin/openshift.local.volumes \
        openshift/origin start
