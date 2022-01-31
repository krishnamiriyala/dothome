alias nsxtf="cd /var/tmp/jenkins/jslave/nsx/cloud-service-manager/scripts/cloud-native-deployment/azure/igw"
alias nsx-qe="cd ~/nsx-qe/vmware-multicloud-tools"
alias nsx="cd ~/nsx"
alias tfmt="find . | grep -e \.tf$ -e \.tfvars$ | xargs -I {} terraform fmt {}"
alias gfmt="find . | grep -e \.go$ | xargs -t -I ARGS sh -c 'gofmt -w ARGS; goimports -w ARGS'"
export PATH=$PATH:/snap/bin:/usr/local/go/bin

alias kubescdc="kubectl --kubeconfig ~/.kube/scdc1-prod2-nsx-cloud-ci-runner.kubeconfig"
alias kubesaasdev="kubectl --kubeconfig ~/.kube/ara-antrea-saas-dev-env.kubeconfig"

alias gb="git branch"
alias gl="git log"
