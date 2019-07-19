pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
		sh """pip3 install -r requirements.txt
		      python3 setup.py build"""
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
		sh """export PYTHONPATH=$WORKSPACE/src
		      pytest tests"""
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }
}

