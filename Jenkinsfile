pipeline {
    environment {
        registry = "davarski/test_image"
        registryCredential = "dockerhub"
        dockerImage = ''
      }

   agent any
   stages {
      stage('Build') {
         steps {
            git 'https://github.com/spring-projects/spring-petclinic.git'
            sh "mvn -Dmaven.test.failure.ignore=true clean package"
         }
      }
      stage('Pack') {
         steps {
             sh "echo 'From openjdk' > Dockerfile"
             sh "echo 'ADD target/spring-petclinic-*.jar /usr/src/' >> Dockerfile"
             sh "echo 'CMD java -jar /usr/src/*jar' >> Dockerfile"
             //sh "docker build -t spring-petclinic ."
             script {
                 dockerImage = docker.build("davarski/test_image")
                 docker.withRegistry( '', registryCredential ) {
                     dockerImage.push("${env.BUILD_ID}")
                     dockerImage.push("latest")
                 }
             }
             sh "docker rmi ${env.registry}:${env.BUILD_ID}"
         }
      }

      stage('Deploy') {
         steps {
              sh '''
                    if [ `docker ps -a | grep petclinic | wc -l` == 1 ]
                    then
                       echo "Redeploying with new version"
                       docker rm -f spring-petclinic
                    else
                       echo "New Deployment"
                    fi
                    docker run -d -p 9090:8080 --name spring-petclinic davarski/test_image:latest
                '''
         }
      }
   }
}
