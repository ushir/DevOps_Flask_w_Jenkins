pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
		sh 'pip install -r requirements.txt'
		sh 'python setup.py build'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
		sh 'export PYTHONPATH=$PYTHONPATH:$WORKSPACE/src; pytest tests/'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
