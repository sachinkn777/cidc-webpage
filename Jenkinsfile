node {
    stage("Git Clone"){
        sh 'git clone https://github.com/sachinkn777/cidc-webpage.git'
		sh 'ls -ltr ./'
    }

    stage("Docker build"){
        sh 'docker version'
        sh 'cat cidc-webpage/Dockerfile | docker build -f - . -t asia.gcr.io/metallic-slider/metallic-slider:v1'
        sh 'docker image list'
	sh 'gcloud auth activate-service-account junkins-master@metallic-slider.iam.gserviceaccount.com --key-file=/var/lib/jenkins/metallic-slider-1b482ff0dbd1.json'
        sh 'gcloud auth configure-docker -q'
	sh 'gcloud auth list'
	sh 'docker push asia.gcr.io/metallic-slider/metallic-slider:v1'
    }

    stage("GKE Setup"){
   
                sh 'gcloud config set project metallic-slider'
                sh 'gcloud config set compute/region asia-south2'
                sh 'gcloud container clusters create metallic-gke-cluster --num-nodes=1 --zone=asia-south2-a'
                sh 'gcloud container clusters get-credentials metallic-gke-cluster'
                sh 'kubectl create deployment metallic-slider --image=asia.gcr.io/kubernetes-project-320712/metallic-slider:v1'
                sh 'kubectl expose deployment metallic-slider --type LoadBalancer --port 80 --target-port 80'
                sh 'kubectl get pods'
                sh 'kubectl get service'
     
    }
}
