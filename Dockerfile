FROM jenkinsci/jnlp-slave

USER root

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
  && chmod +x kubectl \
  && mv kubectl /usr/local/bin/kubectl

RUN curl -LO https://kubernetes-helm.storage.googleapis.com/helm-v2.2.3-linux-amd64.tar.gz \
 && tar -xf helm-v2.2.3-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin/helm \
 && chmod +x /usr/local/bin/helm \
 && rm -fr linux-amd64

USER jenkins
