node {
    checkout scm
    def testImage = docker.build("sandbox-image${env.BUILD_ID}")
}
