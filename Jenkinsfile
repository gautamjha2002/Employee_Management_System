pipeline{
agent any

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
}
