node {
    stage("Git Check"){
		sh 'ls -ltr ./'
	    	sh 'ls -ltr ./cicd-webapp/'
    }

    stage("Docker build"){
        sh 'docker version'
        sh 'docker build -t asia.gcr.io/metallic-slider/metallic-slider:v11 .'
        sh 'docker image list'
	sh 'gcloud auth activate-service-account junkins-master@metallic-slider.iam.gserviceaccount.com --key-file=/var/lib/jenkins/metallic-slider-1b482ff0dbd1.json'
        sh 'gcloud auth configure-docker -q'
	sh 'gcloud auth list'
	sh 'docker push asia.gcr.io/metallic-slider/metallic-slider:v11'
    }
    stage('Rolling Update') {
            steps {
                echo 'gcp rolling update....'
                sh 'gcloud container clusters get-credentials metallic-slider-cluster --zone asia-south2-a --project metallic-slider'
                sh 'kubectl set image -n default deployment metallic-slider-1 metallic-slider-1=asia.gcr.io/metallic-slider/metallic-slider:v11'
            }
        }
  
}
