node {
    stage("Git Check"){
		sh 'ls -ltr ./'
    }

    stage("Docker build"){
        sh 'docker version'
        sh 'cat cidc-webpage/Dockerfile | docker build -f - . -t asia.gcr.io/metallic-slider/metallic-slider:v11'
        sh 'docker image list'
	sh 'gcloud auth activate-service-account junkins-master@metallic-slider.iam.gserviceaccount.com --key-file=/var/lib/jenkins/metallic-slider-1b482ff0dbd1.json'
        sh 'gcloud auth configure-docker -q'
	sh 'gcloud auth list'
	sh 'docker push asia.gcr.io/metallic-slider/metallic-slider:v11'
    }

    stage("GKE Setup"){
                sh 'kubectl create deployment metallic-slider-1 --image=asia.gcr.io/metallic-slider/metallic-slider:v11'
                sh 'kubectl expose deployment metallic-slider-1 --type LoadBalancer --port 80 --target-port 80'
                sh 'kubectl get pods'
                sh 'kubectl get service'
     
    }
}
