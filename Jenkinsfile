def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
]



pipeline{
agent any
environment{
        DOCKER_USER = 'gautamjha3112002'
        JOB_NAMES = $JOB_NAME.toLowerCase

    }
stages{
stage ('Fetch code'){
steps{
git branch: 'master', url: 'https://github.com/gautamjha2002/Employee_Management_System.git'
}
}
stage('Build'){
steps{
sh 'mvn install -Dmaven.test.skip=true '
}
}
stage ('CODE ANALYSIS WITH CHECKSTYLE'){
            steps{
                sh 'mvn checkstyle:checkstyle'
            }
            post{
                success{
                    echo 'Analysis Result Generated'
                }
            }
        }
stage('Building Docker Image'){
            steps{
                sh 'docker build -t ${DOCKER_USER}/${JOB_NAMES}:0.${BUILD_ID} .'
            }
        }
        stage('Push to DockerHub'){
            steps{
                timeout(time:5, unit:'DAYS'){
                    input message: 'Approve Push to docker Hub'
                }
                withCredentials([string(credentialsId: 'dockerlogin', variable: 'dockerlogin')]) {
                   sh 'docker login -u gautamjha3112002 -p ${dockerlogin}'
                   sh 'docker push ${DOCKER_USER}/${JOB_NAME}:0.${BUILD_ID}'
                }
            }
        }
    }
}


