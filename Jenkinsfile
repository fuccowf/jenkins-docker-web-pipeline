pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Клонирование Git репозитория
                    git 'https://github.com/fuccowf/jenkins-docker-web-pipeline.git'

                    // Сборка Docker образа
                    sh 'docker build -t my-httpd-server .'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Запуск контейнера для тестирования
                    sh 'docker run --rm -d -p 8080:80 --name my-running-app my-httpd-server'
                    
                    // Проверка ответа сервера
                    sh 'curl localhost:8080'
                }
            }
        }
    }
}
