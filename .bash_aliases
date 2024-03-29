alias tfmt="find . | grep -e \.tf$ -e \.tfvars$ | xargs -I {} terraform fmt {}"
alias gfmt="go vet ./... && go fix ./... && find . | grep -e \.go$ | xargs -t -I ARGS sh -c 'goimports -w ARGS; gofmt -w ARGS'"
alias kubescdc="kubectl --kubeconfig ~/.kube/scdc1-prod2-nsx-cloud-ci-runner.kubeconfig"
alias kubesaasdev="kubectl --kubeconfig ~/.kube/ara-antrea-saas-dev-env.kubeconfig"
alias dsc="kubectl --kubeconfig /home/miriyalak/easley-developer-stack-tool/devStackKubeConfig"
alias gb="git branch"
alias gl="git log"
alias gb_cleanup="git branch | grep -v main$ | grep -v master$ | xargs -I {} git branch -D {}"
