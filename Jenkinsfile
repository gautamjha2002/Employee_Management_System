pipeline{
agent any
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
}
}

