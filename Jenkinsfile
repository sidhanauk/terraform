// Uses Declarative syntax to run commands inside a container.
pipeline {
    agent {
        kubernetes {
            yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: helm
    image: alpine/helm
    command:
    - sleep
    args:
    - infinity
  - name: terraform
    image: hashicorp/terraform
    command:
    - sleep
    args:
    - infinity
    env:
      - name: AWSKEY
        valueFrom:
          secretKeyRef:
            name: aws
            key: AWSKEY
      - name: AWSTOKEN
        valueFrom:
          secretKeyRef:
            name: aws
            key: AWSTOKEN
  - name: shell
    image: ubuntu
    command:
    - sleep
    args:
    - infinity
'''
            defaultContainer 'shell'
        }
    }
    stages {
        stage('Main') {
            steps{
            container('terraform'){
                sh 'terraform version && env'
            }
        }
    }
  }
}

