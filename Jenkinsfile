def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
]

pipeline{
    agent any
    tools{
        maven "MAVEN"
    }
    environment{
        DOCKER_USER = 'gautamjha3112002'
    }
    stages{
        stage('Fetch code'){
            steps{
                git branch: 'master', url: 'https://github.com/gautamjha2002/Employee_Management_System.git'
            }
        }
        stage('Build'){
            steps{
                sh 'mvn install -Dmaven.test.skip=true'
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
                sh 'sudo docker build -t ${DOCKER_USER}/${JOB_NAME}:0.${BUILD_ID} --platform linux/amd64 .'
            }
        }

        stage('Push to DockerHub'){
            steps{
                timeout(time:5, unit:'DAYS'){
                    input message: 'Approve Push to docker Hub'
                }
                withCredentials([string(credentialsId: 'dockerlogin', variable: 'dockerlogin')]) {
                   sh 'sudo docker login -u gautamjha3112002 -p ${dockerlogin}'
                   sh 'sudo docker push ${DOCKER_USER}/${JOB_NAME}:0.${BUILD_ID}'
                }
            }
        }
    }
    post{
            always{
                echo 'Slack Notification.'
                slackSend channel: '#implementingdevops',
                color: COLOR_MAP[currentBuild.currentResult],
                message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
            }
        }
}


