pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
		pip install -r requirements.txt
		python setup.py build
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
		pytest
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
