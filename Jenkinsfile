pipeline {
    agent {
        docker {
            image 'loadimpact/k6:latest'
            // args '-v /usr/local/bundle:/usr/local/bundle -v /run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        K6_API_TOKEN=credentials("K6_API_TOKEN")
    }
    stages {
        stage('Performance Testing') {
            steps {
                echo 'Running K6 performance tests...'
                sh 'k6 cloud tests.js'
                echo 'Completed Running K6 performance tests!'
            }
        }
    }
}

