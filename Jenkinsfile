pipeline {
    agent {
		label "Agent-1"
	}

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }

    post {
         always { 
            echo 'I will always say Hello again!'
            deleteDir()
        }

        success {
            echo "This build is completed successfully"
        }
        failure { 
            echo 'Hello Failure'
        }
    }
}